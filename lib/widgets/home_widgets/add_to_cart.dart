import 'package:demo_app/models/cart_model.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(widget.catalog) ?? false;

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
            _cart.add(widget.catalog);
            setState(() {});
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
