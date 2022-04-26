import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/post_api_service.dart';

class SingleCityPage extends StatelessWidget {
  final String cityId;

  const SingleCityPage({
    required this.cityId,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Web City'),
      ),
      body: FutureBuilder<Response>(
        future: Provider.of<PostApiService>(context).getPost(cityId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // final Map post = json.decode(snapshot.data!.bodyString);
            // print (post);
            Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(snapshot.data!.bodyString));

            // print(data['main']['temp']);

            return _buildPost(data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Padding _buildPost(Map data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Country code: '),
                Text(data['sys']['country'].toString()),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'City: $cityId',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Temperature: '),
                Text(data['main']['temp'].toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}