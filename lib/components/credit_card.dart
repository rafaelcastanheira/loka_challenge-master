import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:loka_challenge/sauce_data.dart';

class CreditCard extends StatefulWidget {
  static const String id = "/credit_card";

  @override
  State<StatefulWidget> createState() {
    return CreditCardState();
  }
}

class CreditCardState extends State<CreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: Theme.of(context).accentColor,
              child: Text(
                "Add Card",
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              onPressed: () {
                String slicedNumber =
                    cardNumber.substring(cardNumber.length - 4);
                Provider.of<SauceData>(context, listen: false)
                    .setCreditCardNumber("**** $slicedNumber");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
