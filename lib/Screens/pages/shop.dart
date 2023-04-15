import 'package:flutter/material.dart';
import 'package:instagram/Screens/utilities/shop_grid.dart';

class UserShop extends StatefulWidget {
  const UserShop({Key? key}) : super(key: key);

  @override
  State<UserShop> createState() => _UserShopState();
}

class _UserShopState extends State<UserShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Shop",
          style: TextStyle(fontWeight: FontWeight.w700,letterSpacing: 1),
        ),
        actions: [
              Icon(Icons.calendar_month),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(Icons.menu),
              ),
              SizedBox(width: 10,)
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(20),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: ShopGrid()),
        ],
      ),
    );
  }
}
