import 'package:auto_route/auto_route.dart';
import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_button.dart';
import 'package:biorbank/presentation/common/common_crypto_detail_tile.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/routers/auto_app_router.dart';
import 'package:biorbank/utils/database_service.dart/database_service.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/service/cmc_service.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CommonSearchScreen extends StatefulWidget {
  const CommonSearchScreen({super.key});

  @override
  State<CommonSearchScreen> createState() => _CommonSearchViewState();
}

class _CommonSearchViewState extends State<CommonSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(15.h),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        Assets.imagesBackArrow,
                        height: 27.h,
                      )),
                  width(16.w),
                  Expanded(
                      child: CommonTextfield(
                    isShowSpaceAfterTitle: false,
                    borderRadius: 30,
                    title: '',
                    autoFocus: true,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(
                        Assets.imagesSearch,
                        height: 20.h,
                        width: 20.w,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    hintText: 'Search token name..',
                  )),
                ],
              ),
              height(10.h),
              CommonTabbar(
                padding: const EdgeInsets.only(left: 8),
                selectedIndex: 0,
                length: 5,
                onTap: (index) {},
                tabController: tabController,
                tabList: const ['All', 'Native', 'ETH', 'BRC-20', 'Cosmos'],
              ),
              height(8.h),
              Expanded(
                child: BlocBuilder<CryptoDBRepositoryImpl,
                    CryptoDBRepositoryState>(
                  builder: (context, state) {
                    List<CryptoAssetRepositoryImpl> assetList = state.assetList;
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => height(6.h),
                      itemCount: assetList.length,
                      itemBuilder: (context, index) => CommonCryptoDetailTile(
                          context: context,
                          onTap: () {},
                          contentPadding: const EdgeInsets.only(left: 8),
                          coinName: assetList.elementAt(index).getAsset().name,
                          coinImageUrl:
                              "${AppHelper.appDir}/${assetList.elementAt(index).getAsset().logo}",
                          coinShortName:
                              assetList.elementAt(index).getAsset().symbol,
                          coinBalance: assetList.elementAt(index).state.balance,
                          coinPriceInUSD:
                              assetList.elementAt(index).state.quote.priceInUSD,
                          isQuoteLoading:
                              assetList.elementAt(index).state.quoteState,
                          isBalanceLoading:
                              assetList.elementAt(index).state.assetState),
                    );
                  },
                ),
              ),
              CommonButton(
                name: 'Import Token',
                onTap: () {
                  showImportTokenDialog();
                },
              ),
              height(10.h),
            ],
          ),
        ),
      ),
    );
  }

  showImportTokenDialog() async {
    if (context.mounted == false) return false;

    NetworkInformation? selectedNetwork;
    CryptoAssetInformation? selectedAsset;
    TextEditingController tokenAddressEditingController =
            TextEditingController(),
        tokenSymbolController = TextEditingController(),
        tokenDecimalController = TextEditingController();

    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    List<NetworkInformation> networksList =
        await DatabaseService.instance.getAllNetworks;

    showModalBottomSheet(
      isScrollControlled: false,
      useSafeArea: true,
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter mySetState) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonDropdownWidget(
                  isExpanded: true,
                  borderRadius: 12.r,
                  title: 'Select Network',
                  labelText: '',
                  value: selectedNetwork,
                  items: networksList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              AppConstant.commonText(
                                e.name,
                                fontSize: 14.sp,
                                color: Theme.of(context).colorScheme.shadow,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  backGroundColor: Theme.of(context).colorScheme.errorContainer,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onChanged: (val) {
                    mySetState(() {
                      selectedNetwork = val;
                    });
                  },
                ),
                CommonTextfield(
                  title: '',
                  isShowSpaceAfterTitle: false,
                  hintText: 'Please enter your token address',
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
                          ValidateWalletAddress.validateEVM(tokenAddress)) {
                        CryptoAssetInformation? newAssetInfo =
                            await db.getToken(tokenAddress, selectedNetwork!);
                        if (newAssetInfo != null) {
                          LogService.logger.i(newAssetInfo.toMap().toString());
                          mySetState(() {
                            selectedAsset = newAssetInfo;
                          });
                          tokenSymbolController.text = newAssetInfo.symbol;
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
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                CommonTextfield(
                  title: '',
                  isShowSpaceAfterTitle: false,
                  hintText: '',
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
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                CommonTextfield(
                  title: '',
                  isShowSpaceAfterTitle: false,
                  hintText: '',
                  isReadOnly: true,
                  controller: tokenDecimalController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CommonButton(
                  name: 'Okay',
                  onTap: () async {
                    try {
                      if (selectedNetwork != null && selectedAsset != null) {
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
                          tokenId:
                              selectedAsset!.tokenId, // sepolia Ethereum USDT
                          name: selectedAsset!.name,
                          symbol: selectedAsset!.symbol,
                          decimal: selectedAsset!.decimal,
                          networkId: selectedAsset!.networkId,
                          cmcId: tokenCMCID,
                          logo: "assets/img/cryptoicon/$tokenCMCID.png",
                        );

                        await db.importToken(newCryptoAsset, selectedNetwork!);
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
          );
        });
      },
    );
  }
}
