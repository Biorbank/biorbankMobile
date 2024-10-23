class Invoice {
  final String id;
  final String address;
  final String usdAmountOwned;
  final String cryptoAmountOwed;
  final int exchangeRateLockExpiration;
  final String currency;
  final String blockchain;

  Invoice({
    required this.id,
    required this.address,
    required this.usdAmountOwned,
    required this.cryptoAmountOwed,
    required this.exchangeRateLockExpiration,
    required this.currency,
    required this.blockchain,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    final invoiceData = json['invoice'];
    return Invoice(
      id: invoiceData['id'],
      address: invoiceData['address'],
      usdAmountOwned: invoiceData['usdAmountOwned'],
      cryptoAmountOwed: invoiceData['cryptoAmountOwed'],
      exchangeRateLockExpiration: invoiceData['exchangeRateLockExpiration'],
      currency: invoiceData['currency'],
      blockchain: invoiceData['blockchain'],
    );
  }
}
