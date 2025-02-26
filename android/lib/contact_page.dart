import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'widgets/footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: NavBar()),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true, // Ensures scrollbar is always visible
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Contact Us",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.asset("assets/images/coffee6.jpg", width: 300, height: 200, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "We'd love to hear from you! Feel free to reach out using the contact details below.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.brown),
                  SizedBox(width: 10),
                  Text("+91 9652150667", style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.brown),
                  SizedBox(width: 10),
                  Text("support@cozycoffee.com", style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.brown),
                  SizedBox(width: 10),
                  Text("123 Coffee St, Dadar, Mumbai", style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Opening Hours",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Monday - Friday: 7:00 AM - 8:00 PM", style: TextStyle(fontSize: 18)),
              Text("Saturday - Sunday: 8:00 AM - 10:00 PM", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
