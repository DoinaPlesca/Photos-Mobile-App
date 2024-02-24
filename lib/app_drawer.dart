import 'package:flutter/material.dart';

import 'camera_screen.dart';
import 'gallery_screen.dart';
import 'home_screen.dart';

///map where the key is the name of the menu item
const menu = {
  'Home': HomeScreen.new,
  'Camera': CameraScreen.new,
  'Gallery': GalleryScreen.new,

  ///.new part gives us a reference to the constructor of the class.
  /// By invoking it we will get an instance of the class.
};

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ///Show a different page/screen
  ///Widget Function({Key? key})  takes a key as parameter and returns a widget.
  _onMenuTap(BuildContext context, Widget Function({Key? key}) constructor) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => constructor.call()),

      ///constructor is invoked
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.greenAccent, Colors.blue],
              ),
            ),
            child: Text('Photos', style: textTheme.titleLarge),
          ),
          for (final entry in menu.entries)
            ListTile(
              title: Text(entry.key),
              onTap: () => _onMenuTap(context, entry.value),
            ),
        ],
      ),
    );
  }
}
