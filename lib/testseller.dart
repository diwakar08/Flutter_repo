import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class Order {
  final String orderId;
  final String time;
  final String name;
  final int numberOfOrders;
  final double totalBill;
  final String paymentType;

  Order({
    required this.orderId,
    required this.time,
    required this.name,
    required this.numberOfOrders,
    required this.totalBill,
    required this.paymentType,
  });
}
class MyApp extends StatelessWidget {
  final List<Order> orders = [
    Order(
      orderId: '001',
      time: '10:30 AM',
      name: 'John Doe',
      numberOfOrders: 3,
      totalBill: 45.99,
      paymentType: 'Cash on Delivery',
    ),
    Order(
      orderId: '002',
      time: '11:45 AM',
      name: 'Alice Smith',
      numberOfOrders: 2,
      totalBill: 30.50,
      paymentType: 'Paid',
    ),
    // Add more orders as needed.
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Order List'),
        ),
        body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return ListTile(
              title: Text('Order ID: ${order.orderId}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time: ${order.time}'),
                  Text('Name: ${order.name}'),
                  Text('Number of Orders: ${order.numberOfOrders}'),
                  Text('Total Bill: \$${order.totalBill.toStringAsFixed(2)}'),
                  Text('Payment Type: ${order.paymentType}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}








































// Widget buildPage2(String s) {
//   final List<Map<String, String>> orders = [
//     {
//       'name': 'Abhishek',
//       'amount': '₹50',
//       'id': '123',
//       'order': 'Item 1',
//       'time': '10:00 AM',
//     },
//     {
//       'name': 'Sahil',
//       'amount': '\$30',
//       'id': '124',
//       'order': 'Item 2',
//       'time': '11:30 AM',
//     },
//     {
//       'name': 'Rohan',
//       'amount': '\$70',
//       'id': '125',
//       'order': 'Item 3',
//       'time': '1:45 PM',
//     },
//     {
//       'name': 'Rishi',
//       'amount': '\$40',
//       'id': '126',
//       'order': 'Item 4',
//       'time': '3:15 PM',
//     },
//   ];
//   final List<String> product = ["sugar", "rice", "soap", "flour"];
//   final List<String> amount = ["1 kg", "2 kg", "2 Dozen", "5 kg"];
//   final List<String> price = ["₹50", "₹70", "₹200", "₹150"];
//   final List<Map<String, String>> data = [
//     {"amount": "5 kg", "product": "sugar", "price": "Rs 10.00"},
//     {"amount": "3 kg", "product": "rice", "price": "Rs 15.00"},
//     {"amount": "2 unit", "product": "soap", "price": "Rs 8.50"},
//     // Add more data items as needed
//   ];
//   return Scaffold(
//       backgroundColor: const Color(0xFFFFF7F7),
//       body: Column(
//         children: [
//           const SizedBox(height: 10,),
//           Expanded(
//             child: ListView.builder(
//               itemCount: orders.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final order = orders[index];
//                 return Padding(
//                   padding: const EdgeInsets.only(
//                       left: 8.0, right: 8.0, top: 10.0),
//
//                   child: Card(
//                     elevation: 5, // Add elevation to make it appear as a card
//                     child: ListTile(
//                       title: Column(
//                         children: [
//                           Container(
//                             height: 25,
//                             width: double.infinity,
//                             color: const Color(0xFFDADADA),
//                             child: const Center(
//                               child: Text('New Order',),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Text('Order ID: ${order['id']}'),
//                               const Spacer(),
//                               Text(order['time']!),
//                               PopupMenuButton<String>(
//                                 // onSelected: _selectOption,
//                                 itemBuilder: (BuildContext context) {
//                                   return {'a', 'See order Details'}.map((String choice) {
//                                     return PopupMenuItem<String>(
//                                       value: choice,
//                                       child: Text(choice),
//                                     );
//                                   }).toList();
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       subtitle: Column(
//                         // crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//
//                               Text('${order['name']}\'s Order',
//                                 style: const TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w500,
//                                 ),),
//                               const Spacer(),
//                               const Text('Takeaway',
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w500,
//                                 ),)
//                             ],
//                           ),
//                           const SizedBox(height: 10,),
//                           ListView.builder(
//                             itemCount: data.length,
//                             itemBuilder: (context, index) {
//                               // Extract data for the current row
//                               final List<String> rowData = data[index] as List<String>;
//                               final String amount = rowData[0];
//                               final String product = rowData[1];
//                               final String price = rowData[2];
//
//                               child: Row(
//                                 children: [
//                                   Text('$amount $product',
//                                     style: const TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   Text(
//                                     price,
//                                     style: const TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   )
//                                 ],
//                               );
//                             },
//                           ),
//                           const SizedBox(height: 10),
//                           //
//                           // const SizedBox(height: 10,),
//                           Row(
//                             children: [
//                               Container(
//                                 height: 38,
//                                 color: Color(0xFF204969),
//                                 width: 150,
//                                 child: ElevatedButton(onPressed: () {},
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Color(0xFF204969),
//                                       elevation: 3, // Remove button elevation if not needed
//                                     ),
//                                     child: const Center(
//                                         child: Text('Prepare Order'))
//                                 ),
//                               ),
//                               const Spacer(),
//                               Text('Total Bill: ${price[index]} ',
//                                 style: const TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w500,
//                               ),),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       )
//
//
//   );
// }