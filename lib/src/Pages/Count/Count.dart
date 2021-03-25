import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Count extends StatefulWidget {
  const Count({Key key}) : super(key: key);

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int curretPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            // color: Colors.amber,
            // padding: EdgeInsets.only(top: 15),
            height: size.height * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  child: Text('Bienvenido!',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                 Container(
                      // color: Colors.red,
                  width: size.width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    curretPage = 0;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  decoration: curretPage == 0 ? line() : transparent(),
                                  child: Text('Iniciar sesión', textAlign: TextAlign.center,
                                      style: curretPage == 0 ? TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0
                                    ) 
                                    : TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 17.0
                                    ),
                                  )
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    curretPage = 1;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  decoration: curretPage == 1 ? line() : transparent(),
                                  child: Text('Crear Cuenta', textAlign: TextAlign.center,
                                    style:  curretPage == 1 ? TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0
                                    ) 
                                    : TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 17.0
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: Row(
                            children: [
                              Text('Iniciar sesión como'),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Color(0XFF3B5998),
                                  borderRadius: BorderRadius.circular(9),
                                  boxShadow: [
                                    shadowButton()
                                  ]
                                ),
                                child: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9),
                                  boxShadow: [
                                    shadowButton()
                                  ]
                                ),
                                child: Icon(
                                  FontAwesomeIcons.google,
                                  color: Color(0XFFFBBC05),
                                  size: 16,
                                ),
                              ),
                              // Icon(Icons.facebo)
                            ],
                          ),
                        ),
                        curretPage == 0 ? initSesion() : 
                        createAccount()
                        
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Spacer(),
                        SizedBox(
                            width: double.infinity,
                            height: 40.0,
                            child: MaterialButton(
                              minWidth: size.width,
                              child: Text(curretPage == 0 ? 'Iniciar sesión' : 'Crear Cuenta',
                                style: TextStyle(
                                  fontSize: 17
                                ),
                              ),
                              color: primaryColor,
                              textColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                              onPressed: curretPage == 0 ?(){
                                Navigator.pushNamed(context, '/information');
                              } 
                              : (){
                                Navigator.pushNamed(context, '/information');
                              }
                            ),
                          ),
                        Spacer(),
                        Spacer(),
                        Row(
                          children: [
                            curretPage == 0 ? Text('¿Aún no tienes una cuenta?  ')
                            : Text('¿Ya tienes una cuenta?  '),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: primaryColor))
                              ),
                              child: curretPage == 0 ? GestureDetector(
                                onTap: (){
                                  setState(() {
                                    curretPage = 1;             
                                  });
                                },
                                child: Text('Crear una ',
                                  style: TextStyle(
                                    color: primaryColor
                                  ),
                                ),
                              )
                              : GestureDetector(
                                onTap: (){
                                  setState(() {
                                    curretPage = 0;             
                                  });
                                },
                                child: Text('Iniciar sesion',
                                  style: TextStyle(
                                    color: primaryColor
                                  ),
                                ),
                              )
                            )

                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        
        ),
      ),
    );
  }

  BoxDecoration line() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: primaryColor,
            width: 3
          )
        )
    );
  }

  BoxDecoration transparent() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: Colors.transparent,
            width: 2.5
          )
        )
    );
  }

  Column initSesion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text('Usuario',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: ' Ingrese nombre de usuario',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.person, size: 20, color: Colors.grey[400],),
            prefixIconConstraints: BoxConstraints(
              minWidth: 10,
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          ),
        ),
        SizedBox(height: 25,),
        Text('Contraseña',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: ' Ingrese contraseña',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.lock, size: 18, color: Colors.grey[400],),
            prefixIconConstraints: BoxConstraints(
              minWidth: 10,
            ),
            suffixIcon: Icon(Icons.visibility_off, size: 18, color: Colors.black.withOpacity(0.7),),
            suffixIconConstraints: BoxConstraints(
              minWidth: 25
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          ),
        ),
      ],
    );
  }

  Column createAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nombre',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: ' Escribir un nombre',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.person, size: 20, color: Colors.grey[400],),
            prefixIconConstraints: BoxConstraints(
              minWidth: 10,
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          ),
        ),
        SizedBox(height: 15,),
        Text('Correo',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: ' Escribir un e-mail',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.email, size: 18, color: Colors.grey[400],),
            prefixIconConstraints: BoxConstraints(
              minWidth: 10,
            ),
            // suffixIcon: Icon(Icons.visibility_off, size: 18, color: Colors.black.withOpacity(0.7),),
            // suffixIconConstraints: BoxConstraints(
            //   minWidth: 25
            // ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          ),
        ),
        SizedBox(height: 15,),
        Text('Contraseña',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: ' Escribir una contraseña',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.lock, size: 18, color: Colors.grey[400],),
            prefixIconConstraints: BoxConstraints(
              minWidth: 10,
            ),
            suffixIcon: Icon(Icons.visibility_off, size: 18, color: Colors.black.withOpacity(0.7),),
            suffixIconConstraints: BoxConstraints(
              minWidth: 25
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          ),
        ),
      ],
    );
  }

  BoxShadow shadowButton() {
    return BoxShadow(
      color: Colors.grey[300],
      blurRadius: 3,
      spreadRadius: 1,
      offset: Offset(1,2)
    );
  }
}