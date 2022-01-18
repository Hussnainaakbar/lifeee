import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List> fetchWpPosts()async {
  final url = 'Https://nutriana.surnaturel.ma/wp-json/wp/v2/posts';
  final response =await http.get(Uri.parse(url),headers: {"Accept":"application/json"});

  var jsonResponse = jsonDecode(response.body);
  return jsonResponse;
}

Future fetchWpPostImageUrl(href)async {
  final response =await http.get(Uri.parse(href),headers: {"Accept":"application/json"});

  var jsonResponse = jsonDecode(response.body);
  return jsonResponse;
}

/////// cart/////////////////////

Future<List> fetchCart()async {
  final url = 'http://nutriana.surnaturel.ma/wp-json/cocart/v2/cart';
  final response =await http.get(Uri.parse(url),headers: {"Accept":"application/json"});

  var jsonResponse = jsonDecode(response.body);
  return jsonResponse;
}

Future fetchCartPostImageUrl(href)async {
  final response =await http.get(Uri.parse(href),headers: {"Accept":"application/json"});

  var jsonResponse = jsonDecode(response.body);
  return jsonResponse;
}

