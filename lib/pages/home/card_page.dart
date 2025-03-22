import 'package:bokiaaa/customs/maintext.dart';
import 'package:bokiaaa/customs/navigate.dart';
import 'package:bokiaaa/pages/home/cheackout_page.dart';
import 'package:flutter/material.dart';

import '../../customs/custom_button.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  void increaseQuantity(int index) {
    setState(() {
      widget.cartItems[index]['quantity']++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (widget.cartItems[index]['quantity'] > 0) {
        widget.cartItems[index]['quantity']--;
      }
    });
  }

  double getTotalPrice() {
    return widget.cartItems.fold(0, (total, item) {
      final itemPrice = double.tryParse(item['price'] ?? '0') ?? 0.0;
      return total + (itemPrice * item['quantity']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Maintext(text: "My Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                final itemPrice = double.tryParse(item['price'] ?? '0') ?? 0.0;
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        item['bookImageUrl'] != null
                            ? Image.network(
                                item['bookImageUrl'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.fitWidth,
                              )
                            : Image.asset(
                                'assets/image/Group 2918.png', // Fallback image
                                width: 50,
                                height: 50,
                                fit: BoxFit.fitWidth,
                              ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'by ${item['author']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                '\$${itemPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    decreaseQuantity(index);
                                  },
                                ),
                                Text(
                                  item['quantity'].toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    increaseQuantity(index);
                                  },
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                removeItem(index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${getTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              text: 'Checkout',
              function: Navigate(
                  context,
                  CheckoutPage(
                      totalAmount:
                          getTotalPrice())), // Replace with your desired widget
              width: double.infinity,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
