import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loka_challenge/components/brand_card.dart';
import 'package:toast/toast.dart';
import 'package:loka_challenge/screens/checkout.dart';
import 'package:provider/provider.dart';
import 'package:loka_challenge/sauce_data.dart';
import 'package:loka_challenge/components/cart_counter.dart';

class Homepage extends StatefulWidget {
  static const String id = "/homepage";

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SauceData>(context, listen: false).updateVisibleProducts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/logo.png',
          scale: 3,
          fit: BoxFit.cover,
        ),
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).accentColor,
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Provider.of<SauceData>(context, listen: false).getCartCounter() ==
                      0
                  ? Toast.show("No items selected", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM)
                  : Navigator.pushNamed(context, Checkout.id);
            },
            child: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext bc) {
                  var cart = Provider.of<SauceData>(context).cart;

                  return Container(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            "images/${cart[index].imagePath}",
                            fit: BoxFit.fill,
                          ),
                          title: Text(cart[index].details["brand"]),
                          subtitle: Text(cart[index].price),
                          trailing: Icon(
                            Icons.clear,
                            color: Colors.redAccent,
                          ),
                        );
                      },
                      itemCount: cart.length,
                    ),
                  );
                });
          },
          elevation: 10.0,
          backgroundColor: Theme.of(context).primaryColor,
          child: CartCounter()),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: Theme.of(context).backgroundColor),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Choose Brand",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 70.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        BrandCard(
                          brand: "Tabasco",
                          imagePath: "tabasco.png",
                        ),
                        BrandCard(
                          brand: "Paladin",
                          imagePath: "paladin.png",
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Text(
                  Provider.of<SauceData>(context).selectedBrand == "Tabasco"
                      ? "Tabasco Products"
                      : "Paladin Products",
                  style: Theme.of(context).textTheme.headline6),
            ),
            GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                // to disable GridView's scrolling
                shrinkWrap: true,
                // You won't see infinite size error
                childAspectRatio: itemWidth / itemHeight,
                children: Provider.of<SauceData>(context)
                    .visibleProducts
                    .map((e) => e)
                    .toList()),
          ],
        ),
      ),
    );
  }
}
