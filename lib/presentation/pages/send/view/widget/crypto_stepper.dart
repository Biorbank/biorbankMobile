import 'dart:io';

import 'package:biorbank/generated/assets.dart';
import 'package:biorbank/presentation/common/common_textfield.dart';
import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/presentation/pages/send/cubit/send_money_cubit.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/bloc/transactiontracker/transaction_history_impl.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:biorbank/utils/helpers/app_helper.dart';
import 'package:biorbank/utils/models/transaction_detail_model.dart';
import 'package:biorbank/utils/repositories/crypto_asset_repostiory_impl.dart';
import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common_button.dart';

class CryptoStepper extends StatefulWidget {
  const CryptoStepper({super.key});

  @override
  State<CryptoStepper> createState() => _CryptoStepperState();
}

class _CryptoStepperState extends State<CryptoStepper> {
  List<CryptoAssetRepositoryImpl> assetList = [];
  CryptoAssetRepositoryImpl? selectedAsset;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    migration();
  }

  migration() {
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    setState(() {
      assetList.addAll(db.state.assetList);
      selectedAsset = db.state.assetList.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<SendMoneyCubit, SendMoneyState>(
        builder: (context, state) {
          var cubit = context.read<SendMoneyCubit>();
          if (state is StepperIndexState) {
            cubit.activeStepIndex = state.index;
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stepper(
                  stepIconMargin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 0,
                  // stepIconBuilder: (stepIndex, stepState) {
                  //   return null;
                  // },
                  controlsBuilder: (context, details) =>
                      const SizedBox.shrink(),
                  physics: const NeverScrollableScrollPhysics(),
                  connectorThickness: 2,
                  margin: EdgeInsets.zero,
                  currentStep: cubit.activeStepIndex,
                  type: StepperType.vertical,
                  onStepTapped: (value) {
                    cubit.onChangeStepperIndex(index: value);
                  },
                  steps: [
                    Step(
                        state: StepState.complete,
                        isActive: cubit.activeStepIndex >= 0,
                        stepStyle: StepStyle(
                          connectorColor: cubit.activeStepIndex >= 0
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        content: CommonDropdownWidget(
                          isExpanded: true,
                          borderRadius: 12.r,
                          title: 'Crypto',
                          labelText: '',
                          value: selectedAsset,
                          items: assetList
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                      children: [
                                        Image.file(
                                          File(
                                              "${AppHelper.appDir}/${e.getAsset().logo}"),
                                          width: 25.w,
                                          height: 25.w,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        AppConstant.commonText(
                                            e.getAsset().name,
                                            fontSize: 14.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .shadow),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          backGroundColor:
                              Theme.of(context).colorScheme.errorContainer,
                          onChanged: (val) {
                            setState(() {
                              selectedAsset = val;
                            });
                          },
                        ),
                        title: AppConstant.commonText('Select Crypto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.shadow)),
                    Step(
                      state: StepState.complete,
                      isActive: cubit.activeStepIndex >= 1,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppConstant.commonText('Deposit address',
                                  fontSize: 14.sp,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.shadow),
                              Row(
                                children: [
                                  AppConstant.commonText('Manage address',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  width(4.w),
                                  Image.asset(Assets.imagesArrowRight,
                                      height: 13.h,
                                      width: 13.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)
                                ],
                              )
                            ],
                          ),
                          CommonTextfield(
                            title: '',
                            isShowSpaceAfterTitle: false,
                            hintText: 'Please enter your withdrawal address',
                            suffixWidget: Image.asset(
                              Assets.imagesCopyRounded,
                              height: 16.h,
                              width: 16.w,
                              fit: BoxFit.cover,
                            ),
                            controller: cubit.recipientAddressController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppConstant.commonText(
                                        'USDT Account Equity',
                                        fontSize: 12.sp,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer),
                                    height(6.h),
                                    AppConstant.commonText(
                                        'USDT Account Equity',
                                        fontSize: 14.sp,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                  ],
                                ),
                              ),
                              width(20.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppConstant.commonText('Withdrawal Fee',
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: 12.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer),
                                    height(6.h),
                                    AppConstant.commonText('0 - 4 USDT',
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      stepStyle: StepStyle(
                        connectorColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        color: cubit.activeStepIndex >= 1
                            ? Theme.of(context).colorScheme.onPrimary
                            : const Color(0xFFEBEBEB),
                      ),
                      title: AppConstant.commonText('Withdraw To',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.shadow),
                    ),
                    Step(
                      state: StepState.complete,
                      isActive: cubit.activeStepIndex >= 2,
                      title: AppConstant.commonText('Withdraw Amount',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.shadow),
                      content: const SizedBox.shrink(),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Withdrawal amount',
                      fontSize: 12.sp,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppConstant.commonText('Withdrawal limit: 3.000.000 USDT',
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      width(8.w),
                      Image.asset(
                        Assets.imagesInfo,
                        height: 12.h,
                        width: 12.w,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      )
                    ],
                  ),
                ],
              ),
              height(12.h),
              CommonTextfield(
                title: '',
                hintText: 'Minimum withdrawal amount: 1',
                suffixWidget: Text.rich(TextSpan(
                    text: 'ALL',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary),
                    children: [
                      WidgetSpan(child: width(8.w)),
                      TextSpan(
                          text: 'USDT',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.shadow))
                    ])),
                controller: cubit.withdrawAmountController,
              ),
              height(6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text: 'Available',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      children: [
                        WidgetSpan(child: width(8.w)),
                        TextSpan(
                            text: '3.000.000 USDT',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.shadow))
                      ])),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.imagesSwapArrow,
                          height: 12.h,
                          width: 12.w,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        width(6.w),
                        AppConstant.commonText('Transfer',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ],
                    ),
                  )
                ],
              ),
              height(14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Transaction fees',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  AppConstant.commonText('3.0638816 USDT',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
              height(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppConstant.commonText('Actual amount received',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  AppConstant.commonText('-- USDT',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.shadow),
                ],
              ),
              height(20.h),
              CommonButton(
                name: 'Withdraw',
                onTap: () async {
                  try {
                    double sendAmount = double.parse(
                        cubit.withdrawAmountController.text == ""
                            ? "0"
                            : cubit.withdrawAmountController.text);
                    String recipientAddressString =
                        cubit.recipientAddressController.text;
                    CryptoDBRepositoryImpl db =
                        context.read<CryptoDBRepositoryImpl>();

                    if (true) {
                      int usdterc20Index = db.state.assetList.indexWhere(
                              (asset) =>
                          asset.getAsset().symbol ==
                              "INJ");

                      if (usdterc20Index != -1) {
                        CryptoAssetRepositoryImpl usdterc20 =
                        db.state.assetList[usdterc20Index];

                        String txHash = await usdterc20.sendBalance(
                            sendAmount, recipientAddressString);
                      /*int usdterc20Index = db.state.assetList.indexWhere(
                          (asset) =>
                              asset.getAsset().tokenId ==
                              "0xaA8E23Fb1079EA71e0a56F48a2aA51851D8433D0");

                      if (usdterc20Index != -1) {
                        CryptoAssetRepositoryImpl usdterc20 =
                            db.state.assetList[usdterc20Index];

                        String txHash = await usdterc20.sendBalance(
                            sendAmount, recipientAddressString);

                        if (context.mounted) {
                          addTransactionHistory(
                            context,
                            db,
                            usdterc20Index,
                            usdterc20,
                            cubit.recipientAddressController.text,
                            sendAmount,
                            txHash,
                          );
                        }*/

                        LogService.logger.i(
                            "===========transaction id=========== ${txHash}");
                        // successToast("Trnx: ${txHash}");
                        return;
                      }
                    }
                    /* 
                    // ! We use ERC20 for all other chains
                    final erc20AbiString =
                        await rootBundle.loadString('assets/abi/ERC-20.json');

                    ContractAbi? _erc20Abi =
                        ContractAbi.fromJson(erc20AbiString, 'ERC20');
                    final contract = DeployedContract(
                        _erc20Abi,
                        EthereumAddress.fromHex(
                            "0xaA8E23Fb1079EA71e0a56F48a2aA51851D8433D0"));
                    
                    final ethAddress = EthereumAddress.fromHex(
                        cubit.recipientAddressController.text);

                    final tokenTransfertransaction = Transaction.callContract(
                      contract: contract,
                      function: contract.function('transfer'),
                      parameters: <dynamic>[
                        ethAddress,
                        _convertToBigInt(sendAmount)
                      ],
                    );

                    // Setup Web3 Client
                    var httpClient = http.Client();

                    final _wallet =
                        AppHelper.walletService.currentWallet.ethwallet;

                    final Credentials credentials =
                        EthPrivateKey.fromHex(_wallet.privateKey);
                    final Web3Client _web3client = Web3Client(
                        "https://dimensional-dark-daylight.ethereum-sepolia.quiknode.pro/d8ea75dfa368b9d3331062d83efd4276af41d573",
                        httpClient);
                    final response = await _web3client.sendTransaction(
                        credentials, tokenTransfertransaction,
                        chainId: 11155111);
                    LogService.logger.i("===========transaction id===========");
                    LogService.logger.i(response);
                    successToast("Trnx: ${response}"); */
                  } catch (error) {
                    LogService.logger.e('_sendTokenTransaction ${error}');
                    rethrow;
                  }
                },
              ),
              height(60)
            ],
          );
        },
      ),
    );
  }

  Future<void> addTransactionHistory(
      BuildContext context,
      CryptoDBRepositoryImpl db,
      int assetIndex,
      CryptoAssetRepositoryImpl asset,
      String recipientAddressString,
      double sendAmount,
      String txHash) async {
    await db.addTransactionHistory(
        TransactionType.send,
        txHash,
        assetIndex,
        asset.getAsset().networkId,
        TransactionDetail(
          amount: sendAmount,
          from: asset.getPublicKey(),
          to: recipientAddressString,
        ),
        TransactionStatus.pending, //TODO need change in the future
        0,
        DateTime.now());
  }

  Future<bool> checkTransactionSafety(BuildContext context,
      CryptoAssetRepositoryImpl asset, String recipient) async {
    // try {
    //   int txCount =
    //       await checkIfIsSafeTransaction(recipient, asset.getNetwork());
    //   if (txCount == 0 && context.mounted) {
    //     var confirmed = await showConfirmTransactionDialog(context, recipient);
    //     if (confirmed == true) return true;
    //     return false;
    //   }
    //   return true;
    // } catch (error) {}

    return true;
  }
}
