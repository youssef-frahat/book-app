import 'package:flutter/material.dart';
import '../../core/api_servise.dart';
import '../../core/model_book.dart';
import '../../customs/custom_container.dart';
import 'favourit_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> favoriteBooks = [];
  List<ModelBook> books = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  void fetchBooks() async {
    ApiService apiService = ApiService();
    try {
      List<ModelBook> fetchedBooks = await apiService.fetchBooks();
      setState(() {
        books = fetchedBooks;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching books: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void addFavoriteBook(ModelBook book) {
    setState(() {
      favoriteBooks.add({
        'name': book.title,
        'author': 'Unknown Author', // Adjust as needed
        'price': book.price?.replaceAll(RegExp(r'[^0-9.]'), '') ?? '0',
        'bookImageUrl': book.image,
        'description': book.description,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
        title: const Image(image: AssetImage("assets/image/Group 2918.png")),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavouritePage(favoriteBooks: favoriteBooks),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText:
                            "Find out the best books to read when you don't even know what to read !!!",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Popular Books',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio:
                            0.7, // Adjust the aspect ratio as needed
                      ),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return CustomContainer(
                          bookImageUrl: book.image,
                          bookName: book.title ?? 'No Title',
                          bookAuthor: 'Unknown Author', // Adjust as needed
                          bookPrice: double.tryParse(book.price
                                      ?.replaceAll(RegExp(r'[^0-9.]'), '') ??
                                  '0') ??
                              0,
                          onFavorite: () =>
                              addFavoriteBook(book), // Pass the book object
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
