import 'package:bokiaaa/customs/navigate.dart';
import 'package:bokiaaa/pages/home/congrats.dart';
import 'package:flutter/material.dart';

import '../../customs/custom_button.dart';
import '../../customs/custom_textfaild.dart';

class CheckoutPage extends StatelessWidget {
  final double totalAmount;

  const CheckoutPage({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Full Name',
              iconData: Icons.person,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Email',
              iconData: Icons.email,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Address',
              iconData: Icons.home,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Phone',
              iconData: Icons.phone,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Submit Order',
              function: Navigate(
                context,
                const OrderSuccessPage(),
              ), // Replace with your desired widget
              width: double.infinity,
              height: 50,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
