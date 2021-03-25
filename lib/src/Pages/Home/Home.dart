import 'package:app_movil/src/Pages/Home/components/Search.dart';
import 'package:app_movil/src/Pages/Home/container/CartPage.dart';
import 'package:app_movil/src/Pages/Home/container/PageHome.dart';
import 'package:app_movil/src/Pages/Home/container/PagePerfil.dart';
import 'package:app_movil/src/Pages/Home/container/PricePage.dart';
import 'package:app_movil/src/Pages/Home/container/TrackPage.dart';
import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List titles = [
  'Pick-up', 
  'Precios',
  'Carrito de Compras',
  'Seguimiento',
  'Perfil'
];

class _HomeState extends State<Home> {
  PageController _pageController;
  int currentPage = 0;
  @override
  void initState() { 
    super.initState();
        _pageController = PageController(initialPage: 0,);
  }
  int currentStep = 0;
  bool complete = false;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0, color: primaryColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
        ),
        leading: Icon(Icons.ac_unit, color: primaryColor,),
        centerTitle: currentPage == 0 ? false : true ,
        title: Row(
          mainAxisAlignment: currentPage != 0 ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            currentPage == 0 ? Icon(FontAwesomeIcons.cartArrowDown,
              color: secondaryColor,
              size: 25,
            ) : Text(''),
            SizedBox(width: 10,),
            Text(titles[currentPage],
              style: TextStyle(
                color: secondaryColor,
                fontSize: currentPage == 0 ? 25 : 18,
                fontWeight: FontWeight.w900
              ),
            ),
            SizedBox(width: 70,),
          ],
        ),
        actions: currentPage == 0 ? [
          Icon(Icons.notifications, color: secondaryColor,),
          SizedBox(width: 10,)
        ] : [],
        bottom: PreferredSize(
          child: Container(
            // height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide( width: 0, color: currentPage == 0 ? primaryColor : Colors.transparent)
              )
            ),
            child: Container(
              width: double.infinity,
              padding: currentPage == 0 ?
               EdgeInsets.only(top: 0, right: 25, left: 25, bottom: 18)
               : null,
              height: currentPage == 0 ? 50 : null,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
              child: currentPage == 0 ? 
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
              child: SearchWidget()) : null
            ),
          ),
           preferredSize: currentPage == 0 ?
            Size.fromHeight(kToolbarHeight)
            : Size.fromHeight(0)
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          PageHome(),
          PagePrice(),
          CartPage(),
          TrackPage(),
          PagePerfil()
        ],
        onPageChanged: (v){
          setState(() {
            currentPage = v;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        backgroundColor: Colors.white,
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        selectedItemColor: primaryColor,
        onTap: _navigationTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(FontAwesomeIcons.home,
            ) 
          ),
          BottomNavigationBarItem(
            label: 'Precio',
            icon: Icon(FontAwesomeIcons.tags) 
          ),
          BottomNavigationBarItem(
            label: 'Carrito',
            icon: Icon(FontAwesomeIcons.cartArrowDown) 
          ),
          BottomNavigationBarItem(
            label: 'Track',
            icon: Icon(FontAwesomeIcons.mapMarkerAlt) 
          ),
          BottomNavigationBarItem(
            label: 'Usuario',
            icon: Icon(FontAwesomeIcons.userCircle) 
          ),
        ],
      ),
    );
  }
  void _navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.easeInCirc);
  }
}
