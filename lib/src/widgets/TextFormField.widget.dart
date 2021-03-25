import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // flex: 1,
          children: [ Column(
            children: [
              Column(
                children: [
                ],
              ),
              Spacer(),
               Row(
                children: [
                  Text('Aun no tienes una cuenta? '),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: primaryColor))
                    ),
                    child: Text('Crear una',
                      style: TextStyle(
                        color: primaryColor
                      ),
                    )),
                ],
              ),
            ],
          ),
          ]
        ),
      ),
    );
  }
}