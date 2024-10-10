import 'package:biorbank/presentation/pages/price_alert/cubit/price_alert_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceAlertCubit extends Cubit<PriceAlertState> {
  PriceAlertCubit() : super(PriceAlertInitialState());
}
