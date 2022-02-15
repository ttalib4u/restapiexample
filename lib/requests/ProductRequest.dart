import 'package:http/http.dart' as http;
import '../model/Product.dart';
import 'dart:convert';

List<Product> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromMap(json)).toList();
}
Future<List<Product>> fetchProducts() async {
  Uri myUri = Uri.parse("https://teesoftenterprise.com.ng/restapi/api.php");
  final response = await http.get(myUri);
  if (response.statusCode == 200) {
    return parseProducts(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}