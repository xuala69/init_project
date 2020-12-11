import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/models/orderModel.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/ui/profile/child_widgets/oneOrderCard.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileOrders extends StatefulWidget {
  @override
  _ProfileOrdersState createState() => _ProfileOrdersState();
}

class _ProfileOrdersState extends State<ProfileOrders> {
  //

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool fetching = true;
  var _api = locator<Api>();
  int page = 0;

  List<OrderModel> ordersList = [];

  @override
  void initState() {
    super.initState();
  }

  void _onRefresh() async {
    ordersList.clear();
    _onLoading();

    _refreshController.refreshCompleted();
    fetching = false;
  }

  Future<dynamic> fetch() async {
    fetching = true;

    dynamic result = await _api.getOrderHistory(page);
    if (result.data == null || result.data.data == null) {
      print('Error on fetching data for product grid' + result.toString());
      return [];
    } else {
      return result.data;
    }
  }

  void _onLoading() async {
    // await Future.delayed(Duration(milliseconds: 500));
    List<dynamic> result = await fetch();
    if (result.length == 0) {
      _refreshController.loadNoData();
    } else {
      if (mounted)
        setState(() {
          result.forEach((element) {
            // MyProduct _tempProd = MyProduct.fromJson(element);
            //outOfStockVisible
            //TODO parse json
            //  ordersList.add(_tempProd);
          });
          page++;
        });

      /* if (page >= 2 && page <= 10) {
        // Preload upto tenth pages
        Future.delayed(Duration(milliseconds: 500))
            .then((value) => _onLoading());
      } */

      _refreshController.loadComplete();
    }

    if (mounted)
      setState(() {
        fetching = false;
      });
  }

  Widget _buildList() {
    if (fetching) {
      return LinearProgressIndicator();
    } else {
      if (ordersList.length > 0) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: ordersList.length,
          itemBuilder: (context, index) {
            return OneOrderCard(order: ordersList[index]);
          },
        );
      } else if (ordersList.length == 0) {
        return Container(
          child: Center(
            child: Text(
              'Error loading data',
            ),
          ),
        );
      }
      return Container(
          child: Text(
        'Loading data from server',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
      ),
      body: SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        header: ClassicHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("Pull up to load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed! Retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("Release to load more");
            } else {
              body = Text('No more items');
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onLoading: _onLoading,
        onRefresh: _onRefresh,
        child: _buildList(),
      ),
    );
  }
}
