import 'package:auto_route/auto_route.dart';
import 'package:biorbank/presentation/common/common_blue_container.dart';
import 'package:biorbank/presentation/common/common_search_appbar.dart';
import 'package:biorbank/presentation/common/common_tabbar.dart';
import 'package:biorbank/presentation/pages/contacts_page/cubit/contact_cubit.dart';
import 'package:biorbank/presentation/pages/contacts_page/view/widget/add_web2_contact.dart';
import 'package:biorbank/presentation/pages/contacts_page/view/widget/add_web3_contact.dart';
import 'package:biorbank/presentation/pages/contacts_page/view/widget/contact_card.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context.read<ContactCubit>().changeTabIndex(index: tabController.index);
    });
    WidgetsBinding.instance.addPostFrameCallback((t){
     context.read<ContactCubit>().changeTabIndex(index: 0);

    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        var cubit = context.read<ContactCubit>();
        if (state is ContactTabIndexChangeState) {
          cubit.tabIndex = state.index;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonBlueContainer(
              height: 120.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(35.h),
                    CommonSearchAppbar(
                      hintText: 'Address, ens, name..',
                      onTapBellIcon: () {},
                      textController: TextEditingController(),
                    ),
                  ],
                ),
              ),
            ),
            height(15.h),
            CommonTabbar(
                selectedIndex: cubit.tabIndex,
                length: 2,
                 padding:const EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.fill,
                isScrollable: false,
                  labelTextBackgroundPadding:
                const EdgeInsets.symmetric( vertical: 10),
                labelColor: Theme.of(context).colorScheme.shadow,
                isShowBackgroundShadow: true,
                onTap: (index) {},
                tabController: tabController,
                tabList: const ['Web3', 'Web2']),
            height(20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                    context: context,
                    builder: (context) => cubit.tabIndex == 0
                        ? const AddWeb3ContactWidget()
                        : const AddWeb2ContactWidget(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppConstant.commonText('Contact',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.shadow),
                    Row(
                      children: [
                        Container(
                          height: 18.h,
                          width: 18.w,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            size: 15,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        width(15.w),
                        AppConstant.commonText('Add Contact',
                            color: Theme.of(context).colorScheme.shadow,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            height(15.h),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                ListView.separated(
                  separatorBuilder: (context, index) => height(18.h),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => const ContactCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
                    name: 'Ralph Edwards',
                    id: '0xfAA..c69e',
                  ),
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => height(18.h),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => const ContactCard(
                    isShowActionButtons: false,
                    imageUrl:
                        'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
                    name: 'Dianne Russell',
                    id: 'Support@BiiorBank.com',
                  ),
                ),
              ]),
            )
          ],
        );
      },
    );
  }
}
