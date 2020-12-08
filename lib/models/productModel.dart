class ProductModel {
  String id;
  String name;
  String description;
  String manufacturer;
  String model;
  int price;
  int finalPrice;
  int quantity;
  List<ProductOptions> options;
  List<String> images;
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.manufacturer,
    this.model,
    this.price,
    this.finalPrice,
    this.quantity,
    this.options,
    this.images,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    manufacturer = json['manufacturer'];
    model = json['model'];
    price = json['price'];
    finalPrice = json['special'];
    quantity = json['quantity'];
    List<String> _imagesTemp = [];
    List _temp1 = json['images'];
    _temp1.forEach((element) {
      _imagesTemp.add(element);
    });
    images = _imagesTemp;
    List<ProductOptions> _optionsTemp = [];
    List _temp2 = json['options'];
    _temp2.forEach((element) {
      ProductOptions _t = ProductOptions.fromJson(element);
      _optionsTemp.add(_t);
    });
    options = _optionsTemp;
  }
}

class ProductOptions {
  int productOptionId;
  int optionId;
  String name;
  String type;
  String image;
  List<ProductOptionsValue> valueList;
  ProductOptions(
      {this.productOptionId,
      this.optionId,
      this.name,
      this.type,
      this.image,
      this.valueList});
  ProductOptions.fromJson(Map<String, dynamic> json) {
    productOptionId = json['product_option_id'];
    optionId = json['option_id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    List _temp = json['option_value'];
    valueList = [];
    _temp.forEach((element) {
      ProductOptionsValue _temp2 = ProductOptionsValue.fromJson(element);
      valueList.add(_temp2);
    });
  }
}

class ProductOptionsValue {
  int quantity;
  int price;
  int optionValueId;
  int productOptionValueId;
  String image;
  String name;
  ProductOptionsValue({
    this.image,
    this.name,
    this.quantity,
    this.price,
    this.optionValueId,
    this.productOptionValueId,
  });
  ProductOptionsValue.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    price = json['price'];
    optionValueId = json['option_value_id'];
    productOptionValueId = json['product_option_value_id'];
    image = json['image'];
    name = json['name'];
  }
}
