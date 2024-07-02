import 'package:flutter/material.dart';
import 'package:stadiumapp/view/screens/games.dart';
import 'package:stadiumapp/view/screens/myticketsPage.dart';
import 'package:stadiumapp/view/screens/profileScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

int _selectedIndex = 1;
List<Widget> screenList = [
  MyTicketsPage(),
  GamesPage(),
  ProfileScreen(),
];

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: screenList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.lightBlue,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blueGrey,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.book_online), label: "Tickets"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_basketball_rounded), label: "Games"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     nextPageNavigation(context, AddDataScreen());
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
