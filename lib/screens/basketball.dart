import 'package:flutter/material.dart';
import 'checkout.dart'; // Import the checkout page

class BasketballPage extends StatelessWidget {
  final List<BasketballJersey> jerseys = [
    BasketballJersey(
      name: 'Los Angeles Lakers Jersey',
      imageUrl: 'assets/images/basketball_jersey.png',
      price: 120.0,
      description: 'Authentic Los Angeles Lakers basketball jersey.',
    ),
    BasketballJersey(
      name: 'Chicago Bulls Jersey',
      imageUrl: 'assets/images/basketball_jersey2.png',
      price: 110.0,
      description: 'Classic Chicago Bulls basketball jersey.',
    ),
    BasketballJersey(
      name: 'Golden State Warriors Jersey',
      imageUrl: 'assets/images/basketball_jersey3.png',
      price: 130.0,
      description: 'Official Golden State Warriors basketball jersey.',
    ),
    // Tambahkan produk lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketball Jerseys'),
        backgroundColor: Color(0xFF473B7B),
      ),
      body: ListView.builder(
        itemCount: jerseys.length,
        itemBuilder: (context, index) {
          final jersey = jerseys[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      jersey.imageUrl,
                      width: 300,
                      height: 300,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    jersey.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '\$${jersey.price}',
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
                    jersey.description,
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
                            builder: (context) => CheckoutPage(basketballJersey: jersey),
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

class BasketballJersey {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  BasketballJersey({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}
