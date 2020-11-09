import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loka_challenge/components/product_card.dart';
import 'package:loka_challenge/sauce_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toast/toast.dart';

class ProductDetails extends StatefulWidget {
  static const String id = "/product_details";

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    ProductCard prodCard = Provider.of<SauceData>(context).selectedProduct;

    final double size = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Image.asset(
            'images/logo.png',
            scale: 3,
            fit: BoxFit.cover,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).accentColor,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            Icon(
              Icons.search,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(
              width: 10.0,
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  "images/${prodCard.imagePath}",
                  fit: BoxFit.scaleDown,
                ),
                RatingBar(
                  initialRating: prodCard.rating + .0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(prodCard.details["brand"],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5.0,
                ),
                Text(prodCard.price,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Theme.of(context).backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Hotness",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RatingBar(
                    initialRating: prodCard.rating + .0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.whatshot,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Details",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Scoville level: ${prodCard.details["scoville"]}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text("Ingredients: ${prodCard.details["ingredients"]}",
                      style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        Provider.of<SauceData>(context, listen: false)
                            .addProductToCart();
                        Toast.show("Added to cart", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      },
                      child: Text(
                        "Add to Cart",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Theme.of(context).backgroundColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
