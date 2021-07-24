import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_sharing/subjects/global_keys/global_key.dart';
import 'package:key_sharing/subjects/key.dart';
import 'package:key_sharing/subjects/local_keys/local_key.dart';
import 'package:key_sharing/themes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

  final List<TabInfo> _tabList = [
    TabInfo('Keys', Icons.vpn_key),
    TabInfo('GlobalKeys', Icons.vpn_key_outlined),
    TabInfo('LocalKeys', Icons.vpn_key_outlined),
  ];

  List<Widget> get _presentationPages => [
        KeySubject(),
        GlobalKeySubject(),
        LocalKeySubject(),
      ];

  List<BottomNavigationBarItem> get _bottomNavigationItems => _tabList.map((_tab) {
        const double iconSize = 30.0;
        return BottomNavigationBarItem(
          label: _tab.label,
          icon: Icon(
            _tab.iconData,
            size: iconSize,
            color: MyTheme.gray800,
          ),
          activeIcon: Icon(
            _tab.iconData,
            size: iconSize,
            color: MyTheme.SpecialLimeGreen,
          ),
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    final _currentTabIndex = 0.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Keys Sharing',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'GoogleSans',
          ),
        ),
        backgroundColor: MyTheme.SpecialLimeGreen,
      ),
      body: PageView(
        children: _presentationPages,
        controller: _pageController,
        onPageChanged: (newPageIndex) => _currentTabIndex.value = newPageIndex,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomNavigationItems,
          selectedItemColor: MyTheme.SpecialLimeGreen,
          currentIndex: _currentTabIndex.value,
          onTap: (tabIndex) {
            _pageController.jumpToPage(tabIndex);
            _currentTabIndex.value = tabIndex;
          },
        ),
      ),
    );
  }
}

class TabInfo {
  const TabInfo(this.label, this.iconData);

  final String label;
  final IconData iconData;
}
