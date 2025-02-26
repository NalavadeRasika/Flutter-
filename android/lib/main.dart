import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'author_provider.dart';
import 'cart_provider.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()), // Authentication provider
      ],
      child: CoffeeShopApp(),
    ),
  );
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cozy Coffee',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return auth.isAuthenticated ? HomePage() : LoginPage();
        },
      ),
    );
  }
}
