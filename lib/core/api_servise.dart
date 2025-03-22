import 'package:dio/dio.dart';
import 'login_model.dart';
import 'model_book.dart'; // Make sure to import your ModelBook class

class ApiService {
  final String baseUrl = 'https://api.codingarabic.online/api/books';
  final Dio _dio = Dio();

  Future<List<ModelBook>> fetchBooks() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        print('Response data: ${response.data}'); // Debugging line
        Map<String, dynamic> data = response.data;
        List<dynamic> booksData = data['data']; // Access the 'data' key
        return booksData.map((json) => ModelBook.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Error: $e'); // Debugging line
      throw Exception('Failed to load books: $e');
    }
  }

  Future<LoginModel> login(String usermail, String password) async {
    try {
      final response = await _dio.post(
          data: {'email': usermail, 'password': password},
          "https://api.codingarabic.online/api/auth/login");
      response.data;
      Map<String, dynamic> tokenData = response.data["data"];
      LoginModel loginModel = LoginModel.fromJson(tokenData);
      print("hi");
      return loginModel;
    } catch (e) {
      print('Error: $e'); // Debugging line
      throw Exception('Failed to load books: $e');
    }
  }
}
