import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_sharing/demos/key_demo_1.dart';
import 'package:key_sharing/demos/key_demo_2.dart';
import 'package:key_sharing/themes.dart';

final class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController _pageController = PageController();

  final List<TabInfo> _tabList = [
    const TabInfo('Demo 1', Icons.vpn_key_outlined, Icons.vpn_key),
    const TabInfo('Demo 2', Icons.vpn_key_outlined, Icons.vpn_key),
  ];

  List<Widget> get _presentationPages => [
        const KeyDemo1(),
        const KeyDemo2(),
      ];

  Widget _buildPresentationPages(_, int index) => _presentationPages[index];

  PageStorageKey<int> _getPageStorageKey(int? key) {
    final Map<int, PageStorageKey<int>> pageStorageKeys = {};

    if (key != null) {
      if (!pageStorageKeys.containsKey(key)) {
        pageStorageKeys[key] = PageStorageKey(key);
      }
      return pageStorageKeys[key]!;
    }

    return PageStorageKey(UniqueKey().hashCode);
  }

  List<BottomNavigationBarItem> get _bottomNavigationItems => _tabList.map((tab) {
        const double iconSize = 30.0;
        return BottomNavigationBarItem(
          label: tab.label,
          icon: Icon(
            tab.iconData,
            size: iconSize,
            color: MyTheme.gray800,
          ),
          activeIcon: Icon(
            tab.selectedIconData,
            size: iconSize,
            color: MyTheme.specialLimeGreen,
          ),
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    final currentTabIndex = 0.obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Keys Sharing',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'GoogleSans',
          ),
        ),
        backgroundColor: MyTheme.specialLimeGreen,
      ),
      body: PageView.builder(
        key: _getPageStorageKey(currentTabIndex.value),
        itemBuilder: _buildPresentationPages,
        itemCount: _presentationPages.length,
        controller: _pageController,
        onPageChanged: (newPageIndex) => currentTabIndex.value = newPageIndex,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomNavigationItems,
          selectedItemColor: MyTheme.specialLimeGreen,
          currentIndex: currentTabIndex.value,
          onTap: (tabIndex) {
            _pageController.jumpToPage(tabIndex);
            currentTabIndex.value = tabIndex;
          },
        ),
      ),
    );
  }
}

class TabInfo {
  const TabInfo(this.label, this.iconData, this.selectedIconData);

  final String label;
  final IconData iconData;
  final IconData selectedIconData;
}
