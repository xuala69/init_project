class BannerModel {
  String title;
  String link;
  String image;
  String productId;
  BannerModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    image = json['image'];
    productId = null;
    if (link != null && link != "") {
      if (link.contains("product_id")) {
        String temp = link.split("=").last;
        productId = temp;
      }
    }
  }
}
