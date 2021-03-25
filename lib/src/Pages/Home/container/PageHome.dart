import 'package:flutter/material.dart';

import '../../../constant.dart';

class PageHome extends StatelessWidget {
  const PageHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  color: secondaryColor,
                  textColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // side: BorderSide(color: gray2Color)
                  ),
                  child: Text('Verduras'),
                  onPressed: (){},
                ),
                RaisedButton(
                  child: Text('Frutas'),
                  color: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: gray2Color)
                  ),
                  onPressed: (){},
                ),
                RaisedButton(
                  child: Text('Ofertas Diarias'),
                  color: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: gray2Color)
                  ),
                  onPressed: (){},
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                CardItem(
                  img: 'papas',
                  price: 2.61,
                  start: 4.9,
                  text: 'Papa',
                ),
                CardItem(
                  img: 'zanahoria',
                  price: 5.00,
                  start: 4.9,
                  text: 'Zanahoria',
                ),
                CardItem(
                  img: 'cebolla',
                  price: 2.20,
                  start: 4.9,
                  text: 'Cebolla',
                ),
                CardItem(
                  img: 'tomate',
                  price: 4.30,
                  start: 4.9,
                  text: 'Tomate',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String img;
  final double price;
  final String text;
  final double start;
  const CardItem({
    Key key, this.img, this.price, this.text, this.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    return Container(
      width: size.width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 80,
            child: Image.asset('assets/img/$img.png',
              width: 80,
            ),
          ),
          SizedBox(height: 8.0,),
          Text(text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star,
                  size: 15,
                  color: Colors.yellow,
                ),
                Text(start.toString())
              ],
            ),
          ),
          Text('\$ $price',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            ),
          ),
          SizedBox(height: 5.0,),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text('Comprar'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: primaryColor,
              textColor: Colors.white,
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}

