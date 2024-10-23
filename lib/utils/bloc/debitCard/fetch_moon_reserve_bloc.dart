import 'package:biorbank/utils/events/debit_card/moon_reserve_event.dart';
import 'package:biorbank/utils/state/debit_card/moon_reserve_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/pay_with_moon_service.dart';

class FetchMoonReserveBloc extends Bloc<MoonReserveEvent, MoonReserveState> {
  FetchMoonReserveBloc() : super(MoonReserveInitial()) {
    on<MoonReserveEvent>((event, emit) async {
      emit(MoonReserveLoading());
      try {
        final response = await fetchMoonReserve();
        emit(MoonReserveLoaded(response));
      } catch (e) {
        emit(MoonReserveError('Failed to load moon reserve: ${e.toString()}'));
      }
    });
  }
}
