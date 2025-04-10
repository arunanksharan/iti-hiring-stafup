import 'package:flutter/material.dart';
import 'package:stafup/feature/screen/home/presentation/home_page.dart';
import 'package:stafup/feature/screen/company_profile/presentation/company_profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, this.companyId});

  final String? companyId;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final String tag = '/BottomNavigation';
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [
      HomePage(companyId: widget.companyId), 
      CompanyProfilePage(companyId: widget.companyId)
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.business_outlined),
        title: ("Company"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      margin: const EdgeInsets.only(bottom: 2),
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: false,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardAppears: true,

      stateManagement: true,
      navBarStyle: NavBarStyle.style3,
    );
  }
}
