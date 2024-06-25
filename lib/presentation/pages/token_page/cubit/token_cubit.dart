import 'package:biorbank/presentation/pages/token_page/cubit/token_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/enum/home_page_action_enum.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit() : super(InitialTokenState());

  int selectedTabIndex = 0;

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
  ActionEnum? selectedOption;

  void onChangeTabIndex({required int index}) {
    emit(ChangeTabBarIndexState(index: index));
  }

  void onTapeTradeActionOption({required ActionEnum? value}) {
    emit(TradeOptionChnageState(value: value));
  }
 
}
