String getProductsFromCatId = r"""
query($limit:Int,$categoryId:Int!){
  products(limit:$limit,filter_category_id:$categoryId){
    product_id
    quantity
    name
    image
    images{
      image
    }
  }
}
""";

/* 
String loginUser=r"""
mutation($email:String!,$password:String!){
  login(email:$email,password:$password)
}
"""; */

String loginUser = r"""
mutation{
  login(email:"test@email.com,password:"password")
}
""";
