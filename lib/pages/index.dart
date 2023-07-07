import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:stt_mobile/pages/HomePage.dart';
import 'package:stt_mobile/pages/InfoPage.dart';
import 'package:stt_mobile/pages/ProfilePage.dart';
import 'package:stt_mobile/pages/StorePage.dart';
import 'package:stt_mobile/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  List<Widget> _pageOptions = [
    HomePage(),
    StorePage(),
    InfoPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_pageOptions.elementAt(_currentIndex)],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: const Text("Home"),
                selectedColor: Colors.black),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: const Text("Search"),
              selectedColor: Colors.black,
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.upload,
                color: Colors.black,
              ),
              title: const Text("Upload"),
              selectedColor: Colors.black,
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text("Profile"),
              selectedColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
