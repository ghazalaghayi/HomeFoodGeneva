import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_food_geneva/AuthScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AuthProvider.dart';
import 'ShoppingCart.dart';
import 'Code.dart';
import 'item.dart';

class CartListWidget extends StatefulWidget {
  final ShoppingCart cart;

  CartListWidget({this.cart});

  @override
  State<StatefulWidget> createState() {
    return _CartListWidgetState();
  }
}

class _CartListWidgetState extends State<CartListWidget> {
  static const platform = const MethodChannel('camellabs.com/payment');

  Future<void> _checkout() async {
    await platform.invokeMethod('charge', widget.cart.toMap);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    widget.cart.items.forEach((c) {
      if (c.number > 0) {
        items.add(_CartListItemWidget(
          item: c,
        ));
        items.add(Padding(
          padding: EdgeInsets.only(top: 8.0),
        ));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: <Widget>[
          /*    FlatButton(
              textColor: Colors.white,
              onPressed: () => this._checkout(),
              child: Text("Checkout"),
            ) */
        ],
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Stack(
            children: <Widget>[
              ListView(
                padding: EdgeInsets.only(bottom: 64),
                children: items,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 64,
                child: _CartListSummaryFooterWidget(
                  totalPrice: widget.cart.formattedTotalPrice,
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            if (Provider.of<Auth>(context, listen: false).token == null) {
              return Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return AuthScreen();
              }));
            }

            setState(() {
              widget.cart.items = [];
            });
            Provider.of<Code>(context, listen: false).getCode();
            Navigator.of(context).pop(true);
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return Provider.of<Code>(context, listen: true).code == "-1"
                    ? Center()
                    : Provider.of<Code>(context, listen: true).code == null
                        ? Center(child: CircularProgressIndicator())
                        : AlertDialog(
                            title: const Text('Success'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Your order submitted successfully.'),
                                  Text('Thank you for your shopping.'),
                                  Text('Code: ' +
                                      Provider.of<Code>(context, listen: true)
                                          .code),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
              },
            );
          } catch (errorMessage) {
            _showErrorDialog(errorMessage);
          }
        },
        backgroundColor: Colors.red[400],
        child: Icon(
          Icons.done,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _CartListSummaryFooterWidget extends StatelessWidget {
  final String totalPrice;

  _CartListSummaryFooterWidget({this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Row(
            children: <Widget>[
              Text(
                'Total',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Expanded(
                  child: Text(
                this.totalPrice,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.subtitle1,
              ))
            ],
          )),
        ));
  }
}

class _CartListItemWidget extends StatelessWidget {
  final Item item;

  _CartListItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
              bottom: BorderSide(color: Colors.grey, width: 0.5))),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Container(
                height: 64,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(item.imageUrl),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
              ),
              Expanded(
                  child: Text(
                item.name,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .apply(fontSizeFactor: 0.75),
              )),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
              ),
              Text(
                item.formattedPrice,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
          Text(
            "x" + item.number.toString(),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
