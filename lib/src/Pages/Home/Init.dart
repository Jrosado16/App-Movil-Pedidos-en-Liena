import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Init extends StatelessWidget {
  const Init({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width *0.8,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      SvgPicture.asset('assets/img/options.svg', 
                        width: size.width * 0.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.cartArrowDown,
                            size: 28,
                          ),
                          SizedBox(width: 10,),
                          Text('Pick-up', textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w900
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Todo lo que necesitas para abastecer tu negocio, en un solo lugar', 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black
                          ),
                        ),
                      ),
                      Spacer(),
                      MaterialButton(
                        minWidth: size.width,
                        child: Text('Comenzar',
                          style: TextStyle(
                            fontSize: 17
                          ),
                        ),
                        color: primaryColor,
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                        onPressed: (){
                          Navigator.pushNamed(context, '/count');
                        },
                      ),
                      Spacer(),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}