import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(MarketInitialState());

  TextEditingController searchTextController = TextEditingController();

  int selectedTabIndex = 0;
  int selectedCoinsTabIndex = 0;
  int selectedCryptoTabIndex = 0;
  String selectedFilter = 'All networks';
  String selectedTime = '1h';

  int transactionStatusID = 0;
  bool isSwapInfiniteApproval = true;

  void onChangeTabIndex({required int index}) {
    emit(ChangeTabBarIndexState(index: index));
  }

  SfRangeValues sliderValues = const SfRangeValues(0.0, 25.0);

  List<String> filterDataList = [
    'All networks',
    'Ethereum',
    'Solana',
    'Optimism',
    'Linea',
    'Manta Pacific',
    'Arbitrum',
    'TRON',
    'BNB Chain',
    'OKTC',
    'Polygon',
    'Avalanche C',
    'Fantom'
  ];
  List<String> timeDataList = ['1h', '4h', '24h'];

  void onChangeFilter({required String value}) {
    emit(OnChangeFilterState(filter: value));
  }

  void onSelectTime({required String value}) {
    emit(OnChangeTimeState(time: value));
  }

  List<String> coinsTabList = ['All', 'Top Rated', 'Top Gainers', 'Top Coins'];

  void onChangeCoinsTabIndex({required int index}) {
    emit(ChangeCoinsTabBarIndexState(index: index));
  }

  CryptoAssetRepositoryImpl? selectedPayWithCurrency, selectedReceiveCurrency;

  /* List<CurrencyModel> currencyPayWithList = [
    CurrencyModel(
        name: 'BTC',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
    CurrencyModel(
        name: 'ETH',
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU'),
  ];
  List<CurrencyModel> receiveCurrencyList = [
    CurrencyModel(
        name: 'BTC',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
    CurrencyModel(
        name: 'ETH',
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMG-wLarm17FjreEJHhGg_xzNT6JJa2VvbSbAJ34prN5p-nQRSxSKzMhQHiAuBHZyAji0&usqp=CAU'),
  ];

  List<CurrencyModel> currencyListBorrow = [
    CurrencyModel(
        name: 'USDT',
        url:
            'https://static-00.iconduck.com/assets.00/tether-cryptocurrency-icon-2048x2048-dp13oydi.png'),
    CurrencyModel(
        name: 'BTC',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
  ];
  List<CurrencyModel> receiveCurrencyListBorrow = [
    CurrencyModel(
        name: 'USDT',
        url:
            'https://static-00.iconduck.com/assets.00/tether-cryptocurrency-icon-2048x2048-dp13oydi.png'),
    CurrencyModel(
        name: 'BTC',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
  ]; */

  void onSelectPayWithCurrency({required CryptoAssetRepositoryImpl currency}) {
    selectedPayWithCurrency = currency;
    emit(PayWithCurrencySelectedState(currency: currency));
  }

  void onSelectReceiveCurrency({required CryptoAssetRepositoryImpl currency}) {
    selectedReceiveCurrency = currency;
    emit(ReceiveCurrencySelectedState(currency: currency));
  }

  void onChangeRangeSliderValue({required SfRangeValues value}) {
    emit(RangeSliderState(value: value));
  }

  void onChangeSelectedCryptoTabIndex({required int index}) {
    emit(ChangeSelectedCryptoTabState(index: index));
  }

  void onChangeTransactionStatus({required int index}) {
    emit(TransactionStatusState(id: index));
  }

  void onChangeSwapInfiniteApprvoval({required bool value}) {
    emit(SwapApprovalState(isApproval: value));
  }
}
