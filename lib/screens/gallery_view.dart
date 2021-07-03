import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/common/color_palette.dart';
import 'package:gallery_app/providers/drawer_provider.dart';
import 'package:provider/provider.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(builder: (context, prov, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Gallery App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Palette.primary,
          shadowColor: Palette.tertiary,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                title: Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Gallery'),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
    });
  }
}
