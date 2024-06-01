

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nft_holding_state.dart';

class NftHoldingCubit extends Cubit<NFTHoldingState> {
  NftHoldingCubit() : super(NFTHoldingInitialState());
}