import 'package:flutter/material.dart';
import 'package:proj1/uploadImages.dart';

import 'apis/sellerModel.dart';

void main() {
  runApp(BankDetailsApp());
}

class BankDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Details Form',
      debugShowCheckedModeBanner: false,
      home: BankDetailsForm(seller: UpdateSeller(),),
    );
  }
}

class BankDetailsForm extends StatefulWidget {
  late UpdateSeller seller;

  BankDetailsForm({required this.seller});
  @override
  _BankDetailsFormState createState() => _BankDetailsFormState();
}

class _BankDetailsFormState extends State<BankDetailsForm> {
  final TextEditingController bankAccountController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController fssaiController = TextEditingController();
  late UpdateSeller seller = widget.seller;
  Future<void> postPersonalDetails() async {
    seller.accountNo = bankAccountController.text;
    seller.ifscCode = ifscController.text;
    seller.panNo = panController.text;
    seller.gstNumber = gstController.text;
    seller.fssaiLicenseNumber = fssaiController.text;
    print("printing cc no");
    print(seller.accountNo);
    print(seller.shopName);
    Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImages(seller:seller)));
  }


  Color customColor =  const Color(0xFFDEDC07);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Personal Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                      decoration: const BoxDecoration(
                          color: Colors.cyanAccent,
                      ),
                    ),
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
              SizedBox(height: 30,),
              const Text('Bank Account Details', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: bankAccountController,
                decoration: const InputDecoration(
                  labelText: 'Bank Account Number',
                  hintText: 'Enter bank account number',
                ),
              ),
              TextFormField(
                controller: ifscController,
                decoration: const InputDecoration(
                  labelText: 'IFSC Code',
                  hintText: 'Enter IFSC code',
                ),
              ),
              const SizedBox(height: 30),
              Text('PAN Card Number', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: panController,
                decoration: const InputDecoration(
                  labelText: 'PAN Card Number',
                  hintText: 'Enter PAN card number',
                ),
              ),
              SizedBox(height: 30),
              const Text('GST Number/FSSAI License', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: gstController,
                decoration: const InputDecoration(
                  labelText: 'GST Number (Optional)',
                  hintText: 'Enter GST number (if applicable)',
                ),
              ),
              TextFormField(
                controller: fssaiController,
                decoration: const InputDecoration(
                  labelText: 'FSSAI License (Optional)',
                  hintText: 'Enter FSSAI license number (if applicable)',
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      postPersonalDetails();
                      // Process the form data and perform submission
                      // You can access the entered data using the controllers
                    },
                    child: const Text('Submit'),
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

