import 'dart:async';

import 'package:biorbank/utils/helpers/blockchainhelper.dart';
import 'package:biorbank/utils/models/transaction_detail_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transaction_history_state.dart';

enum TransactionType {
  send,
  receive,
}

class TransactionHistoryImpl extends Cubit<TransactionHistoryState> {
  TransactionHistoryImpl(
      {required this.type,
      required this.txHash,
      required this.assetIndex,
      required this.info,
      required TransactionStatus status,
      required double networkFee,
      required DateTime timeStamp,
      this.bhelper})
      : super(TransactionHistoryState(
            status: status, networkFee: networkFee, timeStamp: timeStamp)) {
    init();
  }
  Timer _timer = Timer(Duration.zero, () {});

  final TransactionType type;
  final String txHash;
  final int assetIndex;
  final TransactionDetail info;
  BlockchainHelper? bhelper;
  @override
  Future<void> close() {
    // _streamSubscription.cancel();
    _timer.cancel();
    return super.close();
  }

  Future<void> init() async {
    if (state.status == TransactionStatus.pending) {
      checkCompleted();
      _timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
        checkCompleted();
      });
    }
  }

  Future<void> checkCompleted() async {
    Map<String, dynamic> txStatus = await bhelper!.getTransactionStatus(txHash);
    if (txStatus['status'] == TransactionStatus.completed) {
      _timer.cancel();
      emit(state.copyWith(
          status: TransactionStatus.completed,
          networkFee: txStatus['networkFee']));
    }
  }

  Map<String, dynamic> toMap() {
    int status;
    if (state.status == TransactionStatus.pending) {
      status = -1;
    } else if (state.status == TransactionStatus.completed) {
      status = 1;
    } else {
      status = 0;
    }
    return {
      'type': type == TransactionType.send ? 0 : 1,
      'status': status,
      'txHash': txHash,
      'assetIndex': assetIndex,
      'sender': info.from,
      'recipient': info.to,
      'amount': info.amount,
      'networkFee': state.networkFee,
      'timeStamp': state.timeStamp.toString(),
    };
  }

  DateTime get timeStamp => state.timeStamp;
}
