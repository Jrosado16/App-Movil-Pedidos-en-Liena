import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagePerfil extends StatelessWidget {
  const PagePerfil({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.0, left: 10, bottom: 5.0),
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(Icons.person),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Maria Rodriguez',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16.0
                        ),
                      ),
                      Text('mariarodri@gmail.com',
                       style: TextStyle(
                         color: Colors.grey[600]
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SectionPerfil(
              text: 'Editar Perfil',
              icon: FontAwesomeIcons.userCircle,
            ),
            SectionPerfil(
              text: 'Medio de pago',
              icon: FontAwesomeIcons.creditCard,
            ),
            SectionPerfil(
              text: 'Historial de compras',
              icon: Icons.format_list_bulleted_rounded,
            ),
            SectionPerfil(
              text: 'Medio de pago',
              icon: Icons.settings_outlined,
            ),
            SectionPerfil(
              text: 'Medio de pago',
              icon: FontAwesomeIcons.phone,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionPerfil extends StatelessWidget {
  final String text;
  final IconData icon;
  const SectionPerfil({
    Key key, this.text, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(13.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey[300],
            spreadRadius: 1,
            offset: Offset(1,1)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 13.0, left: 5.0),
                child: Icon(icon, 
                color: Colors.grey[600],
                size: 20,
              ),
              ),
              Text(text,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800
                ),
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios_outlined,
            color: Colors.grey[600],
            size: 18,
          )
        ],
      ),

    );
  }
}
