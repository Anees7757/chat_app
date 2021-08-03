import 'dart:ui';
import 'package:chat_app_ui/google_sign_in.dart';
import 'package:chat_app_ui/screens/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../pages/profile.dart';
import 'package:flutter/material.dart';
import '../widgets/category_selector.dart';
import '../widgets/favorite_contacts.dart';
import '../widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
            child: Icon(Icons.logout)
        ),
        elevation: 0,
        centerTitle: true,
        title: Text('Messenger',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )),
        actions: <Widget>[
      GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        },
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(user.photoURL),
            )
          ],
        ),
      ),
          SizedBox(width: 10,),
        ],
      ),
      // drawer: Drawer(
      //   elevation: 50.0,
      //   child: ListView(
      //     padding: EdgeInsets.all(0.0),
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Theme.of(context).primaryColor,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Stack(
      //               children: [
      //                 CircleAvatar(
      //                   radius: 40,
      //                   backgroundImage: NetworkImage(user.photoURL),
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height: 7.0,),
      //             Text(user.displayName,
      //                 style: TextStyle(
      //                     fontSize: 21.0,
      //                     color: Colors.white)),
      //             SizedBox(height: 3.0,),
      //             Text('Hey there, I\'m using Messenger.',
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 11.0,
      //                   color: Color(0xFFFFEFEE),
      //                 )),
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('My Profile',
      //             style: TextStyle(
      //               fontSize: 17.0,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.blueGrey,
      //             )),
      //         leading: Icon(Icons.person, color: Theme.of(context).primaryColor,),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Profile()),
      //           );
      //         },
      //       ),
      //       //Divider(thickness: 1, height: 1, color: Theme.of(context).primaryColor,),
      //       ListTile(
      //         leading: Icon(Icons.contacts, color: Theme.of(context).primaryColor,),
      //         title: Text('Contacts',
      //             style: TextStyle(
      //               fontSize: 17.0,
      //               color: Colors.blueGrey,
      //               fontWeight: FontWeight.bold,
      //             )),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Contacts()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.archive, color: Theme.of(context).primaryColor,),
      //         title: Text('Archived',
      //             style: TextStyle(
      //               fontSize: 17.0,
      //               color: Colors.blueGrey,
      //               fontWeight: FontWeight.bold,
      //             )),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Archived()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //           leading: Icon(Icons.person_add,color: Theme.of(context).primaryColor,),
      //           title: Text('Invite friends',
      //               style: TextStyle(
      //                 fontSize: 17.0,
      //                 color: Colors.blueGrey,
      //                 fontWeight: FontWeight.bold,
      //               )),
      //           onTap: () {},
      //         ),
      //       ListTile(
      //         leading: Icon(Icons.settings, color: Theme.of(context).primaryColor,),
      //         title: Text('Settings',
      //             style: TextStyle(
      //               fontSize: 17.0,
      //               color: Colors.blueGrey,
      //               fontWeight: FontWeight.bold,
      //             )),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Settings()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.feedback, color: Theme.of(context).primaryColor,),
      //         title: Text('Help and Feedback',
      //             style: TextStyle(
      //               fontSize: 17.0,
      //               color: Colors.blueGrey,
      //               fontWeight: FontWeight.bold,
      //             )),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.logout, color: Theme.of(context).primaryColor,),
      //         title: Text('Logout',
      //             style: TextStyle(
      //               fontSize: 17.0,
      //               color: Colors.blueGrey,
      //               fontWeight: FontWeight.bold,
      //             )),
      //         onTap: () {
      //           final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
      //           provider.Logout();
      //         },
      //       ),
      //       SizedBox(height: 100,),
      //       ListTile(
      //         title: Padding(
      //           padding: EdgeInsets.only(left: 20.0),
      //           child: Column(
      //             children: [
      //               Text('from',
      //                   style: TextStyle(
      //                     fontSize: 12.0,
      //                     color: Colors.grey,
      //                   )),
      //               Text('SIRIUS INC.',
      //                   style: TextStyle(
      //                     fontSize: 13.0,
      //                     fontWeight: FontWeight.bold,
      //                   )),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.search, color: Theme.of(context).primaryColor, size: 30,),
        elevation: 30,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Search()),
          );
        },
      ),
    );
  }
}
