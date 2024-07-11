import 'package:flutter/material.dart';
import 'checkout.dart'; // Import the checkout page

class TennisRacket {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  TennisRacket({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}

class TennisPage extends StatelessWidget {
  final List<TennisRacket> rackets = [
    TennisRacket(
      name: 'Wilson Pro Staff',
      imageUrl: 'assets/images/tennis_racket.png',
      price: 250.0,
      description: 'Raket tenis berkualitas tinggi untuk performa maksimal di lapangan.',
    ),
    TennisRacket(
      name: 'Babolat Pure Drive',
      imageUrl: 'assets/images/tennis_racket2.png',
      price: 220.0,
      description: 'Raket tenis dengan fokus pada presisi dan kekuatan.',
    ),
    TennisRacket(
      name: 'Head Graphene 360',
      imageUrl: 'assets/images/tennis_racket3.png',
      price: 200.0,
      description: 'Raket tenis fleksibel yang menawarkan kesesuaian dan kontrol luar biasa.',
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tennis Rackets'),
        backgroundColor: Color(0xFF473B7B),
      ),
      body: ListView.builder(
        itemCount: rackets.length,
        itemBuilder: (context, index) {
          final racket = rackets[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      racket.imageUrl,
                      width: 300,
                      height: 300,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    racket.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '\$${racket.price}',
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
                    racket.description,
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
                            builder: (context) => CheckoutPage(tennisRacket: racket),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF473B7B), // Change primary to backgroundColor
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
