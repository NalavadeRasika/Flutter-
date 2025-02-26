import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: NavBar()),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true, // Ensures the scrollbar is always visible
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About Cozy Coffee",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.asset("assets/images/coffee5.jpg", width: 300, height: 200, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "At Cozy Coffee, we believe that every cup tells a story. "
                "We source the finest coffee beans from around the world and "
                "brew them with passion and expertise.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "Since our establishment in 2010, we have been dedicated to bringing the best coffee experience to our customers.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              Text(
                "Visit us today and enjoy a fresh, handcrafted coffee!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
