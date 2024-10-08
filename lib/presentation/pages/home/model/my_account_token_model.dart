class MyAccountTokenModel {
  final String img;
  final String title;
  final String title2;
  final double amount;
  final double priceInUSD;
  final double percentChangeday;
  final bool isProfit;

  MyAccountTokenModel({
    required this.img,
    required this.title,
    required this.title2,
    required this.amount,
    required this.priceInUSD,
    required this.percentChangeday,
    required this.isProfit,
  });
}
