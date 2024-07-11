import 'package:flutter/material.dart';
import 'checkout.dart'; // Import the checkout page

class FootballPage extends StatelessWidget {
  final List<FootballShoe> shoes = [
    FootballShoe(
      name: 'Specs Lightspeed',
      imageUrl: 'assets/images/football_shoes.png',
      price: 400,
      description: 'Sepatu sepak bola berperforma tinggi yang dirancang untuk kecepatan dan kontrol.',
    ),
    FootballShoe(
      name: 'Specs Ls accelerator',
      imageUrl: 'assets/images/football_shoes2.png',
      price: 220.0,
      description: 'Sepatu sepak bola dengan fokus pada presisi dan kekuatan.',
    ),
    FootballShoe(
      name: 'Specs Hyperspeed',
      imageUrl: 'assets/images/football_shoes3.png',
      price: 200.0,
      description: 'Sepatu sepak bola fleksibel yang menawarkan kesesuaian dan kenyamanan luar biasa.',
    ),
    // Tambahkan produk lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Shoes'),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(footballShoe: shoe),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF473B7B), // Correct parameter
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

class FootballShoe {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  FootballShoe({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}
