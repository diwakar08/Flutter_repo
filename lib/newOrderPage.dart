import 'package:flutter/material.dart';

void main() {
  runApp( BankDetailsApp());
}

class BankDetailsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Details Form',
      debugShowCheckedModeBanner: false,
      home: sellerFrontPage(),
    );
  }
}

class sellerFrontPage extends StatefulWidget {
  @override
  _BankDetailsFormState createState() => _BankDetailsFormState();
}

class _BankDetailsFormState extends State<sellerFrontPage> {

  Color color1 = const Color(0xFF08FFC8);
  Color color2 = const Color(0xFFFFF7F7);
  Color color3 = const Color(0xFFDADADA);
  Color color4 = const Color(0xFF204969);
  bool isNewOrders = true;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }

}