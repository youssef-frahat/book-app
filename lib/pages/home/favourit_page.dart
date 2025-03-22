import 'package:bokiaaa/customs/navigate.dart';
import 'package:flutter/material.dart';
import '../../customs/book_card.dart';
import '../../customs/custom_button.dart';
import 'card_page.dart';

class FavouritePage extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteBooks;

  const FavouritePage({super.key, required this.favoriteBooks});

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  void initializeQuantity() {
    for (var book in widget.favoriteBooks) {
      if (book['quantity'] == null) {
        book['quantity'] = 1;
      }
    }
  }

  void removeBook(int index) {
    setState(() {
      widget.favoriteBooks.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    initializeQuantity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Books'),
        actions: [
          CustomButton(
            text: 'To Cart',
            function: Navigate(
                context,CartPage(
                  cartItems: widget.favoriteBooks,
                ),
                ),
            width: 120,
            height: 40,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: widget.favoriteBooks.length,
          itemBuilder: (context, index) {
            final book = widget.favoriteBooks[index];
            return BookCard(
              book: book,
              onRemove: () => removeBook(index),
            );
          },
        ),
      ),
    );
  }
}
