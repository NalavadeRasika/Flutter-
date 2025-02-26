import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'widgets/navbar.dart';

class MenuPage extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {"name": "Espresso", "price": "\$3.00", "image": "assets/images/coffee1.jpg"},
    {"name": "Latte", "price": "\$4.50", "image": "assets/images/coffee2.jpg"},
    {"name": "Cappuccino", "price": "\$4.00", "image": "assets/images/coffee3.jpg"},
    {"name": "Americano", "price": "\$3.50", "image": "assets/images/coffee4.jpg"},
    {"name": "Mocha", "price": "\$5.00", "image": "assets/images/coffee5.jpg"},
    {"name": "Flat White", "price": "\$4.50", "image": "assets/images/coffee6.jpg"},
    {"name": "Macchiato", "price": "\$4.00", "image": "assets/images/coffee7.jpg"},
    {"name": "Affogato", "price": "\$5.50", "image": "assets/images/coffee8.jpg"},
    {"name": "Irish Coffee", "price": "\$6.00", "image": "assets/images/coffee9.jpg"},
    {"name": "Turkish Coffee", "price": "\$3.50", "image": "assets/images/coffee10.jpg"},
  ];

  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: NavBar()),
      body: Container(
        color: Colors.brown.shade50, // Subtle background color
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjusted padding
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8, // Adjusted aspect ratio for better spacing
                        crossAxisSpacing: 20, // Increased spacing for better separation
                        mainAxisSpacing: 20,
                      ),
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        var item = menuItems[index];
                        return Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          color: Colors.white,
                          shadowColor: Colors.brown.shade200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                  child: Image.asset(
                                    item["image"]!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => const Center(
                                      child: Icon(Icons.error, color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12), // Adjusted padding inside cards
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"]!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown, // Dark brown for coffee theme
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      item["price"]!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ElevatedButton(
                                      onPressed: () {
                                        Provider.of<CartProvider>(context, listen: false).addToCart(
                                          item["name"]!, item["price"]!, item["image"]!,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.brown, // Themed button color
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        minimumSize: const Size(double.infinity, 40),
                                      ),
                                      child: const Text("Add to Cart"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
