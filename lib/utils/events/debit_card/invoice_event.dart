import '../../models/PurchaseRequest.dart';

abstract class InvoiceEvent {}

class CreateInvoice extends InvoiceEvent {
  final PurchaseRequest request;

  CreateInvoice(this.request);
}
