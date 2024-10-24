import 'package:biorbank/utils/events/debit_card/debit_card_events.dart';
import 'package:biorbank/utils/service/pay_with_moon_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import '../../state/debit_card_state.dart';

class DebitCardBloc extends Bloc<DebitCardEvent, DebitCardState> {
  DebitCardBloc() : super(DebitCardInitial()) {
    // Handle fetching card details
    on<FetchCardDetailsEvent>((event, emit) async {
      emit(DebitCardLoading());
      try {
        final card = await fetchCard(event.cardId);
        final transactions = await fetchCardTransactions(
            event.cardId, 1, 10); // Default page load
        emit(DebitCardLoaded(card, transactions));
      } catch (e) {
        emit(DebitCardError('Failed to load card data: ${e.toString()}'));
      }
    });

    // Handle create card details
    on<CreateCardEvent>((event, emit) async {
      emit(DebitCardLoading());
      try {
        final card = await createCard(event.prodId);
        emit(CreateCardLoaded(card));
      } catch (e) {
        emit(DebitCardError('Failed to create card : ${e.toString()}'));
      }
    });

    // Handle fetching transactions with pagination
    on<FetchTransactionListEvent>((event, emit) async {
      if (state is DebitCardLoaded) {
        final currentState = state as DebitCardLoaded;

        emit(DebitCardLoading());

        try {
          final newTransactions = await fetchCardTransactions(
              event.cardId, event.currentPage, event.perPage);

          // Combine new transactions with the existing ones
          final updatedTransactions =
              List<PayWithMoonTransaction>.from(currentState.transactions)
                ..addAll(newTransactions);

          emit(DebitCardLoaded(currentState.card, updatedTransactions));
        } catch (e) {
          emit(DebitCardError('Failed to load transactions: ${e.toString()}'));
        }
      }
    });
  }
}
