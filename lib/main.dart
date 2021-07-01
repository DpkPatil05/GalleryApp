import 'package:flutter/material.dart';
import 'package:gallery_app/providers/drawer_provider.dart';
import 'package:gallery_app/screens/gallery_view.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(GalleryApp());
}

class GalleryApp extends StatefulWidget {
  @override
  _GalleryAppState createState() => _GalleryAppState();
}

class _GalleryAppState extends State<GalleryApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DrawerProvider()),
      ],
      child: MaterialApp(home: GalleryView()),
    );
  }
}