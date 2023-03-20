import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Считывание числа',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    // List<double?> number;
  double? number;
  double? glass;
  double? tableSpoone;
  double? teaSpoone;

  //   _MyHomePageState( this.number);
  void _readNumberFromConsole() async {
    final TextEditingController controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Введите число'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                double num = double.parse(controller.text);
                setState(() {
                  number =num;
                  glass = num/200.0;
                  tableSpoone=num/20.0;
                  teaSpoone=num/6.0;
                });
                Navigator.of(context).pop();
              },
              child: const Text('ОК'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кухонный калькулятор '),
        centerTitle: true,
        backgroundColor: const Color(-16764589),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (glass == null ||tableSpoone == null || teaSpoone == null)
              InkWell(
                onTap: _readNumberFromConsole,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: const Text(
                    'Считать число',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            if (glass != null && tableSpoone != null && teaSpoone != null)
              Table(
                border: TableBorder.all(width: 2.0, color: Colors.black),
                columnWidths: const {
                  0: FlexColumnWidth(1.0),
                  1: FlexColumnWidth(1.0),
                  2: FlexColumnWidth(1.0),
                },
                  children: [const TableRow(children: [
                    TableCell(
                    child: Text('Стакан',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Gotham Pro Medium'
                        ),
                        textAlign: TextAlign.center),
                    ),
                    TableCell(
                    child: Text('Столовая ложка',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Gotham Pro Medium'
                        ),
                        textAlign: TextAlign.center),
                    ),
                    TableCell(
                    child: Text('Чайная ложка',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Gotham Pro Medium'
                        ),
                        textAlign: TextAlign.center),
                    ),
                  ]),
                   TableRow(children: [
                    TableCell(
                     child: Text('$glass',
                         style: const TextStyle(
                             fontSize: 20.0,
                             fontFamily: 'Gotham Pro Medium'
                         ),
                         textAlign: TextAlign.center),
                      ),
                    TableCell(
                     child: Text('$tableSpoone',
                         style: const TextStyle(
                             fontSize: 20.0,
                             fontFamily: 'Gotham Pro Medium'
                         ),
                         textAlign: TextAlign.center),
                    ),
                    TableCell(
                     child: Text('$teaSpoone',
                         style: const TextStyle(
                             fontSize: 20.0,
                             fontFamily: 'Gotham Pro Medium'
                         ),
                         textAlign: TextAlign.center),
                     ),
                  ]),
                ]
              ),
              // Text(
              //   'Вы ввели число:$number, $glass, $tableSpoone, $teaSpoone',
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
              // Text(
              // 'В'
              // Сделать таблицу вывода данных с 3-мя колонками и двямя строками
              // Добавить методы для высчитавания разных матариалов

          ],
        ),
      ),
    );
  }
}