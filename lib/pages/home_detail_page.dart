import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h40(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    15.heightBox,
                    catalog.name.text.xl3
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    "Takimata rebum rebum ipsum sea ut. Voluptua nonumy dolores et ipsum sed, stet rebum voluptua clita invidunt at voluptua sit dolore, invidunt elitr sed takimata ea accusam elitr diam. Rebum."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
        bottomNavigationBar: ButtonBar(
          buttonPadding: Vx.mOnly(right: 16),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder()),
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor)),
                    onPressed: () {},
                    child: "Add to cart".text.make())
                .wh(120, 45)
          ],
        ).p12(),
      ),
    );
  }
}
