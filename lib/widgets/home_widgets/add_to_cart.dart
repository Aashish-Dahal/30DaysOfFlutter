import 'package:demo_app/core/store.dart';
import 'package:demo_app/models/cart_model.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isAdded = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor)),
        onPressed: () {
          if (!isAdded) {
            AddMutation(catalog);
          }
        },
        child: isAdded
            ? (Icon(
                Icons.done,
                size: 15,
              ))
            : Icon(CupertinoIcons.cart_badge_plus));
  }
}
