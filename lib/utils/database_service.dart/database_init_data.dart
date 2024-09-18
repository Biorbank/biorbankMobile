part of 'database_service.dart';

NetworkInformation bitcoin = NetworkInformation(
  id: 0,
  rpcUrl: "",
  explorerUrl: "https://www.blockchain.com/explorer/transactions/btc",
  chainId: 0,
  name: 'Bitcoin',
);
NetworkInformation ethereum = NetworkInformation(
  // sepolia
  id: 1,
  rpcUrl: Env.ethereumRpcUrl, // sepolia Ethereum rpcURL
  explorerUrl: "https://etherscan.io/tx",
  chainId: 1,
  name: 'Ethereum',
);
NetworkInformation binance = NetworkInformation(
  id: 2,
  rpcUrl: Env.binanceRpcUrl,
  explorerUrl: "https://bscscan.com/tx",
  chainId: 56,
  name: 'Binance',
);
NetworkInformation polygon = NetworkInformation(
  id: 3,
  rpcUrl: Env.polygonRpcUrl,
  explorerUrl: "https://polygonscan.com/tx",
  chainId: 137,
  name: 'Polygon',
);
NetworkInformation hedera = NetworkInformation(
  id: 4,
  rpcUrl: Env.hederaRpcUrl,
  explorerUrl: "https://hederaexplorer.io/search-details/transaction",
  chainId: 0,
  name: "Hedera",
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

CryptoAssetInformation rivia = CryptoAssetInformation(
    type: AssetType.token,
    tokenId: "0.0.1320271",
    name: "Rivia USD",
    symbol: "rUSD",
    decimal: 6,
    networkId: 4,
    cmcId: Constants.riviaTokenFakeCmcId,
    logo: "assets/img/cryptoicon/1320271.png");
CryptoAssetInformation bslbep20 = CryptoAssetInformation(
    type: AssetType.token,
    tokenId: "0x0af55d5ff28a3269d69b98680fd034f115dd53ac",
    name: "BankSocial",
    symbol: "BSL",
    decimal: 8,
    networkId: 2,
    cmcId: 10102,
    logo: "assets/img/cryptoicon/10102.png");
CryptoAssetInformation bslhts = CryptoAssetInformation(
    type: AssetType.token,
    tokenId: Constants.bslHtsTokenId,
    name: "BankSocial",
    symbol: "BSL",
    decimal: 8,
    networkId: 4,
    cmcId: Constants.bslHtsTokenFakeCmcId,
    logo: "assets/img/cryptoicon/10102.png");
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