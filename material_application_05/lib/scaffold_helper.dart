import 'package:flutter/material.dart';

class Helper {
  static Drawer getLeftDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: getCircleAvatar()),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.portrait),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Images'),
            leading: Icon(Icons.image),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Log out')),
              ElevatedButton(onPressed: () {}, child: const Text('Register'))
            ],
          ),
        ],
      ),
    );
  }

  static Drawer getEndDrawer() {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [getCircleAvatar(), Text('123')],
      ),
    );
  }

  static CircleAvatar getCircleAvatar() {
    return const CircleAvatar(
      radius: 100,
      foregroundColor: Colors.white,
      backgroundImage: NetworkImage(
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png')
    );
  }  
}
