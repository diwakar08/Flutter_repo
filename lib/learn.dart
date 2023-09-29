
import 'package:flutter/material.dart';
import './services/User_api.dart';
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
  late Future<Seller> sellerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the future in initState
    sellerFuture = fetchSeller();
  }

  Future<Seller> fetchSeller() async {
    final seller = await UserApi.getSeller();
    return seller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("flutter container"),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 40),
        child: MaterialButton(onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewListed(),));
        }, child: Text('Save And Continue',style: TextStyle(color: Colors.white,fontSize: 15),)
          ,color: Colors.lightBlue.shade500,
          height: 40,
        ),
      ),
    );
  }
}


