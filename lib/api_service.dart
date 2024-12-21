import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart'; // Ensure Product class is properly imported

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  // Helper method for error handling
  void _handleError(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  // Fetch all products
  Future<List<Product>> getAllProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  // Fetch a single product by ID
  Future<Product> getProductById(int id) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products/$id'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      return Product.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }

  // Fetch all categories
  Future<List<String>> getCategories() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products/categories'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      List jsonResponse = json.decode(response.body);
      return List<String>.from(jsonResponse);
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  // Fetch products from a specific category
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products/category/$category'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } catch (e) {
      throw Exception('Failed to load products by category: $e');
    }
  }

  // Add a new product
  Future<Product> addProduct(Product product) async {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl/products'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(product.toJson()),
          )
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      return Product.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }

  // Update an existing product
  Future<Product> updateProduct(int id, Product product) async {
    try {
      final response = await http
          .put(
            Uri.parse('$baseUrl/products/$id'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(product.toJson()),
          )
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      return Product.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }

  // Delete a product
  Future<void> deleteProduct(int id) async {
    try {
      final response = await http
          .delete(Uri.parse('$baseUrl/products/$id'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  // Fetch all carts
  Future<List<Map<String, dynamic>>> getAllCarts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/carts'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      List jsonResponse = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonResponse);
    } catch (e) {
      throw Exception('Failed to load carts: $e');
    }
  }

  // Fetch a single cart by ID
  Future<Map<String, dynamic>> getCartById(int id) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/carts/$id'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      return json.decode(response.body);
    } catch (e) {
      throw Exception('Failed to load cart: $e');
    }
  }

  // Fetch carts for a specific user
  Future<List<Map<String, dynamic>>> getUserCarts(int userId) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/carts/user/$userId'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      List jsonResponse = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonResponse);
    } catch (e) {
      throw Exception('Failed to load user carts: $e');
    }
  }

  // Delete a cart
  Future<void> deleteCart(int id) async {
    try {
      final response = await http
          .delete(Uri.parse('$baseUrl/carts/$id'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);
    } catch (e) {
      throw Exception('Failed to delete cart: $e');
    }
  }

  // Fetch all users
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/users'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      List jsonResponse = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonResponse);
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  // Fetch a single user by ID
  Future<Map<String, dynamic>> getUserById(int id) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/users/$id'))
          .timeout(const Duration(seconds: 10));
      _handleError(response);

      return json.decode(response.body);
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }
}
