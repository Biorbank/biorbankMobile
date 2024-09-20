import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'nft_state.dart';

class NftCubit extends Cubit<NftState> {
  NftCubit() : super(NftInitial());
}
