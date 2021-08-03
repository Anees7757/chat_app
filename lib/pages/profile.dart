import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final user = FirebaseAuth.instance.currentUser;

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void _showDialog(String data, String type, String userData, TextEditingController _controller, TextCapitalization cap) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            textCapitalization: cap,
            autofocus: true,
            decoration: InputDecoration(
              hintText: data,
              helperText: type,
            ),
            controller: _controller,
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
               setState(() {
                 if(_controller == nameController) {
                   user.updateDisplayName(nameController.text);
                 }
                 _controller.clear();
               });
              },
            ),
          ],
        );
      },
    );
  }

  Future getImage() async{
    final ImagePicker _picker = ImagePicker();
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      user.updatePhotoURL('https://upload.wikimedia.org/wikipedia/commons/a/a0/Arh-avatar.jpg');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                            radius: 75.0,
                              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREISsiPRcwBjquJjSWerZAzcRpyK0YozMNYdgQfAmthmQx9I339DRL2K05a2Pht7WCWK4&usqp=CAU"),
                              foregroundImage: NetworkImage(user.photoURL),
                          ),
                            Positioned(
                              top: 105,
                              left: 105,
                              child: Container(
                                width: 40,
                                height: 40,
                                  child: IconButton(
                                      icon: Icon(Icons.camera_alt, color: Colors.white,),
                                    onPressed: (){
                                          getImage();
                                    },
                                  ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                          ListTile(
                                  leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
                                  title: Text(
                                    'Name',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.displayName,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text(
                                        "Note: This name will be visible to your contacts only!",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(Icons.edit, color: Colors.grey),
                            onTap: (){
                              _showDialog(user.displayName, 'Enter Name & press OK\n It will take a while to change Name\nThanks!', 'user.displayName', nameController, TextCapitalization.words);
                            },
                          ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(70, 10, 0, 10),
                          child: Divider(
                            thickness: 1,
                            height: 2,
                          ),
                        ),
                          ListTile(
                            leading: Icon(Icons.alternate_email, color: Theme.of(context).primaryColor),
                            title: Text(
                              'Username',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  usernameController.text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10.0,),
                                Text(
                                  "Note: You can change Username only once!",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                  //overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            trailing: Icon(Icons.edit, color: Colors.grey),
                            onTap: (){
                              _showDialog("", 'Enter UserName & press OK\n It will take a while to change UserName\n Thanks!', "${usernameController.text}", usernameController, TextCapitalization.none);
                              },
                          ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(70, 10, 0, 10),
                          child: Divider(
                            thickness: 1,
                            height: 2,
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.email_outlined, color: Theme.of(context).primaryColor),
                          title: Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          subtitle: Text(
                            user.email,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 100,),
                        Center(
                          child: Text('SIRIUS INC.',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}
