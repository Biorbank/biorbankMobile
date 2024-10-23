import 'package:biorbank/utils/events/debit_card/gift_card_product_event.dart';
import 'package:biorbank/utils/models/gift_card_product.dart';
import 'package:biorbank/utils/service/pay_with_moon_service.dart';
import 'package:biorbank/utils/state/debit_card/gift_card_products_state.dart';
import 'package:bloc/bloc.dart';

import '../../state/debit_card/card_products_state.dart';

class GiftCardProductsBloc
    extends Bloc<GiftCardProductsEvent, GiftCardProductsState> {
  GiftCardProductsBloc() : super(CardProductsInitial()) {
    on<FetchGiftCardProducts>((event, emit) async {
      if (state is CardProductLoaded) {
        final currentState = state as CardProductLoaded;

        emit(CardProductsLoading());

        try {
          final newProducts =
              await fetchGiftCardProducts(event.page, event.perPage);

          // Combine new transactions with the existing ones
          final updatedProducts =
              List<GiftCardProduct>.from(currentState.cardProducts)
                ..addAll(newProducts);

          emit(CardProductsLoaded(updatedProducts));
        } catch (e) {
          emit(CardProductsError('Failed to load products: ${e.toString()}'));
        }
      }
    });
  }
}
