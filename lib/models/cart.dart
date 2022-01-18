Iterable<OrderModel> orderFromJson(dynamic str)=>
    List<OrderModel>.from(str).map((x) => OrderModel.fromJson(str));



class OrderModel{
  int? orderId;
  String? orderNumber;
  String? status;
  DateTime? orderDate;


  OrderModel({this.orderId,this.orderNumber,this.orderDate,this.status});

  OrderModel.fromJson(Map<String,dynamic> json){
    orderId=json['id'];
    status=json['status'];
    orderNumber=json['order_key'];
    orderDate=DateTime.parse(  orderId=json['id']);
  }


}