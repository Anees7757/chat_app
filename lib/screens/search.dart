import 'package:flutter/material.dart';

class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: searchTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      ),
                      border: InputBorder.none,
                    ),
                  )),
                  Container(
                    height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                         colors: [
                           Colors.blueGrey,
                           Colors.blueGrey[200],
                         ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.search, size: 27, color: Colors.white)
                  ),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
