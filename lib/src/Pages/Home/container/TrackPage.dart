import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TrackPage extends StatelessWidget {
  const TrackPage({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemTrack(
              icon: Icons.add_shopping_cart_outlined,
              title: 'Carro de Compra',
              subtitle: 'Seleccionaste 4 prodcutos',
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              child: Icon(FontAwesomeIcons.gripLinesVertical,
                color: secondaryColor,
              )
            ),
            ItemTrack(
              icon: Icons.attach_money_outlined,
              title: 'Compra',
              subtitle: 'Tu monto total de \$713.50',
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              child: Icon(FontAwesomeIcons.gripLinesVertical,
                color: secondaryColor,
              )
            ),
            ItemTrack(
              icon: Icons.place,
              title: 'Seguimiento',
              subtitle: 'Tu compra se esta enviando',
              color: primaryColor,
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              child: Icon(FontAwesomeIcons.gripLinesVertical,
                color: Colors.grey[400],
              )
            ),
            ItemTrack(
              icon: Icons.done_all,
              title: 'Entrega',
              subtitle: 'Tu pedido se ha entregado',
              color: Colors.grey[400],
              color2: true,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 10.0),
              child: Row(
                children: [
                  Text('Tienes alguna pregunta? ',
                    style: TextStyle(
                    ),
                  ),
                  Text('contactanos',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: primaryColor,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 280,
                    child: RaisedButton(
                      color: secondaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 11.0),
                      child: Text('Modificar orden'),
                      onPressed: (){},
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  SizedBox(
                    width: 280,
                    child: RaisedButton(
                      // color: secondaryColor,
                      // textColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 11.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Text('Cancelar orden',
                        style: TextStyle(
                          // color: Colors.grey[800]
                        ),
                      ),
                      onPressed: (){},
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

class ItemTrack extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool color2;
  const ItemTrack({
    Key key, this.title, 
    this.subtitle, this.icon, 
    this.color = const Color(0XFF3F3D56), 
    this.color2 = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: color, width: 4.0)
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(icon, color: Colors.white,),
          ),
        ),
        SizedBox(width: 20.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: color
              ),
            ),
            SizedBox(height: 3.0,),
            Text(subtitle,
            style: TextStyle(
                // fontSize: 17.0,
                color: color2 ? Colors.grey[400] : Colors.grey[600],
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        
      ],
    );
  }
}
