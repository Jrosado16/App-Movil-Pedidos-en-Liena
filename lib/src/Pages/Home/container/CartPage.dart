import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CartPage extends StatelessWidget {
  const CartPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CartItem(
              img: 'cebolla',
              text: 'Cebolla',
              account: 50,
              precio: 2.20,
              total: 110.0,
            ),
            CartItem(
              img: 'papas',
              text: 'Papa',
              account: 120,
              precio: 2.20,
              total: 313.20,
            ),
            CartItem(
              img: 'zanahoria',
              text: 'Papa',
              account: 40,
              precio: 2.20,
              total: 200.0,
            ),
            CartItem(
              img: 'tomate',
              text: 'Papa',
              account: 21,
              precio: 2.20,
              total: 90.0,
            ),

            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: RaisedButton(
                      color: primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      textColor: Colors.white,
                      child: Text('Comprar',
                        style: TextStyle(
                          fontSize: 18.0
                        ),
                      ),
                      onPressed: (){},
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      // crossAxisAlignment: cros,
                      children: [
                        Text('Monto total',
                          style: TextStyle(
                            fontSize: 12.0
                          ),
                        ),
                        Text('\$713.50',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w900
                          ),
                        )
                      ]
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String img;
  final String text;
  final double total;
  final int account;
  final double precio;
  const CartItem({
    Key key, this.img, this.total, this.account, this.precio, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
      color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/img/$img.png',
            width: size.width * .2,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),
                ),
                SizedBox(height: 4.0,),
                Text('\$ $precio * kg'),
                SizedBox(height: 20.0,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconWidget(
                        icon: Icons.horizontal_rule,
                        press: (){},
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.grey[300],
                              spreadRadius: 1,
                              offset: Offset(1,1)
                            )
                          ]
                        ),
                        child: Text('$account')),
                      IconWidget(
                        icon: FontAwesomeIcons.plus,
                        press: (){},
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 10.0,),
              ],
            ),
          ),
          // Spacer(),
          Center(child: Text('\$ $total',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
              fontWeight: FontWeight.w900
            ),
          ))
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Function press;
  const IconWidget({
    Key key, this.icon, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: Colors.grey[300],
            spreadRadius: 1,
            offset: Offset(-1,1)
          )
        ]
      ),
      child: ClipOval(
        child: Material(
          // shadowColor: Colors.red,
          color: Colors.white,
          elevation: 50,
          child: InkWell(
            splashColor: Colors.grey[100],
            onTap: press,
            child: Center(
              child: Icon(icon,
              size: 16,
              )
            )
          )
        ),
      ),
    );
  }
}
