
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './services/User_api.dart';
import './apis/orderModel.dart';
import './apis/ProductModel.dart';



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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("flutter container"),
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Product>? data = snapshot.data;

            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                final prod = data?[index];
                return ListTile(
                  title: Text(prod!.productName),
                );
              },
            );
          }
        },
      )
    );
  }
  Future<List<Product>> fetchOrders() async {
    final data = await UserApi.getProducts();

    return data;
  }
}
