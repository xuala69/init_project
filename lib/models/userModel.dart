class UserModel {
  /*  "firstname": "First",
       "email": "test23141@email.com",
       "telephone": "1-541-754-3010",
      "city": "Aizawl",
      "address_1": "Demo",
      "postcode": 796001,
      "zone_id": 01,  */

  String name;
  String email;
  String phone;
  String userId;
  UserModel({
    this.name,
    this.email,
    this.phone,
    this.userId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['customer_id'].toString();
    name = json['firstname'];
    email = json['email'];
    phone = json['telephone'];
   /*  cartCount = json['cart_count_products'];
    wishlistCount = int.tryParse(json['wishlist_total']); */
  }
}
