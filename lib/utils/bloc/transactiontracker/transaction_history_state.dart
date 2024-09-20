part of 'transaction_history_impl.dart';

enum TransactionStatus {
  pending,
  completed,
  failed,
}

class TransactionHistoryState extends Equatable {
  const TransactionHistoryState(
      {required this.status,
      required this.networkFee,
      required this.timeStamp});

  TransactionHistoryState copyWith({
    final TransactionStatus? status,
    final double? networkFee,
    final DateTime? timeStamp,
  }) =>
      TransactionHistoryState(
        status: status ?? this.status,
        networkFee: networkFee ?? this.networkFee,
        timeStamp: timeStamp ?? this.timeStamp,
      );
  final double networkFee;
  final TransactionStatus status;
  final DateTime timeStamp;
  @override
  List<Object?> get props => [status, networkFee, timeStamp];
}
