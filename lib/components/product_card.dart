import 'package:flutter/material.dart';
import 'package:loka_challenge/sauce_data.dart';
import 'package:loka_challenge/screens/product_details.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {this.imagePath, this.name, this.rating, this.price, this.details});

  final String imagePath;
  final String name;
  final int rating;
  final String price;
  final details;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<SauceData>(context, listen: false)
            .updateSelectedProduct(this);
        Navigator.pushNamed(context, ProductDetails.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 20.0,
          color: Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0)),
                      child: Image.asset(
                        "images/$imagePath",
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 5.0,
                        right: 5.0,
                        child: Icon(Icons.favorite_border)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name),
                    Text(
                      price.toString(),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    RatingBar(
                      initialRating: rating + .0,
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
