import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/services/secure_service.dart';
import 'package:init_project/utils/constants.dart';

class Api {
  var client = http.Client();
  String demoUrl = Constants.demoUrlRest;

  var _secure = locator<SecureService>();
  //posts starts

  Future<bool> createToken() async {
    var response = await client
        .post(demoUrl + "oauth2/token/client_credentials", headers: {
      "Authorization":
          "Basic c2hvcHBpbmdfb2F1dGhfY2xpZW50OnNob3BwaW5nX29hdXRoX3NlY3JldA==",
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        await _secure.write("token", _bodyMap['data']['access_token']);
        await _secure.write(
            "tokenExpire", _bodyMap['data']['expires_in'].toString());
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future refreshToken(String oldToken) async {
    String bodyJson = jsonEncode({"old_token: $oldToken"});
    var response = await client
        .post(demoUrl + "token/client_credentials", body: bodyJson, headers: {
      "Authorization":
          "Basic c2hvcHBpbmdfb2F1dGhfY2xpZW50OnNob3BwaW5nX29hdXRoX3NlY3JldA==",
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        await _secure.write("token", _bodyMap['data']['access_token']);
        await _secure.write(
            "tokenExpire", _bodyMap['data']['expires_in'].toString());
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future<Map> loginUser({String email, String password}) async {
    var _body = {"email": email, "password": password};
    var _token = await _secure.read("token");
    //https://opencart3-oauth.api.opencart-api.com/api/rest/login
    var response = await client.post(demoUrl + "login",
        body: _body, headers: {"Authorization": "Bearer $_token"});
    if (response.statusCode == 200) {
      var responseBody = response.body;
      Map _map = json.decode(responseBody);
      _secure.write("signedIn", "true");
      return _map;
    } else if (response != null) {
      Map _body = jsonDecode(response.body);
      var error = _body["error"][0];
      Map _map = {"success": 2, "error": error};
      return _map;
    }
    return null;
  }

  Future<Response> registerUser(Map<String, dynamic> userDetails) async {
    var _token = await _secure.read("token");
    var response = await client.post(demoUrl + "register",
        body: userDetails, headers: {"Authorization": "Bearer $_token"});
    return response;
  }

//simple auth below

  Future addItemToCart(String productId, int quantity) async {
    var _body = {"product_id": productId, "quantity": quantity};
    var response = await client.post(demoUrl + "login", body: _body, headers: {
      "X-Oc-Merchant-Id": Constants.ocMerchantId,
      "X-Oc-Session": await _secure.read("sessionId")
    });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      _secure.write("userId", "");
      _secure.write("token", "");
      return response;
    }
    return null;
  }

  Future updateCartItemQuantity(String key, int quantity) async {
    var _body = {"key": key, "quantity": quantity};
    var response = await client.post(demoUrl + "login", body: _body, headers: {
      "X-Oc-Merchant-Id": Constants.ocMerchantId,
      "X-Oc-Session": await _secure.read("sessionId")
    });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      _secure.write("userId", "");
      _secure.write("token", "");
      return response;
    }
    return null;
  }

  Future removeCartItem(String key) async {
    var _body = {"key": key};
    var response = await client.post(demoUrl + "login", body: _body, headers: {
      "X-Oc-Merchant-Id": Constants.ocMerchantId,
      "X-Oc-Session": await _secure.read("sessionId")
    });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      _secure.write("userId", "");
      _secure.write("token", "");
      return response;
    }
    return null;
  }

  //posts done
  //get starts
  //4c72fd9edf68e2cb5999a7d5c93a85f1

  //get for 0auth
  Future<String> getGeneralInfo(String id) async {
    // await _secure.write("token", "0cb84d16c9d5d16fd66a67cdcafabd1cddc703dd");
    var _token = await _secure.read("token");
    var response = await client.get(demoUrl + "information/" + id, headers: {
      "Authorization": "Bearer " + _token,
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        return _bodyMap['data']["description"];
      } else {
        return null;
      }
    }
    return null;
    //customerorders/limit/{limit}/page/{page}slideshows/products/search/sony
  }

  Future<Map> getSlideshows() async {
    // await _secure.write("token", "0cb84d16c9d5d16fd66a67cdcafabd1cddc703dd");
    var _token = await _secure.read("token");
    var response = await client.get(demoUrl + "slideshows", headers: {
      "Authorization": "Bearer " + _token,
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        List _ad = _bodyMap['data'];
        return _ad[0];
      } else {
        return null;
      }
    }
    return null;
    //customerorders/limit/{limit}/page/{page}slideshows/categories
  }

  Future<dynamic> searchProductOnce(String name) async {
    // await _secure.write("token", "0cb84d16c9d5d16fd66a67cdcafabd1cddc703dd");
    var _token = await _secure.read("token");
    var response =
        await client.get(demoUrl + "products/search/" + name, headers: {
      "Authorization": "Bearer " + _token,
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        return _bodyMap['data'];
      } else {
        return null;
      }
    }
    return null;
    //customerorders/limit/{limit}/page/{page}slideshows/products/search/sony
  }

  Future<Map> getCategoriesHome() async {
    var _token = await _secure.read("token");
    var response = await client.get(demoUrl + "categories", headers: {
      "Authorization": "Bearer " + _token,
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        List _ad = _bodyMap['data'];
        return _ad[0];
      } else {
        return null;
      }
    }
    return null;
  }

  Future<Map> getAllCategories() async {
    var _token = await _secure.read("token");
    var response = await client
        .get(demoUrl + "categories/extended/limit/10/page/1", headers: {
      "Authorization": "Bearer " + _token,
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        List _ad = _bodyMap['data'];
        return _ad[0];
      } else {
        return null;
      }
    }
    return null;
  }

  Future<Map> getAllStores() async {
    var _token = await _secure.read("token");
    var response = await client.get(demoUrl + "stores", headers: {
      "Authorization": "Bearer " + _token,
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        List _ad = _bodyMap['data'];
        return _ad[0];
      } else {
        return null;
      }
    }
    return null;
  }

  Future<Map> getSpecialProducts() async {
    var _token = await _secure.read("token");
    var response = await client.get(demoUrl + "specials", headers: {
      "Authorization": "Bearer " + _token,
    });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        List _ad = _bodyMap['data'];
        return _ad[0];
      } else {
        return null;
      }
    }
    return null;
  }

  Future<Map> getOrderHistory(int page) async {
    // await _secure.write("token", "0cb84d16c9d5d16fd66a67cdcafabd1cddc703dd");
    var _token = await _secure.read("token");
    var response = await client.get(
        demoUrl + "customerorders/limit/15/page/" + page.toString(),
        headers: {
          "Authorization": "Bearer " + _token,
        });
    if (response.statusCode == 200) {
      var body = response.body;
      Map _bodyMap = jsonDecode(body);
      if (_bodyMap['success'] == 1) {
        return _bodyMap['data'];
      } else {
        return null;
      }
    }
    return null;
    //customerorders/limit/{limit}/page/{page}
  }

  //below are for simple auth
  Future getSignedInStatus() async {
    var response = await client.get(demoUrl + "account", headers: {
      "X-Oc-Merchant-Id": Constants.ocMerchantId,
      "X-Oc-Session": await _secure.read("sessionId")
      // await _secure.read("sessionId")
    });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    return null;
  }

  Future getCartDetails() async {
    var response = await client.get(demoUrl + "cart", headers: {
      "X-Oc-Merchant-Id": Constants.ocMerchantId,
      "X-Oc-Session": await _secure.read("sessionId")
    });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    return null;
  }

  Future getXitemsFromCategoryId(
      {String limit, String categoryId, String page}) async {
    var response = await client.get(
        demoUrl +
            "rest/products/category/" +
            categoryId +
            "/limit/" +
            limit +
            "/page/" +
            page,
        headers: {
          "X-Oc-Merchant-Id": Constants.ocMerchantId,
          "X-Oc-Session": await _secure.read("sessionId")
        });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    return null;
  }

  Future searchXwithPageYandLimit(
      {String limit, String keyword, String page}) async {
    var response = await client.get(
        demoUrl +
            "rest/products/search/" +
            keyword +
            "/limit/" +
            limit +
            "/page/" +
            page,
        headers: {
          "X-Oc-Merchant-Id": Constants.ocMerchantId,
          "X-Oc-Session": await _secure.read("sessionId")
        });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    return null;
  }

  Future getRelatedFromProductId({String productId}) async {
    var response = await client.get(demoUrl + "related" + productId, headers: {
      "X-Oc-Merchant-Id": Constants.ocMerchantId,
      "X-Oc-Session": await _secure.read("sessionId")
    });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    return null;
  }

  Future getProductFromId({String productId}) async {
    var response = await client.get(demoUrl + "related" + productId, headers: {
      "X-Oc-Merchant-Id": Constants.ocMerchantId,
      "X-Oc-Session": await _secure.read("sessionId")
    });
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    return null;
  }

  //gets done
}

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(
        uri: 'http://127.0.0.1/opencart/index.php?route=api/graphql/usage'),
  ),
);
