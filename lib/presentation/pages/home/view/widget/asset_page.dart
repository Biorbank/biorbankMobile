import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/home/model/my_account_token_model.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/database_service.dart/database_service.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:biorbank/utils/service/cmc_service.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/common_spacer.dart';
import '../../../../common/common_blue_container.dart';
import '../../../../common/common_search_appbar.dart';
import '../../cubit/home_cubit.dart';

@RoutePage()
class AssetPage extends StatefulWidget {
  const AssetPage({super.key});

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateState();
  }

  void updateState() async {
    final db = context.read<CryptoDBRepositoryImpl>();
    final cubit = context.read<HomeCubit>();

    // Create a list of futures
    List<Future<MyAccountTokenModel>> futures =
        db.state.assetList.map((e) async {
      return MyAccountTokenModel(
        img: e.getAsset().logo,
        title: e.getAsset().name,
        title2: e.getAsset().symbol,
        amount: e.state.balance, // Await the balance retrieval
        priceInUSD: e.state.quote.priceInUSD, // Ensure this variable is defined
        percentChangeday:
            e.state.quote.percentChangeday, // Ensure this variable is defined
        isProfit: true, // Ensure this variable is defined
      );
    }).toList();

    // Wait for all futures to complete
    List<MyAccountTokenModel> accountTokenModels = await Future.wait(futures);

    // Call the cubit's function with the completed list
    cubit.onChangeMyActTokenData(value: accountTokenModels);
  }

  String _getWalletName() {
    final cubit = context.read<HomeCubit>();

    if (cubit.selectedWallet == -1) {
      return "All Accounts";
    } else if (cubit.selectedWallet >= 0 &&
        cubit.selectedWallet < AppHelper.walletService.wallets.length) {
      return AppHelper.walletService.wallets[cubit.selectedWallet].name;
    } else {
      // Handle unexpected cases, maybe return an empty string or a default message
      return "Unknown Wallet";
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return BlocConsumer<CryptoDBRepositoryImpl, CryptoDBRepositoryState>(
      listener: (context, state) {
        updateState();
      },
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
            builder: (homeContext, homeState) {
          return Stack(
            children: [
              CommonBlueContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(40.h),
                      CommonSearchAppbar(
                        hintText: 'ID/USDT',
                        textController: TextEditingController(),
                        onTapTextField: () {
                          context.router.push(const CommonSearchRoute());
                          //  Navigator.pushNamed(context, Routes.serachViewRoute);
                        },
                      ),
                      height(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildArrow(
                            context: context,
                            icon: Assets.imagesBackArrow,
                            onTap: () {
                              int tempValue = cubit.selectedWallet + 1;
                              tempValue = (tempValue +
                                          AppHelper.walletService.walletCount +
                                          1 -
                                          1) %
                                      (AppHelper.walletService.walletCount +
                                          1) -
                                  1;
                              cubit.onChangeSelectedWallet(index: tempValue);
                            },
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              AppConstant.commonText(
                                "Balance",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                              AppConstant.commonText(
                                "\$75,630.90",
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              InkWell(
                                onTap: () {
                                  selectAccountDialog();
                                },
                                child: Row(
                                  children: [
                                    AppConstant.commonText(
                                      _getWalletName(),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    width(4),
                                    _buildArrow(
                                      context: context,
                                      icon: Assets.imagesArrowDownOutline,
                                      height: 16.h,
                                      width: 16.w,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          _buildArrow(
                            context: context,
                            icon: Assets.imagesArrowRight,
                            onTap: () {
                              int tempValue = cubit.selectedWallet + 1;
                              tempValue = (tempValue +
                                          AppHelper.walletService.walletCount +
                                          1 +
                                          1) %
                                      (AppHelper.walletService.walletCount +
                                          1) -
                                  1;
                              cubit.onChangeSelectedWallet(index: tempValue);
                            },
                          ),
                        ],
                      ),
                      height(28),
                    ],
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.68,
                minChildSize: 0.6,
                maxChildSize: 0.68,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    child: Column(
                      children: [
                        height(10.h),
                        Container(
                          height: 4.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                        height(20.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              AppConstant.commonText(
                                "Tokens",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.shadow,
                              ),
                              width(4),
                              AppConstant.commonText(
                                "(${cubit.myActTokenData.length})",
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.shadow,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  showImportTokenDialog();
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 20,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              width(4),
                              Icon(
                                Icons.copy_outlined,
                                size: 20,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              width(4),
                              Image.asset(
                                Assets.imagesFilter,
                                color: Theme.of(context).colorScheme.tertiary,
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: cubit.myActTokenData.length,
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              final data = cubit.myActTokenData[index];
                              return _buildContainerData(
                                context: context,
                                img: data.img,
                                title: data.title,
                                title2: data.title2,
                                amt:
                                    "${data.amount.toStringAsFixed(2)} | \$${data.priceInUSD.toStringAsFixed(2)}",
                                currentAmt:
                                    "\$${(data.amount * data.priceInUSD).toStringAsFixed(2)}",
                                differentAmt:
                                    "+${(data.percentChangeday * data.priceInUSD * data.amount / 100).toStringAsFixed(2)}",
                                totalDifferentInPercentage:
                                    "+${(data.percentChangeday).toStringAsFixed(2)}%",
                                isProfit: data.isProfit,
                                onTap: () {
                                  AutoTabsRouter.of(context).setActiveIndex(13);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        });
      },
    );
  }

  selectAccountDialog() {
    final cubit = BlocProvider.of<HomeCubit>(context);

    showModalBottomSheet(
      useRootNavigator: true,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter mySetState) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppConstant.commonText(
                      "Select Account",
                      fontSize: 14.sp,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          )),
                    ),
                  ],
                ),
                ListTile(
                  onTap: () {
                    mySetState(() {
                      cubit.selectedWallet = -1;
                    });
                    cubit.onChangeSelectedWallet(index: -1);
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.pop(context);
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: AppConstant.commonText(
                      "All Accounts",
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow,
                      fontSize: 20.sp,
                    ),
                  ),
                  trailing: Radio<int>(
                    value: -1,
                    groupValue: cubit.selectedWallet,
                    fillColor: WidgetStatePropertyAll(
                      cubit.selectedWallet == -1
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(0.5),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: AppHelper.walletService.wallets.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        mySetState(() {
                          cubit.selectedWallet = index;
                        });
                        cubit.onChangeSelectedWallet(index: index);
                        Future.delayed(const Duration(milliseconds: 300), () {
                          Navigator.pop(context);
                        });
                      },
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 0),
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -4),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: AppConstant.commonText(
                          AppHelper.walletService.wallets[index].name,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.shadow,
                          fontSize: 20.sp,
                        ),
                      ),
                      trailing: Radio<int>(
                        value: index,
                        groupValue: cubit.selectedWallet,
                        fillColor: WidgetStatePropertyAll(
                          cubit.selectedWallet == index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.5),
                        ),
                        onChanged: (value) {
                          if (value != null) {}
                        },
                      ),
                    );
                  },
                ),
                height(20.h),
              ],
            ),
          );
        });
      },
    );
  }

  _buildArrow({
    required BuildContext context,
    required String icon,
    double? height,
    double? width,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        icon,
        height: height ?? 24.h,
        width: width ?? 24.w,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  _buildContainerData({
    required BuildContext context,
    required String img,
    required String title,
    required String title2,
    required String amt,
    required String currentAmt,
    required String differentAmt,
    required String totalDifferentInPercentage,
    required bool isProfit,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.file(
                File(
                  "${AppHelper.appDir}/$img",
                ),
                height: 44.h,
                width: 44.w,
                fit: BoxFit.fill,
              ),
            ),
            width(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.shadow,
                        ),
                        children: [
                          TextSpan(
                            text: title,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow,
                            ),
                          ),
                          // width(4),
                          TextSpan(text: " $title2"),
                        ]),
                  ),
                  height(6),
                  AppConstant.commonText(amt,
                      color: Theme.of(context).colorScheme.shadow,
                      fontWeight: FontWeight.w600),
                ],
              ),
            ),
            width(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppConstant.commonText(currentAmt,
                    color: Theme.of(context).colorScheme.shadow,
                    fontWeight: FontWeight.w600),
                height(6.h),
                Row(
                  children: [
                    AppConstant.commonText(differentAmt,
                        color: isProfit
                            ? Theme.of(context).colorScheme.onInverseSurface
                            : Theme.of(context).colorScheme.error,
                        fontSize: 11.sp),
                    width(6.w),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: isProfit
                            ? const Color(0xFFE5FAEE)
                            : const Color(0xFFFDEBEC),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: AppConstant.commonText(
                        totalDifferentInPercentage,
                        fontSize: 10.sp,
                        color: isProfit
                            ? Theme.of(context).colorScheme.onInverseSurface
                            : Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showImportTokenDialog() async {
    if (context.mounted == false) return false;

    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    List<NetworkInformation> networksList =
        await DatabaseService.instance.getAllNetworks;

    NetworkInformation? selectedNetwork =
        networksList.isNotEmpty ? networksList.first : null;
    CryptoAssetInformation? selectedAsset;
    TextEditingController tokenAddressEditingController =
            TextEditingController(),
        tokenSymbolController = TextEditingController(),
        tokenDecimalController = TextEditingController();

    late TabController tabController;
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {});
    int sendTabIndex = 0;

    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      useRootNavigator: true,
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter mySetState) {
          return Container(
            height: 540.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppConstant.commonText(
                      "Add Tokens",
                      textAlign: TextAlign.start,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 24,
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                CommonTabbar(
                  backgroundContainerMargin: 0,
                  selectedIndex: sendTabIndex,
                  length: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  tabAlignment: TabAlignment.fill,
                  isScrollable: false,
                  labelTextBackgroundPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  labelColor: Theme.of(context).colorScheme.shadow,
                  isShowBackgroundShadow: true,
                  onTap: (index) {
                    mySetState(() {
                      sendTabIndex = index;
                    });
                  },
                  tabController: tabController,
                  tabList: const ['Custom', 'Owned'],
                ),
                SizedBox(
                  height: 14.h,
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonDropdownWidget(
                            isExpanded: true,
                            borderRadius: 12.r,
                            labelText: '',
                            value: selectedNetwork,
                            items: networksList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                      children: [
                                        Image.file(
                                          File("${AppHelper.appDir}/${e.logo}"),
                                          height: 22.h,
                                          width: 22.w,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        AppConstant.commonText(
                                          e.name,
                                          fontSize: 14.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            backGroundColor:
                                Theme.of(context).colorScheme.errorContainer,
                            border: Border.all(
                              color:
                                  Theme.of(context).colorScheme.errorContainer,
                            ),
                            onChanged: (val) {
                              mySetState(() {
                                selectedNetwork = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          AppConstant.commonText(
                            "Token Custom Address",
                            textAlign: TextAlign.start,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                          CommonTextfield(
                            title: '',
                            isShowSpaceAfterTitle: false,
                            hintText: 'Token Custom Address',
                            suffixWidget: Image.asset(
                              Assets.imagesCopyRounded,
                              height: 16.h,
                              width: 16.w,
                              fit: BoxFit.cover,
                            ),
                            controller: tokenAddressEditingController,
                            onChanged: (p0) async {
                              try {
                                tokenSymbolController.text = "";
                                tokenDecimalController.text = "";
                                final tokenAddress = p0 ?? "";
                                if (selectedNetwork != null &&
                                    ValidateWalletAddress.validateEVM(
                                        tokenAddress)) {
                                  CryptoAssetInformation? newAssetInfo =
                                      await db.getToken(
                                          tokenAddress, selectedNetwork!);
                                  if (newAssetInfo != null) {
                                    LogService.logger
                                        .i(newAssetInfo.toMap().toString());
                                    mySetState(() {
                                      selectedAsset = newAssetInfo;
                                    });
                                    tokenSymbolController.text =
                                        newAssetInfo.symbol;
                                    tokenDecimalController.text =
                                        newAssetInfo.decimal.toString();
                                    return;
                                  }
                                }
                                mySetState(() {
                                  selectedAsset = null;
                                });
                              } catch (e) {
                                LogService.logger.e(e);
                              }
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppConstant.commonText(
                            "Token Symbol",
                            textAlign: TextAlign.start,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                          CommonTextfield(
                            title: '',
                            isShowSpaceAfterTitle: false,
                            hintText: 'Token Symbol',
                            isReadOnly: true,
                            controller: tokenSymbolController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppConstant.commonText(
                            "Token Decimal",
                            textAlign: TextAlign.start,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                          CommonTextfield(
                            title: '',
                            isShowSpaceAfterTitle: false,
                            hintText: 'Token Decimal',
                            isReadOnly: true,
                            controller: tokenDecimalController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CommonButton(
                            name: 'Add token',
                            onTap: () async {
                              try {
                                if (selectedNetwork != null &&
                                    selectedAsset != null) {
                                  LogService.logger.i(
                                      "${selectedAsset!.tokenId} ${selectedNetwork!.id}");

                                  int tokenCMCID = await getCMCID(
                                      selectedAsset!.tokenId, selectedNetwork!);

                                  if (tokenCMCID != -1) {
                                    String url =
                                        "https://s2.coinmarketcap.com/static/img/coins/64x64/$tokenCMCID.png";
                                    await saveToFile(url, tokenCMCID);
                                  }

                                  final newCryptoAsset = CryptoAssetInformation(
                                    type: AssetType.token,
                                    tokenId: selectedAsset!
                                        .tokenId, // sepolia Ethereum USDT
                                    name: selectedAsset!.name,
                                    symbol: selectedAsset!.symbol,
                                    decimal: selectedAsset!.decimal,
                                    networkId: selectedAsset!.networkId,
                                    cmcId: tokenCMCID,
                                    logo:
                                        "assets/img/cryptoicon/$tokenCMCID.png",
                                  );

                                  await db.importToken(
                                      newCryptoAsset, selectedNetwork!);
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                }
                              } catch (e) {
                                LogService.logger.e(e);
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox.shrink()
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
