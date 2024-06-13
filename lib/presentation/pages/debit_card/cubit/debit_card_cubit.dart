import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'debit_card_state.dart';

class DebitCardCubit extends Cubit<DebitCardState> {
  DebitCardCubit() : super(DebitCardInitial());

  bool isVisibleCardNumber = true;
  String selectedSortByFilter = 'Featured';
  String selectedOnlineInStoreFilter = 'All Products';
  String selectedTypeFilter = 'All Gift Cards';
  void toggleCardNumberVisibility() {
    isVisibleCardNumber = !isVisibleCardNumber;
    emit(DebitCardNumberUpdated(isVisibleCardNumber));
  }

  void sortByFilterChange({required String filterValue}) {
    print('Selected sort by filter= $filterValue');
    emit(SortByFilterUpdateState(value: filterValue));
  }
  void onlineOrInStoreFilterChange({required String filterValue}) {
    print('Selected online filter = $filterValue');
    emit(OnlineInStoreFilterUpdateState(value: filterValue));
  }

  void typeFilterChange({required String filterValue}) {
    print('Selected type filter = $filterValue');
    emit(TypeFilterUpdateState(value: filterValue));
  }

  List<String> sortByFilter = [
    'Featured',
    'Popular',
    'A-Z',
    'Recently Added',
    'Rewards'
  ];
  List<String> onlineOrStoreFilter = [
    'All Products',
    'Redeemable Online',
    'Redeemable in-store',
  ];
  List<String> typeFilter = [
    'All Gift Cards',
    'Apparel',
    'Automobiles',
    'Ecommerce',
    'Electronics',
    'Entertainment',
    'Experiences',
    'Food',
    'Food Delivery',
    'Games',
    'Groceries',
    'Health & Beauty',
  ];
}
