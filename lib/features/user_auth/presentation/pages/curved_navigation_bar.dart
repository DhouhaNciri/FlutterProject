import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/about_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/add_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/favorite_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/home_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/profile_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/setting_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../../../provider/provider.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    HomePage(),
    AddPage(),
    FavoritePage()
  ];

  int _currentIndex = 0;

  get googleSignIn => null;

  @override
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    return Consumer<UiProvider>(builder: (context, notifier, child) {
      return Scaffold(
        backgroundColor: notifier.isDark ? Colors.black : Colors.white,
        body: _pages[_currentIndex],
        // drawer: Drawer(
        //   backgroundColor: notifier.isDark ? Colors.black : Colors.white,
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: <Widget>[
        //       DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Color.fromARGB(255, 5, 120, 120),
        //         ),
        //         child: Image.asset(
        //           'images/TunisiaApp.jpg',
        //           width: 1500,
        //           height: 1500,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.settings),
        //         title: Text('Setting'),
        //         onTap: () => Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => SettingsPage())),
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.person),
        //         title: Text('Profile'),
        //         onTap: () => Navigator.of(context)
        //             .push(MaterialPageRoute(builder: (context) => ProfilePage())),
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.info),
        //         title: Text('About'),
        //         onTap: () => Navigator.of(context)
        //             .push(MaterialPageRoute(builder: (context) => AboutPage())),
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.logout),
        //         title: Text('Logout'),
        //         onTap: () async {
        //           await FirebaseAuth.instance.signOut();
        //           await _auth.signOut();
        //           await googleSignIn.disconnect();
        //           Navigator.of(context)
        //               .push(
        //               MaterialPageRoute(builder: (context) => LoginPage()));
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 5, 120, 120),
          animationDuration: Duration(milliseconds: 300),
          items: [
            Icon(Icons.home),
            Icon(Icons.add),
            Icon(Icons.favorite),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      );
    });
  }
}