import '../../models/Invoice.dart';

abstract class MoonReserveState {}

class MoonReserveInitial extends MoonReserveState {}

class MoonReserveLoading extends MoonReserveState {}

class MoonReserveLoaded extends MoonReserveState {
  final String balance;

  MoonReserveLoaded(this.balance);
}

class MoonReserveError extends MoonReserveState {
  final String message;

  MoonReserveError(this.message);
}
