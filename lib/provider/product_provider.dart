import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:life_style_app/models/product_model.dart';



class ProductProvider with ChangeNotifier{

   ProductModel productModel = ProductModel();

  List<ProductModel>search=[];

  productModels(QueryDocumentSnapshot element){
    productModel = ProductModel(
      productUrl: element.get('productUrl'),
      productName: element.get('productName'),
      productPrice: element.get('productPrice'),
      productId: element.get('productId'),
      productUnit: element.get('productUnit'),
    );
    search.add(productModel);
  }


  ///////////////herbsProduct///////////////////////
  List<ProductModel> herbsProductList =[];



  fetchHerbsProductData() async{

    List<ProductModel> newList =[];

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("Product").get();
    for (var element in snapshot.docs) {
      productModels(element);
      newList.add(productModel);
    }
    herbsProductList = newList;
    notifyListeners();
  }


  List<ProductModel> get getHerbsProductDataList{
    return herbsProductList;
  }



  }
