import 'package:flutter/material.dart';
import 'football.dart'; // Import halaman football
import 'basketball.dart'; // Import halaman basketball
import 'tennis.dart'; // Import halaman tennis
import 'running.dart'; // Import halaman running
import 'product_page.dart'; // Import halaman running
import '../models/product.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Football Shoes',
      price: 400,
      imageUrl: 'assets/images/football_shoes.png',
      description: 'Sepatu sepak bola berperforma tinggi yang dirancang untuk kecepatan dan kontrol.',
      category: 'Football',
    ),
    Product(
      id: '2',
      name: 'Basketball Jersey',
      price: 120,
      imageUrl: 'assets/images/basketball_jersey.png',
      description: 'Jersey basket yang nyaman untuk mobilitas dan gaya optimal.',
      category: 'Basketball',
    ),
    Product(
      id: '3',
      name: 'Tennis Racket',
      price: 200,
      imageUrl: 'assets/images/tennis_racket.png',
      description: 'Raket tenis yang tahan lama dengan cengkeraman dan kontrol yang sangat baik.',
      category: 'Tennis',
    ),
    Product(
      id: '4',
      name: 'Running Shoes',
      price: 120,
      imageUrl: 'assets/images/running_shoes.png',
      description: 'Sepatu lari ringan yang dirancang untuk kenyamanan jarak jauh.',
      category: 'Running',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisz Sport'),
        backgroundColor: Color(0xFF473B7B),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCategoryItem(context, 'Football', Icons.sports_soccer, FootballPage()),
                  _buildCategoryItem(context, 'Basketball', Icons.sports_basketball, BasketballPage()),
                  _buildCategoryItem(context, 'Tennis', Icons.sports_tennis, TennisPage()),
                  _buildCategoryItem(context, 'Running', Icons.directions_run, RunningPage()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...products.map((product) => _buildProductItem(context, product)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, IconData icon, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Chip(
          label: Text(title),
          avatar: Icon(icon),
          backgroundColor: Color(0xFF3584A7),
          labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              category: product.category,
              products: [product],
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                product.imageUrl,
                width: 100,
                height: 100,
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
