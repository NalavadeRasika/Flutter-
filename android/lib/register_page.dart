import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/coffee_bg.jpg"), // Cozy background
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              color: Colors.brown[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Create an Account",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.brown[800]),
                    ),
                    SizedBox(height: 20),
                    _buildTextField(nameController, "Full Name", Icons.person),
                    SizedBox(height: 10),
                    _buildTextField(emailController, "Email", Icons.email, keyboardType: TextInputType.emailAddress),
                    SizedBox(height: 10),
                    _buildTextField(mobileController, "Mobile Number", Icons.phone, keyboardType: TextInputType.phone),
                    SizedBox(height: 10),
                    _buildTextField(addressController, "Address", Icons.location_on, maxLines: 2),
                    SizedBox(height: 10),
                    _buildTextField(passwordController, "Password", Icons.lock, obscureText: true),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      ),
                      child: Text("Register", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(color: Colors.brown[800], fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable text field widget with icons
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool obscureText = false, int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.brown[800]),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
