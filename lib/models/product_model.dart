class ProductModel{
  String? productName;
  String? productUrl;
  int? productPrice;
  String? productId;
  int? productQuantity;
  List<dynamic>?productUnit;


  ProductModel({this.productId,this.productQuantity,this.productUnit, this.productName,this.productUrl,this.productPrice});
}