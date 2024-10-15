import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_crypto_detail_tile.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/utils/app_strings.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonSelectTokenBottomSheet extends StatefulWidget {
  const CommonSelectTokenBottomSheet({super.key, required this.onTap});
  final Function(CryptoAssetRepositoryImpl selectedAsset) onTap;

  @override
  State<CommonSelectTokenBottomSheet> createState() =>
      _CommonSelectTokenBottomSheetState();
}

class _CommonSelectTokenBottomSheetState
    extends State<CommonSelectTokenBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;
  String searchText = "";

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppConstant.commonText("Select Crypto",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.shadow),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          Row(
            children: [
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
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                  hintText: AppStrings.searchTokenName,
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        searchText = value;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          height(10.h),
          CommonTabbar(
            padding: const EdgeInsets.only(left: 8),
            selectedIndex: selectedIndex,
            length: 5,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabController: tabController,
            tabList: const ['All', 'Native', 'ETH', 'BRC-20', 'Cosmos'],
          ),
          height(8.h),
          Expanded(
            child: BlocBuilder<CryptoDBRepositoryImpl, CryptoDBRepositoryState>(
              builder: (context, state) {
                bool containText(String name, String symbol) {
                  name = name.toLowerCase();
                  symbol = symbol.toLowerCase();
                  if (searchText == "") {
                    return true;
                  }
                  if (name.contains(searchText.toLowerCase()) ||
                      symbol.contains(searchText.toLowerCase())) {
                    return true;
                  }
                  return false;
                }

                List<CryptoAssetRepositoryImpl> assetList = [];
                assetList.addAll(state.assetList.where((e) {
                  if (selectedIndex == 0) {
                    return containText(e.getAsset().name, e.getAsset().symbol);
                  } else if (selectedIndex == 1) {
                    if (e.getAsset().type == AssetType.coin) {
                      return containText(
                          e.getAsset().name, e.getAsset().symbol);
                    }
                  } else if (selectedIndex == 2) {
                    if (e.getAsset().networkId == 1) {
                      return containText(
                          e.getAsset().name, e.getAsset().symbol);
                    }
                  } else if (selectedIndex == 3) {
                    if (e.getAsset().networkId == 0) {
                      return containText(
                          e.getAsset().name, e.getAsset().symbol);
                    }
                  } else if (selectedIndex == 4) {
                    if (e.getAsset().networkId == 10) {
                      return containText(
                          e.getAsset().name, e.getAsset().symbol);
                    }
                  }
                  return false;
                }));
                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => height(6.h),
                  itemCount: assetList.length,
                  itemBuilder: (context, index) => CommonCryptoDetailTile(
                    context: context,
                    contentPadding: const EdgeInsets.only(left: 8),
                    coinName: assetList.elementAt(index).getAsset().name,
                    coinImageUrl:
                        "${AppHelper.appDir}/${assetList.elementAt(index).getAsset().logo}",
                    coinShortName: assetList.elementAt(index).getAsset().symbol,
                    coinBalance: assetList.elementAt(index).state.balance,
                    coinPriceInUSD:
                        assetList.elementAt(index).state.quote.priceInUSD,
                    isQuoteLoading: assetList.elementAt(index).state.quoteState,
                    isBalanceLoading:
                        assetList.elementAt(index).state.assetState,
                    onTap: () {
                      Navigator.of(context).pop();
                      widget.onTap(assetList.elementAt(index));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
