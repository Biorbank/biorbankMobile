// Create a card
import 'package:biorbank/utils/models/CardProduct.dart';
import 'package:biorbank/utils/models/PurchaseRequest.dart';
import 'package:biorbank/utils/models/gift_card_product.dart';
import 'package:biorbank/utils/models/gift_card_request.dart';
import 'package:biorbank/utils/models/gift_card_response.dart';
import 'package:biorbank/utils/networks/pay_with_moon_api_service.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';

import '../models/Invoice.dart';
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
Future<PayWitMoonCard> createCard(String prodId) async {
  LogService.logger.i("createCard Method called");
  try {
    final response =
    await PayWithMoonApiService.instance.dio.post("/v1/api-gateway/card");
    if ([200, 201].contains(response.statusCode)) {
      final card = PayWitMoonCard.fromJson(response.data);
      return card;
    }
  } catch (e) {
    LogService.logger.e("Exception during call fetchCard $e");
  }
  return PayWitMoonCard();
}

//To Add Balance
Future<PayWitMoonCard> addBalance(String cardId) async {
  LogService.logger.i("Card ID: $cardId");
  try {
    final response = await PayWithMoonApiService.instance.dio
        .get("/v1/api-gateway/card/$cardId/add-balance");
    if ([200, 201].contains(response.statusCode)) {
      final card = PayWitMoonCard.fromJson(response.data);
      return card;
    }
  } catch (e) {
    LogService.logger.e("Exception during call fetchCard $e");
  }
  return PayWitMoonCard();
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

// To Get Transactions of the card
Future<List<PayWithMoonTransaction>> fetchCardTransactions(
    String cardId, int currentPage, int perPage) async {
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

Future<List<CardProduct>> fetchCardProducts(
    int currentPage, int perPage) async {
  LogService.logger.i("Fetching products");
  try {
    final response = await PayWithMoonApiService.instance.dio.get(
        '/v1/api-gateway/card/card-products?currentPage=$currentPage&perPage=$perPage');
    if ([200, 201].contains(response.statusCode)) {
      final List<dynamic> transactionsData = response.data['card_products'];
      List<CardProduct> products = transactionsData.map((data) {
        return CardProduct.fromJson(data);
      }).toList();

      return products;
    }
  } catch (e) {
    LogService.logger.e("Exception during fetchCardProducts: $e");
  }
  return [];
}

/////////////////Invoices/////////////////////////////////////

Future<Invoice> createInvoice(PurchaseRequest req) async {
  LogService.logger.i("createInvoice Method called");
  try {
    final response = await PayWithMoonApiService.instance.dio.post(
      "/v1/api-gateway/onchain/invoice",
      data: {
        "creditPurchaseAmount": req.creditPurchaseAmount,
        "blockchain": req.blockchain,
        "currency": req.currency,
      },
    );

    if ([200, 201].contains(response.statusCode)) {
      final invoice = Invoice.fromJson(response.data);
      return invoice;
    }
  } catch (e) {
    LogService.logger.e("Exception during createInvoice: $e");
  }
  return Invoice(
    id: '',
    address: '',
    usdAmountOwned: '',
    cryptoAmountOwed: '',
    exchangeRateLockExpiration: 0,
    currency: '',
    blockchain: '',
  );
}

/////////////////Moon Reserve/////////////////////////////////
Future<String> fetchMoonReserve() async {
  try {
    final response = await PayWithMoonApiService.instance.dio.patch(
      "/v1/api-gateway/moon-reserve",
    );

    if ([200, 204].contains(response.statusCode)) {
      return response.data['balance']; // Return success message
    }
  } catch (e) {
    LogService.logger.e("Exception during fetchMoonReserve: $e");
  }
  return "Failed to update card status"; // Fallback message
}

////////////////Gift Card/////////////////////////////////////
Future<GiftCardResponse> createGiftCard(GiftCardRequest req) async {
  LogService.logger.i("createGiftCard Method called");
  try {
    final response = await PayWithMoonApiService.instance.dio.post(
      "/v1/api-gateway/gift-card",
      data: {
        "card_product_id": req.cardProductId,
        "amount": req.amount,
      },
    );

    if ([200, 201].contains(response.statusCode)) {
      final giftCard = GiftCardResponse.fromJson(response.data);
      return giftCard;
    }
  } catch (e) {
    LogService.logger.e("Exception during createGiftCard: $e");
  }
  return GiftCardResponse(
      id: '',
      value: 0,
      cardProductId: '',
      supportToken: '',
      markedUsed: false,
      barcode: '',
      pin: '',
      securityCode: '',
      merchantCardWebsite: '',
      redemptionInstructions: '');
}

Future<List<GiftCardProduct>> fetchGiftCardProducts(
    int currentPage, int perPage) async {
  LogService.logger.i("Fetching gift card products");
  try {
    final response = await PayWithMoonApiService.instance.dio.get(
        '/v1/api-gateway/gift-card/card-products?currentPage=$currentPage&perPage=$perPage');
    if ([200, 201].contains(response.statusCode)) {
      final List<dynamic> productsData = response.data['card_products'];
      List<GiftCardProduct> products = productsData.map((data) {
        return GiftCardProduct.fromJson(data);
      }).toList();

      return products;
    }
  } catch (e) {
    LogService.logger.e("Exception during fetchCardProducts: $e");
  }
  return [];
}
