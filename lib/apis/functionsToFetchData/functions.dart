
Future<dynamic> fetchOrderData() async {
  Map<String, dynamic> json = {
  "orderID": 101,
  "customerID": 1001,
  "sellerID": 1234,
  "productList": [
    {
      "productID": "111",
      "productName": "Product 1",
      "category": "Electronics",
      "image": ["image1.jpg", "image2.jpg"],
      "description": "Description of Product 1",
      "quantityType": "Unit",
      "mrpPrice": 49.99,
      "offerPrice": 39.99,
      "productType": "Physical",
      "returnReplacement": {
        "returnStatus": true,
        "replacementStatus": false,
        "returnPeriod": 30,
        "replacementPeriod": 0,
      },
      "sellerID": "seller123",
      "created_at": "2023-09-18T08:00:00Z",
      "updated_at": "2023-09-18T10:00:00Z",
    },
    {
      "productID": "112",
      "productName": "Product 2",
      "category": "Clothing",
      "image": ["image3.jpg", "image4.jpg"],
      "description": "Description of Product 2",
      "quantityType": "Piece",
      "mrpPrice": 29.99,
      "offerPrice": 24.99,
      "productType": "Physical",
      "returnReplacement": {
        "returnStatus": true,
        "replacementStatus": true,
        "returnPeriod": 30,
        "replacementPeriod": 30,
      },
      "sellerID": "seller456",
      "created_at": "2023-09-19T09:00:00Z",
      "updated_at": "2023-09-19T11:00:00Z",
    },
  ],
  "orderStatus": "new",
  "totalPrice": "1125.28",
  "payment": {
  "paymentID": "998",
  "paymentStatus": "paid",
  "paymentMode": "online",
  "paymentDate": "23-09-2023",
  "paymentAmount": "1125.28",
  },
  };
  Order order =  Order.fromJson(json);
  return order;
}


