import 'package:biorbank/utils/models/CardProduct.dart';
import 'package:biorbank/utils/service/pay_with_moon_service.dart';
import 'package:bloc/bloc.dart';

import '../../events/debit_card/card_products_event.dart';
import '../../state/debit_card/card_products_state.dart';

class CardProductBloc extends Bloc<CardProductEvent, CardProductState> {
  CardProductBloc() : super(CardProductInitial()) {
    on<FetchCardProducts>((event, emit) async {
      if (state is CardProductLoaded) {
        final currentState = state as CardProductLoaded;

        emit(CardProductLoading());

        try {
          final newProducts =
              await fetchCardProducts(event.currentPage, event.perPage);

          // Combine new transactions with the existing ones
          final updatedProducts =
              List<CardProduct>.from(currentState.cardProducts)
                ..addAll(newProducts);

          emit(CardProductLoaded(updatedProducts));
        } catch (e) {
          emit(
              CardProductError('Failed to load transactions: ${e.toString()}'));
        }
      }
    });
  }
}
