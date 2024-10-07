import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'import_exsiting_account_state.dart';

class ImportExsitingAccountCubit extends Cubit<ImportExsitingAccountState> {
  ImportExsitingAccountCubit() : super(ImportExsitingAccountInitialState());

  TextEditingController pharseKeyController = TextEditingController();
  TextEditingController walletNameController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController createPasswordForJsonFile = TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int tabIndex = 0;
  int selectedChainIndex = -1;

  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  void togglePasswordVisibility() {
    emit(ImportExsitingAccountInitialState());
    isObscurePassword = !isObscurePassword;
    emit(PasswordVisibilityToggleState());
  }

  void toggleConfirmPasswordVisibility() {
    emit(ImportExsitingAccountInitialState());
    isObscureConfirmPassword = !isObscureConfirmPassword;
    emit(PasswordVisibilityToggleState());
  }

  void changeTabIndex({required int index}) {
    emit(TabIndexChangeState(index: index));
  }

  void changeChainIndex({required int index}) {
    emit(ChainChangeState(index: index));
  }
}
