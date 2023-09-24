
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './services/User_api.dart';
import './apis/orderModel.dart';
import './apis/ProductModel.dart';
import 'apis/Seller.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  late Seller seller;

  @override
  initState() {
    fetchSeller();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("flutter container"),
      ),
      body: Text("sellerName: ${seller.address?.city}")
    );
  }
   Future <void> fetchSeller() async {
     seller = await UserApi.getSeller();

  }
}
