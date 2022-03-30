import 'package:http/http.dart' as http;
import 'package:snap_up/models/product.dart';

import 'dart:convert';

import "./models/seller.dart";

// all server requests.

class ServerHandler {
  final String _baseUrl = "http://whoisrishav.com/better-buys/api";
  // this is the website which has the seller data hosted.

  // this will take some time to get the data and only then it is stored in a list
  // we use future here

// list of sellers
  Future<List<seller>> getSellers() async {
    try {
      List<seller> sellers = [];
      // async as we have to wait and hence we also use await function as well.
      http.Response response =
          await http.get(Uri.parse('$_baseUrl/gen/sellers'));
      //  this is in json format print(response.body);
      List sellers_json_parse = (json.decode(response.body))['sellers'];
      // adding the json values to the sellers list.
      for (Map m in sellers_json_parse) {
        sellers.add(seller.fromMap(
            m)); // map method from the seller.dart file to get the values.
        // add elements into the seller list.
      }
      return sellers;
    } catch (e) {
      print("Error is :- " + e.toString());
      rethrow;
    }
  }

/// get list of products per sellers.
 
  Future<List<Product>> getProductsPerSeller(int sellerid) async {
    // we will get the input from the api. it is of the form of json.
    try {
      List<Product> products = [];
      http.Response response = await http
          .get(Uri.parse('$_baseUrl/gen/products?seller_id=$sellerid'));
      // product list
      List sellers_json_parse = (json.decode(response.body))['products'];
      // adding the json values to the sellers list.
      for (Map m in sellers_json_parse) {
        products.add(Product.fromMap(m));
      }
      return products;
    } catch (e) {
      print("Error is:-" + e.toString());
      rethrow;
    }
  }
}
