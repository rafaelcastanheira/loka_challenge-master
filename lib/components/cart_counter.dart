import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loka_challenge/sauce_data.dart';

class CartCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<SauceData>(context).getCartCounter();

    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(
          Icons.format_list_bulleted,
          color: Theme.of(context).backgroundColor,
        )),
        counter != 0
            ? Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
