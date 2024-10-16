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
  final List<Map<String, dynamic>> positions = [
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': '0xfAA..c69e',
      'isShowActionButton': true,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': '0xfAA..c69e',
      'isShowActionButton': true,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': '0xfAA..c69e',
      'isShowActionButton': true,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': '0xfAA..c69e',
      'isShowActionButton': true,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': '0xfAA..c69e',
      'isShowActionButton': true,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': 'Support@BiiorBank.com',
      'isShowActionButton': false,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': 'Support@BiiorBank.com',
      'isShowActionButton': false,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': 'Support@BiiorBank.com',
      'isShowActionButton': false,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': 'Support@BiiorBank.com',
      'isShowActionButton': false,
    },
    {
      'name': 'Ralph Edwards',
      'imageUrl':
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'address': 'Support@BiiorBank.com',
      'isShowActionButton': false,
    },
  ];
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context.read<ContactCubit>().changeTabIndex(index: tabController.index);
    });
    WidgetsBinding.instance.addPostFrameCallback((t) {
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
                      textController: TextEditingController(),
                    ),
                  ],
                ),
              ),
            ),
            height(15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                    context: context,
                    builder: (context) => const AddWeb3ContactWidget(),
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
                        width(5.w),
                        AppConstant.commonText('Add Contact',
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w500),
                        width(5.w),
                        const Icon(
                          Icons.filter_list_alt,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            height(15.h),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => height(18.h),
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                shrinkWrap: true,
                itemCount: positions.length,
                itemBuilder: (context, index) => ContactCard(
                  imageUrl: positions[index]['imageUrl'],
                  name: positions[index]['name'],
                  id: positions[index]['address'],
                  isShowActionButtons: positions[index]['isShowActionButton'],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
