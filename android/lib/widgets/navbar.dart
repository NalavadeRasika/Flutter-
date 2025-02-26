import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';
import '../author_provider.dart';
import '../home_page.dart';
import '../menu_page.dart';
import '../about_page.dart';
import '../contact_page.dart';
import '../cart_page.dart';
import '../login_page.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    int cartItemCount = Provider.of<CartProvider>(context).cartItems.length;

    return AppBar(
      backgroundColor: Colors.brown,
      title: Text('Cozy Coffee', style: TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        _navItem(context, 'Home', HomePage()),
        _navItem(context, 'Menu', MenuPage()),
        _navItem(context, 'About Us', AboutPage()),
        _navItem(context, 'Contact', ContactPage()),
        IconButton(
          icon: Stack(
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              if (cartItemCount > 0)
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(cartItemCount.toString(), style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ),
            ],
          ),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())),
        ),
        IconButton(
          icon: Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false).logout();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _navItem(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
