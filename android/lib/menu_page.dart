import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'widgets/navbar.dart';
// import 'widgets/footer.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      var item = menuItems[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                                child: Image.asset(
                                  item["image"]!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["name"]!,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    item["price"]!,
                                    style: TextStyle(fontSize: 16, color: Colors.green),
                                  ),
                                  SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      Provider.of<CartProvider>(context, listen: false).addToCart(
                                        item["name"]!, item["price"]!, item["image"]!,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 40),
                                    ),
                                    child: Text("Add to Cart"),
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
          // Footer(), // ✅ Footer always at the bottom
        ],
      ),
    );
  }
}
