import 'package:biorbank/utils/bloc/transactiontracker/transaction_history_impl.dart';
import 'package:biorbank/utils/constants/constants.dart';
import 'package:biorbank/utils/env/env.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/models/transaction_detail_model.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/service/blockchain_service.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
part 'database_init_data.dart';

Future<dynamic> onConfigure(Database db) async {
  await db.execute('PRAGMA foreign_keys = ON');
}

class DatabaseService {
  static String? dbPath;
  Database? _db;

  static DatabaseService? _instance;
  static Future<String> get databasePath async {
    dbPath ??= await getDatabasesPath();
    return dbPath ?? (throw Exception('Could not get database path'));
  }

  Database get database {
    return _db ?? (throw Exception('Database not initialized'));
  }

  static DatabaseService get instance {
    _instance ??= DatabaseService();
    return _instance!;
  }

  Future<int> insertTransactionHistory(
      TransactionHistoryImpl transactionHistory) async {
    Map<String, dynamic> detail = transactionHistory.toMap();
    // When saving to the db, increase the index by 1
    detail['assetIndex'] = detail['assetIndex'] + 1;
    return (await database.insert('TransactionHistory', detail));
  }

  Future<int> updateTransactionHistory(
      TransactionHistoryImpl transactionHistory) async {
    return (await database.rawUpdate(
        'UPDATE TransactionHistory SET status = ? WHERE txHash =?',
        [1, transactionHistory.txHash]));
  }

  Future<List<TransactionHistoryImpl>> get getAllTransactionHistory async {
    final List<Map<String, dynamic>> result = await database.rawQuery(
        'SELECT t.*, a.networkId FROM TransactionHistory t INNER JOIN Asset a ON t.assetIndex = a.id');

    return List.generate(result.length, ((i) {
      return TransactionHistoryImpl(
          type: result[i]['type'] == 0
              ? TransactionType.send
              : TransactionType.receive,
          status: result[i]['status'] == -1
              ? TransactionStatus.pending
              : result[i]['status'] == 1
                  ? TransactionStatus.completed
                  : TransactionStatus.failed,
          txHash: result[i]['txHash'],
          // When restoring from db, decrease the index by 1
          assetIndex: result[i]['assetIndex'] - 1,
          info: TransactionDetail(
            amount: result[i]['amount'],
            from: result[i]['sender'],
            to: result[i]['recipient'],
          ),
          networkFee: result[i]['networkFee'],
          timeStamp: DateTime.parse(result[i]['timeStamp']),
          bhelper: BlockchainService.instance
              .getHelperByNetworkId(result[i]['networkId']));
    }));
  }

  Future<int> importCryptoAsset(CryptoAssetInformation cryptoAsset) async {
    return (await database.insert('Asset', cryptoAsset.toMap()));
  }

  Future<int> toggleAssetVisibilityByIndex(int value, int index) async {
    // In sqllite, index starts from 1
    return (await database.rawUpdate(
        'UPDATE Asset SET hidden = ? WHERE id =?', [value, index + 1]));
  }

  Future<List<CryptoAssetInformation>> get getAllAssets async {
    final List<Map<String, dynamic>> result = await database.query('Asset');
    return List.generate(result.length, (i) {
      return CryptoAssetInformation(
          networkId: result[i]['networkId'],
          type: result[i]['type'] == 0 ? AssetType.coin : AssetType.token,
          tokenId: result[i]['tokenId'],
          hidden: result[i]['hidden'],
          name: result[i]['name'],
          symbol: result[i]['symbol'],
          decimal: result[i]['decimal'],
          cmcId: result[i]['cmcId'],
          logo: result[i]['logo']);
    });
  }

  Future<List<NetworkInformation>> get getAllNetworks async {
    final List<Map<String, dynamic>> result = await database.query('Network');
    return List.generate(result.length, (i) {
      return NetworkInformation(
          id: result[i]['id'],
          chainId: result[i]['chainId'],
          name: result[i]['name'],
          rpcUrl: result[i]['rpcUrl'],
          explorerUrl: result[i]['explorerUrl']);
    });
  }

  Future<List<int>> get currentBlockNumbers async {
    List<Map<String, dynamic>> maps = await database.query('Network');
    return maps.map((e) => (e['blockHeight'] as int)).toList();
  }

  Future<int> updateBlockHeightByIndex(int height, int index) async {
    return (await database.rawUpdate(
        'UPDATE Network SET blockHeight = ? WHERE id =?', [height, index]));
  }

  Future<NetworkInformation> getNetworkByID(int index) async {
    List<Map<String, dynamic>> maps =
        await database.query('Network', where: 'id=?', whereArgs: [index]);
    Map<String, dynamic> result = maps.first;
    NetworkInformation asset = NetworkInformation(
        id: result['id'],
        chainId: result['chainId'],
        name: result['name'],
        rpcUrl: result['rpcUrl'],
        explorerUrl: result['explorerUrl']);

    return asset;
  }

  Future<void> initDB() async {
    try {
      if (_db != null) {
        await _db!.close();
      }
      //Wallet does not exist
      if (!AppHelper.walletService.isWalletExist) return;
      String path = await databasePath;
      _db = await openDatabase(
          join(path, "${AppHelper.walletService.currentWallet.id}.db"),
          version: 2,
          onConfigure: onConfigure, onCreate: (db, version) {
        var batch = db.batch();
        _createNetworkTable(batch);
        batch.commit();
        _createAssetTable(batch);
        batch.commit();
        _createTransactionHistoryTable(batch);
        batch.commit();
      }, onOpen: (db) async {
        // var batch = db.batch();
        // _createNetworkTable(batch);
        // batch.commit();
        // _createAssetTable(batch);
        // batch.commit();
        // _createTransactionHistoryTable(batch);
        // batch.commit();
      });
    } catch (e) {
      LogService.logger.e('Database init error ${e}');
    }
  }

// TODO legacy wallet
  Future<void> _createNetworkTable(Batch db) async {
    db.execute('DROP TABLE IF EXISTS Network');
    db.execute('''CREATE TABLE Network (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          rpcUrl TEXT,
          explorerUrl TEXT,
          chainId INTEGER,
          name TEXT,
          blockHeight INT DEFAULT 0
          )''');

    db.insert('Network', bitcoin.toMap());
    db.insert('Network', ethereum.toMap());
    db.insert('Network', binance.toMap());
    db.insert('Network', polygon.toMap());
    db.insert('Network', hedera.toMap());
  }

  Future<void> _createAssetTable(Batch db) async {
    db.execute('DROP TABLE IF EXISTS Asset');
    db.execute('''CREATE TABLE Asset (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          hidden INTEGER DEFAULT 0,
          networkId INTEGER,
          type INTEGER,
          tokenId TEXT,
          name TEXT,
          symbol TEXT,
          decimal INTEGER,
          cmcId INTEGER,
          logo TEXT,
          FOREIGN KEY (networkId) REFERENCES Network(id) ON DELETE CASCADE)''');
    if (!AppHelper.walletService.currentWallet.isLegacyWallet) {
      db.insert('Asset', btccoin.toMap());
    }
    db.insert('Asset', ethcoin.toMap());
    if (!AppHelper.walletService.currentWallet.isLegacyWallet) {
      db.insert('Asset', hbarcoin.toMap());
    }
    db.insert('Asset', usdterc20.toMap());
    db.insert('Asset', bslbep20.toMap());
    if (!AppHelper.walletService.currentWallet.isLegacyWallet) {
      db.insert('Asset', rivia.toMap());
      // db.insert('Asset', bslhts.toMap());
    }

    db.insert('Asset', bnbcoin.toMap());
    db.insert('Asset', maticcoin.toMap());
  }

  Future<void> _createTransactionHistoryTable(Batch db) async {
    db.execute('DROP TABLE IF EXISTS TransactionHistory');
    db.execute(
        '''CREATE TABLE TransactionHistory (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type INTEGER,
    status INTEGER,
    txHash TEXT UNIQUE,
    assetIndex INTEGER,
    sender TEXT,
    recipient TEXT,
    amount REAL,
    networkFee REAL,
    timeStamp TEXT,
    FOREIGN KEY (assetIndex) REFERENCES Asset(id) ON DELETE CASCADE)''');
  }
}
