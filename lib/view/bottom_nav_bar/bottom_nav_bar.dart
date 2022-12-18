import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:santra_flutter_task/res/provider/bottom_nav_provider.dart';
import 'package:santra_flutter_task/res/widgets/bottom_nav_widgets/bottom_nav_content.dart';
import 'package:santra_flutter_task/utils/constants/colors.dart';
import 'package:santra_flutter_task/view/bottom_nav_bar/bottom_nav_bar_views/cart_view.dart';
import 'package:santra_flutter_task/view/bottom_nav_bar/bottom_nav_bar_views/home_view.dart';
import 'package:santra_flutter_task/view/bottom_nav_bar/bottom_nav_bar_views/overview_view.dart';
import 'package:santra_flutter_task/view/bottom_nav_bar/bottom_nav_bar_views/profile_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final screens = [
    const HomeView(),
    const OverViewView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context, listen: true);

    return Scaffold(
      extendBody: true,
      drawerEnableOpenDragGesture: false,
      body: Center(
        child: screens[bottomNavProvider.currentIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        elevation: 0,
        child: Container(
          // margin: const EdgeInsets.only(top: 1, left: 1, right: 1),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomnavcontent(
                    context: context,
                    passontap: () {
                      bottomNavProvider.setindex(0);
                    },
                    passicondata: FontAwesomeIcons.house,
                    passiconcolor: bottomNavProvider.currentIndex == 0
                        ? AppColor().bottomNavSelectedIconcolor
                        : AppColor().bottomNavUnSelectedIconcolor,
                    passtext: 'Home',
                  ),
                  bottomnavcontent(
                    context: context,
                    passontap: () {
                      bottomNavProvider.setindex(1);
                    },
                    passicondata: FontAwesomeIcons.hammer,
                    passiconcolor: bottomNavProvider.currentIndex == 1
                        ? AppColor().bottomNavSelectedIconcolor
                        : AppColor().bottomNavUnSelectedIconcolor,
                    passtext: 'OverView',
                  ),
                  bottomnavcontent(
                    context: context,
                    passontap: () {
                      bottomNavProvider.setindex(2);
                    },
                    passicondata: FontAwesomeIcons.cartShopping,
                    passiconcolor: bottomNavProvider.currentIndex == 2
                        ? AppColor().bottomNavSelectedIconcolor
                        : AppColor().bottomNavUnSelectedIconcolor,
                    passtext: 'Cart',
                  ),
                  bottomnavcontent(
                    context: context,
                    passontap: () {
                      bottomNavProvider.setindex(3);
                    },
                    passicondata: FontAwesomeIcons.user,
                    passiconcolor: bottomNavProvider.currentIndex == 3
                        ? AppColor().bottomNavSelectedIconcolor
                        : AppColor().bottomNavUnSelectedIconcolor,
                    passtext: 'Profile',
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
