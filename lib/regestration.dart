import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:proj1/apis/sellerModel.dart';
import 'package:proj1/sellerRegister.dart';

import 'apis/Seller.dart';
import 'bankDetails.dart';


void main() {
  runApp(const SellerRegistrationApp());
}

class SellerRegistrationApp extends StatelessWidget {
  const SellerRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seller Registration',
      home: Regest(),
    );
  }
}

class Regest extends StatefulWidget {
  const Regest({super.key});

  @override
  _SellerRegistrationPageState createState() => _SellerRegistrationPageState();
}

class _SellerRegistrationPageState extends State<Regest> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController landlineNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController shopTimingController = TextEditingController();
  late String lat, long;
  late String msg;
  Color customColor =  const Color(0xFFDEDC07);

  Future<Position?> _getCurrentLocation() async {
    print("sdfsdfsd");
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, handle accordingly
      print("dfdfd");
      return null;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission is still denied, handle accordingly
        return null;
      }
    }
    // Get the current location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high, // Set desired accuracy
      );
      return position;
    } catch (e) {
      // Handle errors that may occur while fetching the location
      return null;
    }
  }
  Future<void> postPersonalDetails() async {
    UpdateSeller seller = UpdateSeller(
        shopName: shopNameController.text,
        ownerName: ownerNameController.text,
        phone: mobileNoController.text,
        landlineNumber: landlineNoController.text,
        addressOfShop: addressController.text,
    );
    print("seller shopname is printing wait.....");
    print(seller.shopName);
    Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetailsForm(seller:seller)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Basic Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        // bottom: TabBar(
        //   tabs: [
        //     Tab(
        //
        //     )
        //   ],
        // ),
        elevation: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Padding(
                padding: EdgeInsets.only(left:40.0),
                child: Row(
                  children: [
                      Container(
                        height: 30,
                        width: 30,
                        // color: Colors.cyanAccent,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                            border: Border.all(
                              color: Colors.cyanAccent,
                              width: 2.0, // Adjust border width as needed
                            ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Text('1',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                        ),
                    ),
                    Container(
                      height: 1.0,
                      width: 120,
                      decoration:  BoxDecoration(
                        color: customColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      // color: Colors.cyanAccent,
                      decoration: BoxDecoration(
                          color: customColor,
                          border: Border.all(
                            color: customColor,
                            width: 2.0, // Adjust border width as needed
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text('2',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      width: 120,
                      decoration:  BoxDecoration(
                          color: customColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      // color: Colors.cyanAccent,
                      decoration: BoxDecoration(
                          color: customColor,
                          border: Border.all(
                            color: customColor,
                            width: 2.0, // Adjust border width as needed
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text('3',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Shop Name',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: shopNameController,
                decoration: const InputDecoration(
                  hintText: ' Enter shop name',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Owner Name',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: ownerNameController,
                decoration: const InputDecoration(
                  hintText: ' Enter owner name',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Mobile No.',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: mobileNoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: ' Enter mobile number',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Landline No.',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: landlineNoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: ' Enter landline number (optional)',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Address',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: addressController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: ' Enter address',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () async {
                _getCurrentLocation().then((value) {
                  lat = '${value?.latitude}';
                  long = '${value?.longitude}';
                  setState(() {
                    msg = 'lat:$lat, long:$long';
                    print(msg);
                  });
                });
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
                ),
                  child: const Text('Save my current location',
                  style: TextStyle(
                    color: Colors.black
                  ),),
              ),
              const SizedBox(height: 16),
              const Text(
                'Shop Timing',
                style: TextStyle(fontSize: 18,),
              ),
              TextFormField(
                controller: shopTimingController,
                decoration: const InputDecoration(
                  hintText: ' Enter shop timing',
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                child: Center(
                  child: MaterialButton(onPressed: postPersonalDetails,
                    child: Text('Save And Continue',style: TextStyle(color: Colors.white,fontSize: 15),)
                    ,color: Colors.lightBlue.shade500,
                    height: 40,
                    minWidth: double.infinity,
                  ),
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
