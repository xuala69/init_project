class OrderModel {
  String id;
  String status;
  String totalPrice;
  String orderDate;

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    totalPrice = json['totalPrice'];
    orderDate = json['order_date'];
  }
}
