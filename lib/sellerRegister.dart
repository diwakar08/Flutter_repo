
import 'package:flutter/material.dart';

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
      home: const sellerRegister(title: 'Flutter Demo Home Page'),
    );
  }
}

class sellerRegister extends StatefulWidget {
  const sellerRegister({super.key, required this.title});
  final String title;

  @override
  State<sellerRegister> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<sellerRegister> {
  var nameOfShopController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: const Text("registration page"),
        ),
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only (top:30.0,left:20),
              child: Text('BASIC DETAIL',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right:20,top:15),
              child: TextFormField(
                controller: nameOfShopController,
                validator: (value) {
                  if(value!.length<5) {
                    return "username length must be 5";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  // fillColor: Colors.blueGrey,
                  filled: true,
                  labelText: 'Shop Name',
                  hintText: 'Enter Name of The Shop',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right:20,top:20),
              child: TextFormField(
                controller: nameOfShopController,
                validator: (value) {
                  if(value!.length<5) {
                    return "username length must be 5";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  // fillColor: Colors.blueGrey,
                  filled: true,
                  labelText: 'Owner Name',
                  hintText: 'Enter Owner Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right:20,top:20),
              child: TextFormField(
                controller: nameOfShopController,
                validator: (value) {
                  if(value!.length<5) {
                    return "username length must be 5";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  // fillColor: Colors.blueGrey,
                  filled: true,
                  labelText: 'Mobile No.',
                  hintText: 'Enter Mobile No.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right:20,top:20),
              child: TextFormField(
                controller: nameOfShopController,
                validator: (value) {
                  if(value!.length<5) {
                    return "username length must be 5";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  suffixText: 'if exists',
                  // fillColor: Colors.blueGrey,
                  filled: true,
                  labelText: 'Landline No.',
                  hintText: 'Enter MobileLandline No.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(), // Add border for the input field
                // borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: nameOfShopController,
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Username length must be 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        filled:true,
                        labelText: 'Landline number',
                        hintText: 'Enter landline No.',
                        border: InputBorder.none, // Remove the default border
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('If Exixt'),
                  ),
                ],
              ),
            )

          ],
        )
    );
  }
}
