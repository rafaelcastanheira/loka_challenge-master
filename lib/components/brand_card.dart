import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loka_challenge/sauce_data.dart';

class BrandCard extends StatelessWidget {
  final String brand;
  final String imagePath;

  BrandCard({this.brand, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<SauceData>(context, listen: false)
            .updateSelectedBrand(brand);
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        height: 40.0,
        width: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: brand == Provider.of<SauceData>(context).selectedBrand
                  ? 3
                  : 0,
            )),
        child: Image.asset(
          'images/$imagePath',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
