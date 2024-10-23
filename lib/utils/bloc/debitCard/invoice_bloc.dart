import 'package:flutter_bloc/flutter_bloc.dart';

import '../../events/debit_card/invoice_event.dart';
import '../../service/pay_with_moon_service.dart';
import '../../state/debit_card/invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceBloc() : super(InvoiceInitial()) {
    on<CreateInvoice>((event, emit) async {
      emit(InvoiceLoading());
      try {
        final response = await createInvoice(event.request);
        emit(InvoiceLoaded(response));
      } catch (e) {
        emit(InvoiceError('Failed to load invoice data: ${e.toString()}'));
      }
    });
  }
}
