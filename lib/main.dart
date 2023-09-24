
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
      body: FutureBuilder<Seller>(
        future: sellerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the future is still running, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error, display an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Once the future is complete, display the seller's data
            final seller = snapshot.data;

            if (seller == null) {
              // Handle the case where seller is null (if needed)
              return Center(child: Text('Seller data is null.'));
            }

            // Display seller's data here
            return Text("sellerName: ${seller.address!.city!}");
          }
        },
      ),
    );
  }
}


