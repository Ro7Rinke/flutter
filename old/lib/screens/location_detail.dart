import 'package:flutter/material.dart';
import 'text_section.dart';
import 'image_banner.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Salve'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner('assets/images/kiyomizu-dera.jpg'),
            TextSection(
                'The Title', 'Something here to complete that blank space'),
            TextSection('Another Title', 'Something here to'),
            TextSection('Las Title here', 'And here comes the last body'),
          ],
        ));
  }
}
