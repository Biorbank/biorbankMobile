
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'defi_state.dart';

class DefiCubit extends Cubit<DefiState> {
  DefiCubit() : super(DefiInitialState());

  TextEditingController searchTextController=TextEditingController();
}