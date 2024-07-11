import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan diimpor dengan benar sesuai struktur proyek Anda
import 'football.dart'; // Pastikan diimpor dengan benar sesuai struktur proyek Anda
import 'basketball.dart'; // Pastikan diimpor dengan benar sesuai struktur proyek Anda
import 'running.dart'; // Pastikan diimpor dengan benar sesuai struktur proyek Anda
import 'tennis.dart';

class CheckoutPage extends StatefulWidget {
  final FootballShoe? footballShoe; // Periksa apakah FootballShoe sudah diimpor dan didefinisikan dengan benar
  final BasketballJersey? basketballJersey; // Periksa apakah BasketballJersey sudah diimpor dan didefinisikan dengan benar
  final RunningShoe? runningShoe; // Periksa apakah RunningShoe sudah diimpor dan didefinisikan dengan benar
  final TennisRacket? tennisRacket; // Tambahkan parameter tennisRacket

  CheckoutPage({this.footballShoe, this.basketballJersey, this.runningShoe, this.tennisRacket});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here
      String productName = '';
      if (widget.footballShoe != null) {
        productName = widget.footballShoe!.name;
      } else if (widget.basketballJersey != null) {
        productName = widget.basketballJersey!.name;
      } else if (widget.runningShoe != null) {
        productName = widget.runningShoe!.name;
      } else if (widget.tennisRacket != null) {
        productName = widget.tennisRacket!.name; // Gunakan tennisRacket jika dipilih
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order submitted for $productName'),
        ),
      );
      // Kembali ke HomePage setelah menampilkan Snackbar
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Tentukan item yang akan ditampilkan berdasarkan parameter yang diberikan
    var item;
    if (widget.footballShoe != null) {
      item = widget.footballShoe;
    } else if (widget.basketballJersey != null) {
      item = widget.basketballJersey;
    } else if (widget.runningShoe != null) {
      item = widget.runningShoe;
    } else if (widget.tennisRacket != null) {
      item = widget.tennisRacket;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Color(0xFF473B7B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                'You are purchasing: ${item?.name}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Image.asset(
                item?.imageUrl ?? '',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 16.0),
              Text(
                '\$${item?.price}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF473B7B), // Parameter yang benar
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Submit Order',
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
      ),
    );
  }
}
