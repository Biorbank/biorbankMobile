class MyAccountModel {
  final double percent;
  final String title;
  final double currentAmt;
  final double differentAmt;
  final double totalDifferentInPercentage;
  final bool isProfit;

  MyAccountModel({
    this.percent = 0.0,
    required this.title,
    this.currentAmt = 0.0,
    this.differentAmt = 0.0,
    this.totalDifferentInPercentage = 0.0,
    this.isProfit = false,
  });
}
