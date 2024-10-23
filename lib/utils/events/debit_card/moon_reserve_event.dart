import '../../models/PurchaseRequest.dart';

abstract class MoonReserveEvent {}

class FetchReserve extends MoonReserveEvent {
  final String balance;

  FetchReserve(this.balance);
}
