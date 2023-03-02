import 'package:flutter/material.dart';

Widget contentFetchingData() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(
            strokeWidth: 10,
          )),
      Text('Fetching data...')
    ],
  );
}

Widget contentNotFetched() {
  return Column(
    children: [
      Text('Please restart the app'),
    ],
    mainAxisAlignment: MainAxisAlignment.center,
  );
}

Widget contentNoData() {
  return Text('No Data to show');
}
