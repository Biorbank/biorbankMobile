
// Create a card
import 'package:biorbank/utils/networks/pay_with_moon_api_service.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';

import 'logger_service.dart';

// To Create new Card
Future<PayWitMoonCard> fetchCard(String cardId) async {
  LogService.logger.i("Card ID: $cardId");
  try {
    final response = await PayWithMoonApiService.instance.dio
        .get("/v1/api-gateway/card/$cardId");
    if ([200, 201].contains(response.statusCode)) {
      final card = PayWitMoonCard.fromJson(response.data);
      return card;
    }
  } catch (e) {
    LogService.logger.e("Exception during call fetchCard $e");
  }
  return PayWitMoonCard();
}
// To Create new Card
Future<PayWitMoonCard> createCard() async {
  LogService.logger.i("createCard Method called");
  try {
    final response = await PayWithMoonApiService.instance.dio
        .post("/v1/api-gateway/card");
    if ([200, 201].contains(response.statusCode)) {
      final card = PayWitMoonCard.fromJson(response.data);
      return card;
    }
  } catch (e) {
    LogService.logger.e("Exception during call fetchCard $e");
  }
  return PayWitMoonCard();
}
// To Get Transactions of the card
Future<List<PayWithMoonTransaction>> fetchCardTransactions(String cardId, int currentPage, int perPage) async {
  LogService.logger.i("Fetching transactions for Card ID: $cardId");
  try {
    final response = await PayWithMoonApiService.instance.dio.get(
      "/v1/api-gateway/card/$cardId/transactions?currentPage=$currentPage&perPage=$perPage",
    );
    if ([200, 201].contains(response.statusCode)) {
      final List<dynamic> transactionsData = response.data['transactions'];
      List<PayWithMoonTransaction> transactions = transactionsData.map((data) {
        return PayWithMoonTransaction.fromJson(data);
      }).toList();

      return transactions;
    }
  } catch (e) {
    LogService.logger.e("Exception during fetchCardTransactions: $e");
  }
  return [];
}
// For Card Block and unBlock
Future<String> freezeCard(String cardId, bool frozen) async {
  LogService.logger.i("Freezing Card ID: $cardId");
  try {
    final response = await PayWithMoonApiService.instance.dio.patch(
      "/v1/api-gateway/card/$cardId/freeze",
      data: {
        "frozen": frozen,
      },
    );

    if ([200, 204].contains(response.statusCode)) {
      return response.data['message']; // Return success message
    }
  } catch (e) {
    LogService.logger.e("Exception during freezeCard: $e");
  }
  return "Failed to update card status"; // Fallback message
}


