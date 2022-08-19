import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_ecommerce_app/data/model/product_model.dart';
import 'package:furniture_ecommerce_app/ui/reusable_widget/color_selector.dart';

class Details extends StatefulWidget {
  final ProductModel productDetails;
  const Details({
    required this.productDetails,
    Key? key,
  }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Color selectedColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: Colors.white,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                ),
                child: Image.network(
                  widget.productDetails.image,
                  height: size.height * .5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: size.width * .02,
              left: size.width * .02,
              top: size.height * .025,
              child: Container(
                margin: EdgeInsets.all(size.width * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_circle_left_sharp),
                    Text(
                      'Product',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Badge(
                      badgeContent: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: size.width * .02,
              top: size.height * .48,
              child: Container(
                padding: EdgeInsets.all(size.width * .03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: size.width * .06,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: size.height * .52,
              child: Container(
                margin: EdgeInsets.all(
                  size.width * .05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      String.fromCharCodes(new Runes('\u0024')) + widget.productDetails.price,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productDetails.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        RatingBar.builder(
                          itemSize: 20,
                          initialRating: double.parse(
                            widget.productDetails.rating,
                          ),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 1,
                            );
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Text(
                      'Color Options',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    ColorSelector(
                      color: [
                        Colors.blue,
                        Colors.orange,
                        Colors.pink,
                      ],
                      selectedColor: selectedColor,
                      onColorSelected: (color) {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Text(
                      widget.productDetails.description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        letterSpacing: 2.0,
                        wordSpacing: 2.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(
                  15.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          40.0,
                        ),
                        bottomLeft: Radius.circular(
                          1.0,
                        ))),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
