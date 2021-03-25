import 'package:app_movil/src/Pages/Home/components/Search.dart';
import 'package:app_movil/src/constant.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PagePrice extends StatefulWidget {
  const PagePrice({
    Key key,
  }) : super(key: key);
  @override
  _PagePriceState createState() => _PagePriceState();
}
class LineaSales {
  final int year;
  final int sales;

  LineaSales(this.year, this.sales);
}
class _PagePriceState extends State<PagePrice> {
  List<charts.Series> lineChart;
  static List<charts.Series<LineaSales, int>> _createSampleData() {
    final data = [
      new LineaSales(0, 2),
      new LineaSales(1, 50),
      new LineaSales(2, 35),
      new LineaSales(3, 75),
      new LineaSales(4, 90),
    ];
    return [
      new charts.Series<LineaSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LineaSales sales, _) => sales.year,
        measureFn: (LineaSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
  bool animate;
  _lineChart(){
    return charts.LineChart(
      lineChart,
      animate: true,
    );
  }
  @override
  void initState() { 
    super.initState();
    lineChart = _createSampleData();
  }

  TextStyle style = TextStyle(
    color: Colors.grey[600],
    fontWeight: FontWeight.w900
  );
  TextStyle styleLine = TextStyle(
    color: Colors.grey[600],
    fontWeight: FontWeight.w600
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 340,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.grey[200],
                        spreadRadius: 3,
                        offset: Offset(1,1)
                      )
                    ]
                  ),
                  child: SearchWidget(
                    text: 'Seleccionar un producto',
                  )
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              child: Text('Mercado de papa',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ContainerPrice(
                    id: true,
                    day: 'Hoy',
                    price: 2.20,
                    color: secondaryColor,
                  ),
                  ContainerPrice(
                    id: false,
                    day: 'Mas Alto',
                    price: 2.64,
                    color: Colors.grey[300],
                  ),
                  ContainerPrice(
                    id: false,
                    day: 'Mas Bajo',
                    price: 2.12,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
            Container(
              // height: 500.0,
              width: double.infinity,
              padding: EdgeInsets.all(13.0),
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey[200],
                    spreadRadius: 5,
                    offset: Offset(5,1)
                  )
                ]
              ),
              child: Column(
                children: [
                  Container(
                    height: 200.0,
                    child: _lineChart(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 27.0,
                          child: RaisedButton(
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            color: secondaryColor,
                            textColor: Colors.white,
                            child: Text('Semanal'),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(
                          height: 27.0,
                          child: RaisedButton(
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('Mensual',
                              style: TextStyle(
                                color: Colors.grey[700]
                              ),
                            ),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(
                          height: 27.0,
                          child: RaisedButton(
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('Anual',
                            style: TextStyle(
                                color: Colors.grey[700]
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Lista de Variedades',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  Table(
                    columnWidths: {
                      0: FractionColumnWidth(0.5),
                      // 1: FractionColumnWidth(0.1)
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('Variedades', textAlign: TextAlign.center,
                                style: style,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('x kg',
                              style: style,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('x saco',
                              style: style,
                              ),
                            ),
                          ),
                        ]
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Papa russet',
                                style: styleLine,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('\$ 2.31',
                              style: styleLine,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('\$ 105.00',
                              style: styleLine,
                              ),
                            ),
                          ),
                        ]
                      ),
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 1.5,
                              color: Colors.grey[300]
                            )
                          )
                        ),
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Papa blanca',
                              style: styleLine,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('\$ 1.67',
                              style: styleLine,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('\$ 72.00',
                              style: styleLine,
                              ),
                            ),
                          ),
                        ]
                      ),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerPrice extends StatelessWidget {
  final String day;
  final double price;
  final Color color;
  final bool id;
  const ContainerPrice({
    Key key, this.day, this.price, this.color, this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 110,
      margin: EdgeInsets.symmetric( horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day,
            style: TextStyle(
              color: id ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w600
            ),
          ),
          Spacer(),
          Text('US\$',
          style: TextStyle(
              color: id ? Colors.white : Colors.black,
              fontWeight: FontWeight.w800
            ),
          ),
          Text('  ${price.toDouble().toStringAsFixed(2)}',
          style: TextStyle(
              color: id ? Colors.white : Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}


/// Sample linear data type.

