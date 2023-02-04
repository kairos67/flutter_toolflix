import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST API Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('REST API Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Photo>>(
            future: fetchPhotos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Image.network(snapshot.data[index].thumbnailUrl);
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<List<Photo>> fetchPhotos() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/photos');

  if (response.statusCode == 200) {
    List<Photo> photos = (json.decode(response.body) as List)
        .map((data) => Photo.fromJson(data))
        .toList();
    return photos;
  } else {
    throw Exception('Failed to load photos');
  }
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
