import 'package:flutter/material.dart';
import 'package:oshiten_app/home.dart';
import 'search.dart';
import 'myPage.dart';
import 'oshimati.dart';
import 'conditionsLineUp.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({required this.selectedIndex});
  final int selectedIndex;

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();

}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int selectedIndex = 3;

  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }
  final _pageOptions = [
    Search(),
    const Oshimati(),
    const ConditionsLineUp(),
    const MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '探す'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '推し待ち'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.front_hand),
              label: '推す'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'マイページ'
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (index){
          setState((){
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
