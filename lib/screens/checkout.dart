import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loka_challenge/components/credit_card.dart';
import 'package:loka_challenge/sauce_data.dart';
import 'package:loka_challenge/screens/thankyou.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  static const String id = "/checkout";

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String shippingAddress = "";
  String firstAndLastName = "";
  String email = "";
  bool isEmail = true;
  bool isShippingAddress = true;
  bool isFirstAndLastName = true;

  @override
  Widget build(BuildContext context) {
    var cartProducts = Provider.of<SauceData>(context).cart;

    return Scaffold(
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
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: Theme.of(context).backgroundColor),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Checkout",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Introduce Shipping Address:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        shippingAddress = value;
                      });
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      errorText: !isShippingAddress
                          ? "Invalid Shipping Address"
                          : null,
                      errorStyle: isShippingAddress
                          ? TextStyle(color: Colors.red)
                          : null,
                      hintText: 'Shipping Address',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Introduce First and Last Name",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        firstAndLastName = value;
                      });
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      errorText: !isFirstAndLastName ? "Invalid Name" : null,
                      errorStyle: isFirstAndLastName
                          ? TextStyle(color: Colors.red)
                          : null,
                      hintText: 'First and Last Name',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Introduce Email:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      errorText: !isEmail ? "Invalid email" : null,
                      errorStyle: isEmail ? TextStyle(color: Colors.red) : null,
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    "Your products:",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 100.0,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        var cartProduct = cartProducts[index];
                        return ListTile(
                          leading:
                              Image.asset("images/${cartProduct.imagePath}"),
                          title: Text(cartProduct.details["brand"]),
                          subtitle: Text(cartProduct.price),
                          trailing: Icon(
                            Icons.whatshot,
                            color: Colors.redAccent,
                          ),
                        );
                      },
                      itemCount: cartProducts.length,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Total number of items: ${Provider.of<SauceData>(context).getCartCounter()}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Total amount to pay: ${Provider.of<SauceData>(context).totalPriceOfCart()}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Payment Method",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Credit card: "),
                      Icon(Icons.credit_card),
                      Provider.of<SauceData>(context).creditCardNumber != ""
                          ? Text(
                              Provider.of<SauceData>(context).creditCardNumber)
                          : Text("No card")
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Provider.of<SauceData>(context).creditCardNumber == ""
                      ? FlatButton(
                          child: Text(
                            "Add Card",
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor),
                          ),
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            Navigator.pushNamed(context, CreditCard.id);
                          })
                      : Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Material(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () {
                                if (email == "") {
                                  setState(() {
                                    isEmail = false;
                                  });
                                } else
                                  isEmail = true;

                                if (firstAndLastName == "") {
                                  setState(() {
                                    isFirstAndLastName = false;
                                  });
                                } else
                                  isFirstAndLastName = true;

                                if (shippingAddress == "") {
                                  setState(() {
                                    isShippingAddress = false;
                                  });
                                } else
                                  isShippingAddress = true;

                                if (isShippingAddress &&
                                    isEmail &&
                                    isFirstAndLastName) {
                                  Navigator.pushNamed(context, ThankYou.id);
                                }
                              },
                              child: Text(
                                "Make Payment",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color:
                                            Theme.of(context).backgroundColor),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
