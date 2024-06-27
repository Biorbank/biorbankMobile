import 'package:biorbank/presentation/pages/token_page/cubit/token_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/enum/home_page_action_enum.dart';
import '../../market/cubit/market_cubit.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit() : super(InitialTokenState());

  int selectedTabIndex = 0;

  String selectedValue = "1 day";
  String selectedExplore = "Etherscan";
  String selectedChain = "7 more";

  CurrencyModel? onChanged1Value;
  CurrencyModel? onChanged2Value;

  List<String> overviewItems = [
    "1 day",
    "7 day",
    "15 day",
  ];

  List<CurrencyModel> items = [
    CurrencyModel(
        name: 'ETH',
        url: 'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png'),
    CurrencyModel(
        name: 'Bitcoin',
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'),
  ];

  List<Map<String, dynamic>> tradeOptions = [
    {'icon': Assets.imagesSwapArrow, 'title': 'Swap', 'type': ActionEnum.swap},
    {
      'icon': Assets.imagesArrowDown,
      'title': 'Deposit',
      'type': ActionEnum.deposit
    },
    {'icon': Assets.imagesArrowUp, 'title': 'Send', 'type': ActionEnum.send},
    {
      'icon': Assets.imagesBitcoinRefresh,
      'title': 'Buy/Sell',
      'type': ActionEnum.buyORsell
    },
    {
      'icon': Assets.imagesWallet,
      'title': 'Pay Bills',
      'type': ActionEnum.payBills
    },
  ];

  List<String> exploreDataList=['Etherscan', 'Bitscan'];
  List<String> chainDataList=['7 more', '8 more'];

  ActionEnum? selectedOption;

  void onChangeTabIndex({required int index}) {
    emit(TabBarIndexState(index: index));
  }

  void changeOverviewDropDown({required String value}) {
    emit(ChangeOverviewDropDown(value: value));
  }

  void changeInfoDropDown1({required CurrencyModel value}) {
    emit(ChangeInfoDropDown1(value: value));
  }

  void changeInfoDropDown2({required CurrencyModel value}) {
    emit(ChangeInfoDropDown2(value: value));
  }

  void onTapeTradeActionOption({required ActionEnum? value}) {
    emit(TradeOptionChnageState(value: value));
  }

  void changeExploreDropDown({required String value}) {
    emit(ExploreDropDownValueState(value: value));
  }

  void changeChainDropDown({required String value}) {
    emit(ChainDropDownValueState(value: value));
  }
}
