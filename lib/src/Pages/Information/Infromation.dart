import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Information extends StatefulWidget {

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  List<Map<String, String>> info = [
    {
      "text": "Compra",
      "img": "assets/img/shopping.svg",
      "description": "Compra los mejores productos para abastecer tu negocio, compra en cantidades",
    },
    {
      "text": "Paga",
      "img": "assets/img/pay.svg",
      "description": "Ahorra tiempo y paga seguro. Elige la mejor opcion de pago para tu negocio.",
    },
    {
      "text": "Recibe",
      "img": "assets/img/box.svg",
      "description": "Finaliza la compra, podras hacer seguimiento a tu producto y saber el tiempo de espera.",
    },
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (p){
                  setState((){
                    currentPage = p;
                  });
                },
                itemCount: info.length,
                itemBuilder: (context, index){
                  return Description(
                    size: size,
                    img: info[index]['img'],
                    text: info[index]['text'],
                    description: info[index]['description'],
                  );
                },
              ),
            ),
            // Spacer(),
            currentPage == 2 ? SizedBox(
              height: 33,
              width: 110,
              child: RaisedButton(
                child: Text('Iniciar'),
                textColor: Colors.white,
                shape: StadiumBorder(),
                color: primaryColor,
                onPressed: (){
                  Navigator.pushNamed(context, '/');
                },
              ),
            ) : 
            SizedBox(
              height: 33,
              child: Text('')
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        info.length,
                        (index) => buildDot(index: index)
                      )
                  ),
                  Spacer(),
                ],
              ),
            )
            
          ],
        )),
    );
  }

  Widget buildDot({int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 10.0),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Color(0XFFD8D8D8),
        borderRadius: BorderRadius.circular(50)
      ), 
      duration: Duration(milliseconds: 600),
      
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.size, 
    this.img, 
    this.text, 
    this.description,
  }) : super(key: key);

  final Size size;
  final String img;
  final String text;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(img,
            width: size.width * 0.7,
            // height: 230,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 12.0),
            padding: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                color: primaryColor,
                width: 3,
              ))
            ),
            child: Text(text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),
            )
          ),
          // Spacer(),
          Container(
            width: size.width * 0.7,
            child: Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.0,
                  // letterSpacing: 1,
                  color: Colors.black54
                ),
              )
            )
        ],
      ),
    );
  }
}