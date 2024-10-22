import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  AddAccountCubit() : super(AddAccountInitialState());

  TextEditingController firstWordTextController = TextEditingController();
  TextEditingController secondWordTextController = TextEditingController();
  TextEditingController accountNameTextController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String mnemonic = "";
  List<String> mnemonicList = [];
  int step = 0;
  bool isShowPassword = true;
  bool isShowConfirmPassword = true;
  String word = "if i share my recovery phrase i will lose my money";
  bool isValidWordSelction = false;
  List<String> wordData = [];
  List<String> selectedWords = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  void setMnemonic({required String value}) {
    mnemonic = value;
    mnemonicList = mnemonic.split(" ");
  }

  void copyToClipboard() {
    emit(AddAccountInitialState());
    String clipboardText = mnemonicList
        .asMap()
        .entries
        .map((entry) => '${entry.key + 1}. ${entry.value}')
        .join('\n');
    emit(RecoveryPhraseSelectedState(phraseData: clipboardText));
  }

  refreshState() {
    emit(AddAccountInitialState());
  }

  void updateStep({required int value}) {
    emit(AddAccountInitialState());
    step = value;
    emit(PasswordToggleState());
  }

  void togglePasswordVisibility() {
    emit(AddAccountInitialState());
    isShowPassword = !isShowPassword;
    emit(PasswordToggleState());
  }

  void toggleConfirmPasswordVisibility() {
    emit(AddAccountInitialState());
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
    step = 0;
    isValidWordSelction = false;
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
