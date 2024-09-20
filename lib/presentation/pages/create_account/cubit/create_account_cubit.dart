import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitialState());

  TextEditingController firstWordTextController = TextEditingController();
  TextEditingController secondWordTextController = TextEditingController();
  TextEditingController accountNameTextController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String mnemonic = "";
  List<String> mnemonicList = [];
  bool isShowRecoveryPharseView = true;
  bool isShowPassword = true;
  bool isShowConfirmPassword = true;
  String word = "if i share my recovery phrase i will lose my money";
  bool isValidWordSelction = false;
  List<String> wordData = [];
  List<String> selectedWords = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setMnemonic({required String value}) {
    mnemonic = value;
    mnemonicList = mnemonic.split(" ");
  }

  void copyToClipboard() {
    emit(CreateAccountInitialState());
    String clipboardText = mnemonicList
        .asMap()
        .entries
        .map((entry) => '${entry.key + 1}. ${entry.value}')
        .join('\n');
    emit(RecoveryPhraseSelectedState(phraseData: clipboardText));
  }

  refreshState() {
    emit(CreateAccountInitialState());
  }

  void updateView({required bool value}) {
    emit(CreateAccountInitialState());
    isShowRecoveryPharseView = value;
    emit(PasswordToggleState());
  }

  void togglePasswordVisibility() {
    emit(CreateAccountInitialState());
    isShowPassword = !isShowPassword;
    emit(PasswordToggleState());
  }

  void toggleConfirmPasswordVisibility() {
    emit(CreateAccountInitialState());
    isShowConfirmPassword = !isShowConfirmPassword;
    emit(PasswordToggleState());
  }

  void checkWordCompletion() {
    emit(FetchWordLoadingState());
    String selectedString = selectedWords.join('');
    emit(FetchWordSuccessState(selectedeString: selectedString));
  }

  void onSelectWord({required String word}) {
    selectedWords.add('$word ');
    checkWordCompletion();
  }

  void shuffleList() {
    isValidWordSelction = false;
    isShowRecoveryPharseView = true;
    selectedWords.clear();
    List<String> wordList = word.split(" ");
    wordList.shuffle(Random());
    wordData = wordList;
  }

  void cleanTextFiledData() {
    firstWordTextController.clear();
    secondWordTextController.clear();
    accountNameTextController.clear();
    createPasswordController.clear();
    confirmPasswordController.clear();
  }
}
