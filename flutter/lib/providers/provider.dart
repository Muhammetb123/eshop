import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/repositories/repository.dart';
import 'package:flutter/material.dart';
// Import your repository

/// A ChangeNotifier that manages the state of categories.
/// It fetches categories using CategoryRepository and notifies listeners of changes.
class CategoryProvider extends ChangeNotifier {
  final CategoryRepository _categoryRepository; // Instance of the repository

  List<Category> _categories = [
    Category(id: 2, name: '123', description: 'description')
  ]; // Private list to hold categories
  bool _isLoading = false; // Tracks if data is currently being loaded
  String? _errorMessage; // Stores any error messages

  // Public getters for accessing the state
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Constructor. Requires a CategoryRepository instance.
  CategoryProvider({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository;

  /// Fetches categories from the repository and updates the state.
  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null; // Clear previous errors
    notifyListeners(); // Notify listeners that loading has started

    try {
      _categories = await _categoryRepository.getCategories();
    } catch (e) {
      _errorMessage = e.toString(); // Store the error message
      _categories = []; // Clear categories on error
    } finally {
      _isLoading = false; // Loading has finished
      notifyListeners(); // Notify listeners with the updated state (data or error)
    }
  }

  // You can add more methods here to handle category-related logic,
  // such as adding, updating, or deleting categories, and then calling notifyListeners().
}
