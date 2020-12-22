import 'package:flutter/material.dart';
import 'package:pet_adopt/config.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://brandyourself.com/blog/wp-content/uploads/linkedin-profile-picture-too-close.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Maya Barksaboka',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Text(
                        'Active Status',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // User END

            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                  itemCount: drawerItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        drawerItems[index]['icon'],
                        color: Colors.white,
                      ),
                      title: Text(
                        drawerItems[index]['title'],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }),
            ),
            // Menu Item End

            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 20,
                    color: Colors.white60,
                    width: 1,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
