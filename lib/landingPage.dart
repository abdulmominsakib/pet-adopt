import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adopt/config.dart';
import 'package:pet_adopt/detailScreen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

var imageUrl =
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

double offsetX = 0;
double offsetY = 0;
double scaleFactor = 1;

bool isDrawerOpen = false;
IconData menuIcon = Icons.menu;

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(offsetX, offsetY, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(isDrawerOpen ? 0 : 30),
      ),
      child: Column(
        children: [
          // App Bar
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Menu Button
                IconButton(
                    icon: Icon(menuIcon),
                    onPressed: () {
                      setState(() {
                        isDrawerOpen = !isDrawerOpen;
                        if (isDrawerOpen == false) {
                          offsetX = 230;
                          offsetY = 150;
                          scaleFactor = 0.6;
                          menuIcon = Icons.arrow_back_ios;
                        } else if (isDrawerOpen == true) {
                          offsetX = 0;
                          offsetY = 0;
                          scaleFactor = 1;
                          menuIcon = Icons.menu;
                        }
                      });
                    }),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Location',
                        style: TextStyle(
                          color: Colors.black87,
                        )),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: primaryGreen),
                        SizedBox(width: 5),
                        Text(
                          'Raozan, Bangladesh',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ],
            ),
          ), //AppBar End

          // Search Box
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: shadowList,
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                Text('Search to adopt pet'),
                IconButton(icon: Icon(Icons.settings), onPressed: () {})
              ],
            ),
          ), //End SearchBox

          // Catergories
          Container(
            margin: EdgeInsets.only(left: 10, top: 5),
            height: 120,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: shadowList,
                        ),
                        child: Image.asset(
                          categories[index]['iconPath'],
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        categories[index]['name'],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // <-- End Categories -->

          // Cat List
          PetListTile(
            imagePath: 'pet-cat1',
            petName: 'Sola',
            petAge: '2 Years Old',
            petDistance: '3.6 km',
            petCategories: 'Abysunia Cat',
            petGenderIcon: FontAwesomeIcons.mars,
            backgroundColor: Colors.blueGrey[300],
            heroTag: 'cat1',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            petImagePath: 'pet-cat1',
                            heroTag: 'cat1',
                          )));
            },
          ),
          PetListTile(
            imagePath: 'pet-cat2',
            petName: 'Orion',
            petAge: '1 Years Old',
            petDistance: '2.6 km',
            petCategories: 'Abysunia Cat',
            petGenderIcon: FontAwesomeIcons.venus,
            backgroundColor: Colors.orange[200],
            heroTag: 'cat2',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            petImagePath: 'pet-cat2',
                            heroTag: 'cat2',
                          )));
            },
          ),
        ],
      ),
    );
  }
}

class PetListTile extends StatelessWidget {
  const PetListTile({
    Key key,
    this.imagePath,
    this.petName,
    this.petCategories,
    this.petAge,
    this.petDistance,
    this.petGenderIcon,
    this.backgroundColor,
    this.onTap,
    this.heroTag,
  }) : super(key: key);

  final String imagePath;
  final String petName;
  final String petCategories;
  final String petAge;
  final String petDistance;
  final IconData petGenderIcon;
  final Color backgroundColor;
  final Function onTap;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 240,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: shadowList,
                        ),
                        margin: EdgeInsets.only(top: 40),
                      ),
                      Hero(
                          tag: heroTag,
                          child: Image.asset('assets/images/$imagePath.png')),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.only(top: 60, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadowList,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$petName',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: primaryGreen,
                            ),
                          ),
                          Icon(
                            petGenderIcon,
                            size: 25,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('$petCategories'),
                      SizedBox(height: 10),
                      Text(
                        '$petAge',
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: primaryGreen,
                          ),
                          Text(
                            'Distance: $petDistance',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
