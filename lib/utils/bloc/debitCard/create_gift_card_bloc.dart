import 'package:biorbank/utils/events/debit_card/gift_card_event.dart';
import 'package:biorbank/utils/service/pay_with_moon_service.dart';
import 'package:biorbank/utils/state/debit_card/gift_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGiftCardBloc extends Bloc<GiftCardEvent, GiftCardState> {
  CreateGiftCardBloc() : super(CardInitial()) {
    on<CreateGiftCard>((event, emit) async {
      emit(CardLoading());
      try {
        final response = await createGiftCard(event.request);
        emit(CardLoaded(response));
      } catch (e) {
        emit(CardError('Failed to create gift card: ${e.toString()}'));
      }
    });
  }
}
