import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pet_adopt/config.dart';
import 'package:pet_adopt/drawerScreen.dart';
import 'package:pet_adopt/landingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'CircularAir',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDrawerOpen ? primaryGreen : Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            DrawerScreen(),
            // LandingPage(),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Swiper(
                layout: SwiperLayout.STACK,
                itemWidth: MediaQuery.of(context).size.width,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return LandingPage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
