import 'dart:convert';
import 'package:e_commerce/models/category.dart';
import 'package:http/http.dart' as http;
// Adjust path if necessary

/// Repository class for fetching Category data from a Django backend.
class CategoryRepository {
  // Base URL for your Django development server.
  // Make sure your Django server is running on this address.
  // For Android emulator, '10.0.2.2' maps to your host machine's localhost.
  // For iOS simulator/web, 'localhost' or '127.0.0.1' usually works.
  final String _baseUrl =
      'http://localhost:8000/api/categories/'; // Example API endpoint

  /// Fetches a list of categories from the Django backend.
  ///
  /// Returns a Future that resolves to a List of Category objects.
  /// Throws an exception if the API call fails or data parsing encounters an error.
  Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Category.fromJson(json)).toList();
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any network or parsing errors.
      throw Exception('Error fetching categories: $e');
    }
  }

  // You can add more methods here for POST, PUT, DELETE operations if needed, e.g.:
  // Future<Category> createCategory(Category category) async { ... }
  // Future<void> updateCategory(Category category) async { ... }
  // Future<void> deleteCategory(int id) async { ... }
}
