import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:my_template/models/product_model.dart';

class FavoriteManager {
  static Box? _favoritesBox; // Declare the box as nullable

  // Function to set the box, call this once in your main file
  static void setFavoritesBox(Box favoritesBox) {
    _favoritesBox = favoritesBox;
  }

  static bool isFavorite(int productId) {
    return _favoritesBox?.containsKey(productId) ?? false;
  }

  static void toggleFavorite(ProductModel product) {
    if (_favoritesBox != null) {
      if (isFavorite(product.id!)) {
        _favoritesBox!.delete(product.id);
        Fluttertoast.showToast(msg: 'Removed from fav');
      } else {
        _favoritesBox!.put(product.id, product);
        Fluttertoast.showToast(msg: 'Added from fav');
      }
    }
  }

  static List<ProductModel> getFavorites() {
    List<ProductModel> favorites = [];
    if (_favoritesBox != null) {
      for (var key in _favoritesBox!.keys) {
        ProductModel product = _favoritesBox!.get(key);
        favorites.add(product);
      }
    }
    return favorites;
  }
}
