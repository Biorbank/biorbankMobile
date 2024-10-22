import 'package:biorbank/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/cubit/defi_detail_cubit.dart';
import 'package:biorbank/presentation/pages/buy_sell/cubit/buysell_cubit.dart';
import 'package:biorbank/presentation/pages/chat/cubit/chat_cubit.dart';
import 'package:biorbank/presentation/pages/contacts_page/cubit/contact_cubit.dart';
import 'package:biorbank/presentation/pages/create_account/cubit/create_account_cubit.dart';
import 'package:biorbank/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:biorbank/presentation/pages/debit_card/cubit/debit_card_cubit.dart';
import 'package:biorbank/presentation/pages/defi/cubit/defi_cubit.dart';
import 'package:biorbank/presentation/pages/deposit/cubit/deposit_cubit.dart';
import 'package:biorbank/presentation/pages/feedback/cubit/feedback_cubit_cubit.dart';
import 'package:biorbank/presentation/pages/help_center/cubit/help_center_cubit.dart';
import 'package:biorbank/presentation/pages/history/cubit/history_cubit.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/presentation/pages/import_existing_account/cubit/import_existing_account_cubit.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/nft_holding/cubit/nft_holding_cubit.dart';
import 'package:biorbank/presentation/pages/p2p/cubit/p2p_market_cubit.dart';
import 'package:biorbank/presentation/pages/pay_bills/cubit/pay_bills_cubit.dart';
import 'package:biorbank/presentation/pages/price_alert/cubit/price_alert_cubit.dart';
import 'package:biorbank/presentation/pages/send/cubit/send_money_cubit.dart';
import 'package:biorbank/presentation/pages/token_page/cubit/token_cubit.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProviderList extends StatelessWidget {
  const MultiBlocProviderList(
      {super.key, required this.child, required this.db});

  final CryptoDBRepositoryImpl db;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<CryptoDBRepositoryImpl>(create: (_) => db),
        BlocProvider<CreateAccountCubit>(
          create: (BuildContext context) => CreateAccountCubit(),
        ),
        BlocProvider<ImportExistingAccountCubit>(
          create: (BuildContext context) => ImportExistingAccountCubit(),
        ),
        BlocProvider<DashboardCubit>(
          create: (BuildContext context) => DashboardCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider<DefiCubit>(
          create: (BuildContext context) => DefiCubit(),
        ),
        BlocProvider<NftHoldingCubit>(
          create: (BuildContext context) => NftHoldingCubit(),
        ),
        BlocProvider<MarketCubit>(
          create: (BuildContext context) => MarketCubit(),
        ),
        BlocProvider<ChatCubit>(
          create: (BuildContext context) => ChatCubit(),
        ),
        BlocProvider<ContactCubit>(
          create: (BuildContext context) => ContactCubit(),
        ),
        BlocProvider<DefiDetailCubit>(
          create: (BuildContext context) => DefiDetailCubit(),
        ),
        BlocProvider<FeedbackCubit>(
          create: (BuildContext context) => FeedbackCubit(),
        ),
        BlocProvider<DebitCardCubit>(
          create: (BuildContext context) => DebitCardCubit(),
        ),
        BlocProvider<HelpCenterCubit>(
          create: (BuildContext context) => HelpCenterCubit(),
        ),
        BlocProvider<P2pMarketCubit>(
          create: (BuildContext context) => P2pMarketCubit(),
        ),
        BlocProvider<DepositCubit>(
          create: (BuildContext context) => DepositCubit(),
        ),
        BlocProvider<SendMoneyCubit>(
          create: (BuildContext context) => SendMoneyCubit(),
        ),
        BlocProvider<BuySellCubit>(
          create: (BuildContext context) => BuySellCubit(),
        ),
        BlocProvider<PayBillsCubit>(
          create: (BuildContext context) => PayBillsCubit(),
        ),
        BlocProvider<TokenCubit>(
          create: (BuildContext context) => TokenCubit(),
        ),
        BlocProvider<HistoryCubit>(
          create: (BuildContext context) => HistoryCubit(),
        ),
        BlocProvider<PriceAlertCubit>(
          create: (BuildContext context) => PriceAlertCubit(),
        ),
      ],
      child: child,
    );
  }
}
