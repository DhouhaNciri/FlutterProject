// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/features/user_auth/presentation/pages/about_page.dart';
//
// import 'package:flutter_app/features/user_auth/presentation/pages/login_page.dart';
// import 'package:flutter_app/features/user_auth/presentation/pages/profile_page.dart';
// import 'package:flutter_app/features/user_auth/presentation/pages/setting_page.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../provider/provider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     return Consumer(builder: (context, UiProvider notifier, child) {
//       return Scaffold(
//     //     bottomNavigationBar: CurvedNavigationBar(
//     //        backgroundColor: Colors.lightGreen,
//     //
//     //         animationDuration: Duration(milliseconds: 300),
//     //         items: const [
//     //
//     //          Icon(Icons.home),
//     //           Icon(Icons.add),
//     //          Icon(Icons.favorite)],
//     //         onTap: (index) {
//     //       // Gérer la redirection en fonction de l'index de l'icône
//     //
//     // },),
//     //     backgroundColor: notifier.isDark ? Colors.black : Colors.white,
//         appBar: AppBar(
//           backgroundColor: notifier.isDark ? Colors.black : Colors.white,
//           title: Text("HomePage"),
//         ),
//         body: Center(
//           child: Text("Welcome To Home"),
//         ),
//         drawer: Drawer(
//           backgroundColor: notifier.isDark ? Colors.black : Colors.white,
//           // Utilisez le thème sombre si activé
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color:  Color.fromARGB(255, 5, 120, 120),
//                 ),
//                 child: Image.asset(
//                   'images/TunisiaApp.jpg',
//                   width: 1500,
//                   height: 1500,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text('Setting'),
//                 onTap: () =>
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => SettingsPage())),
//               ),
//               ListTile(
//                 leading: Icon(Icons.person), // Icône Profile
//                 title: Text('Profile'),
//                 onTap: () =>
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => ProfilePage())),
//               ),
//               ListTile(
//                 leading: Icon(Icons.info), // Icône About
//                 title: Text('About'),
//                 onTap: () =>
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => AboutPage())),
//               ),
//               ListTile(
//                  leading: Icon(Icons.logout), // Icône Logout
//                  title: Text('Logout'),
//                  onTap: () async {
//                    await FirebaseAuth.instance.signOut();
//                    await _auth.signOut();
//                   await googleSignIn.disconnect();
//                    Navigator.of(context)
//                       .push(
//                        MaterialPageRoute(builder: (context) => LoginPage()));
//                  },
//                ),
//             ],
//           ),
//         ),
//       );
//     }
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/about_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/login_page.dart';

import 'package:flutter_app/features/user_auth/presentation/pages/profile_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/setting_page.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(

        // Utilisez le thème sombre si activé
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color:  Color.fromARGB(255, 5, 120, 120),
              ),
              child: Image.asset(
                'images/TunisiaApp.jpg',
                width: 1500,
                height: 1500,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsPage())),
            ),
            ListTile(
              leading: Icon(Icons.person), // Icône Profile
              title: Text('Profile'),
              onTap: () =>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage())),
            ),
            ListTile(
              leading: Icon(Icons.info), // Icône About
              title: Text('About'),
              onTap: () =>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutPage())),
            ),
            ListTile(
              leading: Icon(Icons.logout), // Icône Logout
              title: Text('Logout'),
              onTap: () async {
                //await FirebaseAuth.instance.signOut();
                await _auth.signOut();
                // await googleSignIn.disconnect();
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),

          ],
        ),
      ),
      body: Container(

        child: Center(
          child: Text('This is the home Page'),
        ),

        //
      ),
    );
  }
}

