import 'package:flutter/material.dart';
import 'checkout.dart'; // Import CheckoutPage

class RunningPage extends StatelessWidget {
  final List<RunningShoe> shoes = [
    RunningShoe(
      name: '910nineten HAZE PRO',
      imageUrl: 'assets/images/running_shoes.png',
      price: 130.0,
      description: 'Sepatu lari berkualitas tinggi untuk performa maksimal di lintasan.',
    ),
    RunningShoe(
      name: 'Specs Ignition',
      imageUrl: 'assets/images/running_shoes2.png',
      price: 180.0,
      description: 'Sepatu lari yang nyaman untuk mobilitas dan gaya optimal.',
    ),
    RunningShoe(
      name: 'Ortuseight Hyperfuse',
      imageUrl: 'assets/images/running_shoes3.png',
      price: 160.0,
      description: 'Sepatu lari yang tahan lama dengan kesesuaian dan kenyamanan luar biasa.',
    ),
    // Tambahkan produk lainnya di sini
  ];

  void navigateToCheckout(BuildContext context, RunningShoe shoe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutPage(runningShoe: shoe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Running Shoes'),
        backgroundColor: Color(0xFF473B7B),
      ),
      body: ListView.builder(
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          final shoe = shoes[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      shoe.imageUrl,
                      width: 300,
                      height: 300,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    shoe.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '\$${shoe.price}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Product Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    shoe.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        navigateToCheckout(context, shoe); // Navigasi ke CheckoutPage dengan RunningShoe yang dipilih
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF473B7B), // Ubah primary ke backgroundColor
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RunningShoe {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  RunningShoe({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}
