import 'package:flutter/material.dart';

class CountryListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('country list page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text("국가 리스트", style: TextStyle(color: Colors.white)),
              onPressed: () {

              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("추가 버튼", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/country/search');
              },
            ),
          ],
        ),
      ),

    );
  }
}