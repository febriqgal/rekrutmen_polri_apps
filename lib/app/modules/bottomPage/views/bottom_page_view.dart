import 'package:flutter/material.dart';

import 'package:rekrutmentpolri/app/modules/home/views/home_page.dart';
import 'package:rekrutmentpolri/app/modules/pendaftaran/views/pendaftaran_view.dart';
import 'package:rekrutmentpolri/app/modules/petunjuk/views/petunjuk_view.dart';
import 'package:rekrutmentpolri/app/modules/profile/views/profile_view.dart';

class BottomPageView extends StatefulWidget {
  const BottomPageView({Key? key}) : super(key: key);

  @override
  State<BottomPageView> createState() => _HomeViewState();
}

class _HomeViewState extends State<BottomPageView> {
  int _current = 0;
  List<Widget> pages = <Widget>[
    const HomeView(),
    const PendaftaranView(),
    const PetunjukView(),
    const ProfileView(),
  ];
  changetab(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_current],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changetab,
        currentIndex: _current,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/home.png',
              color: _current == 0 ? Colors.black : Colors.grey[500],
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/pendaftaran.png',
              color: _current == 1 ? Colors.black : Colors.grey[500],
              height: 24,
            ),
            label: 'Pendaftaran',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/petunjuk.png',
              color: _current == 2 ? Colors.black : Colors.grey[500],
              height: 24,
            ),
            label: 'Petunjuk',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/profile.png',
              color: _current == 3 ? Colors.black : Colors.grey[500],
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
