import 'package:flutter/material.dart';
import 'search.dart';
import 'myPage.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {

  int _selectedIndex = 3;
  final _pageOptions = [
    const search(),
    const search(),
    const search(),
    const myPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
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
        currentIndex: _selectedIndex,
        onTap: (index){
          setState((){
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
