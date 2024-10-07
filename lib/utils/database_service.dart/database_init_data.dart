part of 'database_service.dart';

NetworkInformation bitcoin = NetworkInformation(
  id: 0,
  rpcUrl: "",
  explorerUrl: "https://www.blockchain.com/explorer/transactions/btc",
  chainId: 0,
  name: 'Bitcoin',
  logo: "assets/img/cryptoicon/1.png",
);

NetworkInformation ethereum = NetworkInformation(
  id: 1,
  rpcUrl: Env.ethereumRpcUrl,
  explorerUrl: "https://etherscan.io/tx",
  chainId: 1,
  name: 'Ethereum',
  logo: "assets/img/cryptoicon/1027.png",
);
NetworkInformation binance = NetworkInformation(
  id: 2,
  rpcUrl: Env.binanceRpcUrl,
  explorerUrl: "https://bscscan.com/tx",
  chainId: 56,
  name: 'Binance',
  logo: "assets/img/cryptoicon/1839.png",
);
NetworkInformation polygon = NetworkInformation(
  id: 3,
  rpcUrl: Env.polygonRpcUrl,
  explorerUrl: "https://polygonscan.com/tx",
  chainId: 137,
  name: 'Polygon',
  logo: "assets/img/cryptoicon/3890.png",
);
/* NetworkInformation hedera = NetworkInformation(
  id: 4,
  rpcUrl: Env.hederaRpcUrl,
  explorerUrl: "https://hederaexplorer.io/search-details/transaction",
  chainId: 0,
  name: "Hedera",

);*/
NetworkInformation injective = NetworkInformation(
  id: 7,
  rpcUrl: "https://sentry.tm.injective.network:443",
  explorerUrl: "https://testnet.explorer.injective.network/transaction/",
  chainId: 0,
  name: "Injective",
);
NetworkInformation thorchain = NetworkInformation(
  id: 9,
  rpcUrl: Env.injectiveRpcUrl,
  explorerUrl: "https://thorchain.net/tx/",
  chainId: 0,
  name: "Thorchain",
);
NetworkInformation cosmos = NetworkInformation(
  id: 10,
  rpcUrl: "https://cosmos-rpc.publicnode.com:443",
  explorerUrl: "https://www.mintscan.io/cosmos/tx/",
  chainId: 0,
  name: "Cosmos",
);
NetworkInformation kujira = NetworkInformation(
  id: 11,
  rpcUrl: "https://kujira-rpc.publicnode.com:443",
  explorerUrl: "https://finder.kujira.network/kaiyo-1/tx/",
  chainId: 0,
  name: "Kujira",
);
NetworkInformation litecoin = NetworkInformation(
  id: 8,
  rpcUrl: "",
  explorerUrl: "https://blockchair.com/litecoin/transactions",
  chainId: 2,
  name: 'Litecoin',
);
NetworkInformation sepolia = NetworkInformation(
  // sepolia
  id: 5,
  rpcUrl: Env.sepoliaRpcUrl, // sepolia Ethereum rpcURL
  explorerUrl: "https://sepolia.etherscan.io/tx",
  chainId: 11155111,
  name: 'Sepolia Ethereum',
);
NetworkInformation solana = NetworkInformation(
  id: 6,
  rpcUrl: Env.solanaRpcUrl,
  explorerUrl: "https://solscan.io/tx",
  chainId: 901,
  name: "Solana",
  logo: "assets/img/cryptoicon/4646.png",
);
CryptoAssetInformation btccoin = CryptoAssetInformation(
    networkId: 0,
    type: AssetType.coin,
    tokenId: "",
    name: "BTC",
    symbol: "BTC",
    decimal: 8,
    cmcId: 1,
    logo: "assets/img/cryptoicon/1.png");

CryptoAssetInformation ethcoin = CryptoAssetInformation(
    networkId: 1,
    type: AssetType.coin,
    tokenId: "",
    name: "ETH",
    symbol: "ETH",
    decimal: 18,
    cmcId: 1027,
    logo: "assets/img/cryptoicon/1027.png");
CryptoAssetInformation usdterc20 = CryptoAssetInformation(
    type: AssetType.token,
    tokenId:
        "0xdac17f958d2ee523a2206206994597c13d831ec7", // sepolia Ethereum USDT
    name: "Tether USD",
    symbol: "USDT",
    decimal: 6,
    networkId: 1,
    cmcId: 825,
    logo: "assets/img/cryptoicon/825.png");
CryptoAssetInformation bnbcoin = CryptoAssetInformation(
    networkId: 2,
    type: AssetType.coin,
    tokenId: "",
    name: "BNB",
    symbol: "BNB",
    decimal: 18,
    cmcId: 1839,
    logo: "assets/img/cryptoicon/1839.png");
CryptoAssetInformation busdtoken = CryptoAssetInformation(
    networkId: 2,
    type: AssetType.token,
    tokenId: "0xe9e7cea3dedca5984780bafc599bd69add087d56",
    name: "Binance USD",
    symbol: "BUSD",
    decimal: 18,
    cmcId: 4687,
    logo: "assets/img/cryptoicon/4687.png");
CryptoAssetInformation maticcoin = CryptoAssetInformation(
    networkId: 3,
    type: AssetType.coin,
    tokenId: "",
    name: "MATIC",
    symbol: "MATIC",
    decimal: 18,
    cmcId: 3890,
    logo: "assets/img/cryptoicon/3890.png");

CryptoAssetInformation hbarcoin = CryptoAssetInformation(
    networkId: 4,
    type: AssetType.coin,
    tokenId: "",
    name: "HBAR",
    symbol: "HBAR",
    decimal: 8,
    cmcId: 4642,
    logo: "assets/img/cryptoicon/4642.png");

CryptoAssetInformation solanacoin = CryptoAssetInformation(
    networkId: 6,
    type: AssetType.coin,
    tokenId: "",
    name: "SOL",
    symbol: "SOL",
    decimal: 8,
    cmcId: 5426,
    logo: "assets/img/cryptoicon/5426.png");

CryptoAssetInformation injectivecoin = CryptoAssetInformation(
    networkId: 7,
    type: AssetType.coin,
    tokenId: "",
    name: "INJ",
    symbol: "INJ",
    decimal: 8,
    cmcId: 7226,
    logo: "assets/img/cryptoicon/7226.png");
CryptoAssetInformation ltccoin = CryptoAssetInformation(
    networkId: 8,
    type: AssetType.coin,
    tokenId: "",
    name: "LTC",
    symbol: "LTC",
    decimal: 8,
    cmcId: 2,
    logo: "assets/img/cryptoicon/2.png");
CryptoAssetInformation thorcoin = CryptoAssetInformation(
    networkId: 9,
    type: AssetType.coin,
    tokenId: "",
    name: "Thorchain",
    symbol: "RUNE",
    decimal: 8,
    cmcId: 4157,
    logo: "assets/img/cryptoicon/4157.png");

CryptoAssetInformation cosomoscoin = CryptoAssetInformation(
    networkId: 10,
    type: AssetType.coin,
    tokenId: "",
    name: "Cosmos",
    symbol: "ATOM",
    decimal: 8,
    cmcId: 3794,
    logo: "assets/img/cryptoicon/3794.png");
CryptoAssetInformation kujiracoin = CryptoAssetInformation(
    networkId: 11,
    type: AssetType.coin,
    tokenId: "",
    name: "Kujira",
    symbol: "KUJI",
    decimal: 8,
    cmcId: 15185,
    logo: "assets/img/cryptoicon/15185.png");