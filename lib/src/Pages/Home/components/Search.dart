import 'package:flutter/material.dart';


class SearchWidget extends StatelessWidget {
final String text;
  const SearchWidget({
    Key key, this.text = 'Buscar',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey[400]),
          suffixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), 
            borderSide: BorderSide.none
          )
        ),
    );
  }
}
