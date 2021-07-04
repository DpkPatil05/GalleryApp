import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/common/color_palette.dart';
import 'package:gallery_app/providers/drawer_provider.dart';
import 'package:gallery_app/services/permissions.dart';
import 'package:permission_handler/permission_handler.dart';
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
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: SizedBox(
                  height: 100,
                  child: Image.asset('assets/icon/icon.png'),
                ),
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () async {
                  if (await GetPermissions().getPermissions()) {
                    String? result =
                        await FilePicker.platform.getDirectoryPath();
                    if (result != '') {
                      prov.setFilePath(result.toString());
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                              title: Text('File Permission'),
                              content: Text(
                                  'This app needs File access to take access files'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: Text('Settings'),
                                  onPressed: () => openAppSettings(),
                                ),
                              ],
                            ));
                  }
                },
              ),
              ListTile(
                title: Text('Gallery'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: prov.filePath == ''
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icon/icon.png', scale: 20),
                    SizedBox(height: 15),
                    Container(
                      child: Text('Select path from settings',
                          style: TextStyle(
                              color: Palette.fontColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              )
            : InteractiveViewer(
                panEnabled: false,
                minScale: 1,
                maxScale: 5,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blue,
                      child: Text("index: $index"),
                    );
                  },
                ),
              ),
      );
    });
  }
}
