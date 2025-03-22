import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String? bookImageUrl;
  final String bookName;
  final String bookAuthor;
  final double bookPrice;
  final VoidCallback onFavorite;

  const CustomContainer({
    super.key,
    this.bookImageUrl,
    required this.bookName,
    required this.bookAuthor,
    required this.bookPrice,
    required this.onFavorite,
  });

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    ImageProvider bookImage = widget.bookImageUrl != null
        ? NetworkImage(widget.bookImageUrl!)
        : const AssetImage('assets/image/Group 2918.png');

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: bookImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.bookName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            'by ${widget.bookAuthor}',
            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            '\$${widget.bookPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[ 
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  widget.onFavorite();
                },
              ),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  // Handle info button press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
