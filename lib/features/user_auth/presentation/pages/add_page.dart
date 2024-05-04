
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/about_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/profile_page.dart';
import 'package:flutter_app/features/user_auth/presentation/pages/setting_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    return  Scaffold(
        appBar: AppBar(
          title: Text("Add Page"),
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
                  await FirebaseAuth.instance.signOut();
                  await _auth.signOut();
                  await googleSignIn.disconnect();
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      body: Center(
        child:
          Text("Add Page")
      )
    );
  }
}
