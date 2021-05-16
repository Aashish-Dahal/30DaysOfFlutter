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

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor)),
        onPressed: () {
          if (!isAdded) {
            isAdded = isAdded.toggle();
            final _catalog = CatalogModel();

            _cart.catalog = _catalog;
            _cart.add(catalog);
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
