import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'order_page.dart';
import 'widgets/navbar.dart';
import 'widgets/footer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: NavBar()),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Cart", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: cart.cartItems.isEmpty
                  ? Center(child: Text("Your cart is empty 😞", style: TextStyle(fontSize: 18)))
                  : Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: cart.cartItems.length,
                        itemBuilder: (context, index) {
                          var item = cart.cartItems[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading: Image.asset(item["image"], width: 60, height: 60, fit: BoxFit.cover),
                              title: Text(item["name"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              subtitle: Text(item["price"], style: TextStyle(fontSize: 16, color: Colors.brown)),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => cart.removeFromCart(index),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
            SizedBox(height: 20),
            if (cart.cartItems.isNotEmpty)
              Column(
                children: [
                  Text(
                    "Total: ${_calculateTotal(cart.cartItems)}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderPage(cart.cartItems)),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      backgroundColor: Colors.brown,
                    ),
                    child: Text("Checkout", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  String _calculateTotal(List<Map<String, dynamic>> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      total += double.parse(item["price"].replaceAll("\$", ""));
    }
    return "\$${total.toStringAsFixed(2)}";
  }
}
