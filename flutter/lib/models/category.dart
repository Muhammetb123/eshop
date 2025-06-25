import 'dart:convert'; // Required for jsonDecode

/// Represents a product category in the Flutter application.
/// This model mirrors the structure of your Django Category model.
class Category {
  final int id;         // Django models typically have an 'id' field automatically.
  final String name;
  final String description;

  /// Constructor for the Category model.
  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  /// Factory constructor to create a Category instance from a JSON map.
  /// This is useful when parsing data received from an API.
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String? ?? '', // Handle potential null or missing description
    );
  }

  /// Converts a Category instance to a JSON map.
  /// This is useful when sending data to an API (e.g., for creating or updating a category).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  /// Provides a string representation of the Category object, useful for debugging.
  @override
  String toString() {
    return 'Category(id: $id, name: $name, description: $description)';
  }
}
