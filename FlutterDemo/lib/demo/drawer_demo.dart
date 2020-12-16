import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('张三丰'),
            accountEmail: Text('10086@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://static.enfry.cn/Storage-api/img.api?token=85878D5F87E75BC420E761AE9BBEEC12&fileCode=group1/M00/01/52/wKgBHlnm_pWAZmV3AAF-sBP4pEc4.1.jpg&appKey=enfrytest&ts=3284071923874102938'),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://static.enfry.cn/Storage-api/img.api?token=85878D5F87E75BC420E761AE9BBEEC12&fileCode=group2/M00/00/76/wKgBJ1_W_FqAEuUqAAHCoIt9-Zc5.1.jpg&appKey=enfrytest&ts=3284071923874102938'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
            )),
          ),
          ListTile(
              title: Text('Message'),
              leading: Icon(
                Icons.message,
                color: Colors.blue,
                size: 20.0,
              ),
              trailing: Icon(Icons.message, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              title: Text('Favorite'),
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 20.0,
              ),
              trailing: Icon(Icons.favorite, color: Colors.black),
              onTap: () => Navigator.pop(context)),
          ListTile(
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
                color: Colors.green,
                size: 20.0,
              ),
              trailing: Icon(Icons.settings, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
