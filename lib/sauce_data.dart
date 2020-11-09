import 'package:flutter/foundation.dart';
import 'components/product_card.dart';

class SauceData extends ChangeNotifier {
  var sauceData;
  String selectedBrand = "Tabasco";
  ProductCard selectedProduct;
  String creditCardNumber = "";

  List<ProductCard> visibleProducts = [];
  List<ProductCard> cart = [];

  void clearData(){
    selectedBrand = "Tabasco";
    creditCardNumber = "";
    visibleProducts.clear();
    cart.clear();
  }

  void updateSauceData(var data) {
    sauceData = data;
    notifyListeners();
  }

  void updateSelectedBrand(String newBrand) {
    selectedBrand = newBrand;
    updateVisibleProducts();
    notifyListeners();
  }

  void updateSelectedProduct(ProductCard newSelectedProduct) {
    selectedProduct = newSelectedProduct;
    notifyListeners();
  }

  void updateVisibleProducts() {
    visibleProducts.clear();
    int numberOfProducts = int.parse(sauceData[selectedBrand]["numberOf"]);
    var data = sauceData[selectedBrand]["products"];

    for (int i = 0; i < numberOfProducts; i++) {
      visibleProducts.add(ProductCard(
        name: data[i]["name"],
        rating: int.parse(data[i]["rating"]),
        price: data[i]["price"],
        imagePath: data[i]["image"],
        details: data[i]["details"],
      ));
    }
    notifyListeners();
  }

  void addProductToCart() {
    cart.add(selectedProduct);
    notifyListeners();
  }

  void removeProductFromCart(ProductCard newProd) {
    cart.remove(newProd);
    notifyListeners();
  }

  String totalPriceOfCart() {
    double total = 0.0;

    cart.forEach((element) {
      total +=
          double.parse(element.price.substring(0, element.price.length - 1));
    });
    return total.toString() + "€";
  }

  int getCartCounter() => cart.length;

  void setCreditCardNumber(String number) {
    creditCardNumber = number;
    notifyListeners();
  }
}
