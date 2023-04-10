import 'package:app/model/products.dart';
import 'package:http/http.dart' as http;

class Services {
  static var client = http.Client();
  static Future<List<Products>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    }
    return <Products>[];
  }
}
