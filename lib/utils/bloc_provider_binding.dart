

import 'package:biorbank/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:biorbank/presentation/pages/browser/defi_details_page/cubit/defi_detail_cubit.dart';
import 'package:biorbank/presentation/pages/chat/cubit/chat_cubit.dart';
import 'package:biorbank/presentation/pages/contacts_page/cubit/contact_cubit.dart';
import 'package:biorbank/presentation/pages/create_account/cubit/create_account_cubit.dart';
import 'package:biorbank/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:biorbank/presentation/pages/defi/cubit/defi_cubit.dart';
import 'package:biorbank/presentation/pages/home/cubit/home_cubit.dart';
import 'package:biorbank/presentation/pages/import_exsiting_account/cubit/import_exsiting_account_cubit.dart';
import 'package:biorbank/presentation/pages/market/cubit/market_cubit.dart';
import 'package:biorbank/presentation/pages/nft_holding/cubit/nft_holding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProviderList extends StatelessWidget {
  const MultiBlocProviderList({super.key,required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider<AuthCubit>(
              create: (BuildContext context) => AuthCubit(),
            ),
            BlocProvider<CreateAccountCubit>(
              create: (BuildContext context) => CreateAccountCubit(),
            ),
            BlocProvider<ImportExsitingAccountCubit>(
              create: (BuildContext context) => ImportExsitingAccountCubit(),
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
      ],
      child: child,
    );
  }
}