import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'import_existing_account_state.dart';

class ImportExistingAccountCubit extends Cubit<ImportExistingAccountState> {
  ImportExistingAccountCubit() : super(ImportExistingAccountInitialState());

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
    emit(ImportExistingAccountInitialState());
    isObscurePassword = !isObscurePassword;
    emit(PasswordVisibilityToggleState());
  }

  void toggleConfirmPasswordVisibility() {
    emit(ImportExistingAccountInitialState());
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
