import 'package:bloc/bloc.dart';

import '../../../presentation/pages/debit_card/cubit/debit_card_cubit.dart';
import '../../events/debit_card/debit_card_events.dart';
import '../../service/pay_with_moon_service.dart';

class DebitCardFreezeBloc extends Bloc<DebitCardEvent, DebitCardState> {
  DebitCardFreezeBloc() : super(DebitCardInitial()) {
    // Register the event handler
    on<FreezeCardEvent>((event, emit) async {
      emit(DebitCardLoading());
      try {
        final message = await freezeCard(event.cardId, event.freeze);
        emit(DebitCardFrozen(message));
      } catch (e) {
        emit(DebitCardError('Failed to freeze card: ${e.toString()}'));
      }
    });
  }
}
