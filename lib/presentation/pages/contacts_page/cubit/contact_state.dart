

part of 'contact_cubit.dart';

@immutable
sealed class ContactState {}

final class ContactInitialState extends ContactState {}
final class ContactTabIndexChangeState extends ContactState {
  final int index;
  ContactTabIndexChangeState({required this.index});
}
