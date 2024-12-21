import 'package:flutter/foundation.dart';
import '../models/product.dart'; // Assuming you have a Product model
import '../services/api_service.dart'; // Assuming ApiService is already implemented

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch products from API
  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = ''; // Reset any previous error message
    notifyListeners(); // Notify listeners to rebuild UI

    try {
      _products = await ApiService()
          .getAllProducts(); // Assuming ApiService fetches products
    } catch (error) {
      _errorMessage = 'Failed to load products: $error';
    }

    _isLoading = false;
    notifyListeners(); // Notify listeners to rebuild UI
  }
}
