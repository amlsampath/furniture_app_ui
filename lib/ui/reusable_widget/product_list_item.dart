import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/data/model/product_model.dart';

class ProductListItem extends StatelessWidget {
  final bool isHorizontal;
  final ProductModel productModel;
  const ProductListItem({
    required this.productModel,
    this.isHorizontal = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isHorizontal
        ? Container(
            padding: EdgeInsets.all(
              size.width * .015,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.all(
              size.width * .01,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    productModel.image,
                    width: size.width * .2,
                    height: size.height * .12,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                Container(
                  width: size.width * .6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        productModel.productName,
                        style: TextStyle(
                          fontSize: size.width * .05,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        productModel.description.substring(
                          0,
                          15,
                        ),
                        style: TextStyle(
                          fontSize: size.width * .025,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            String.fromCharCodes(new Runes('\u0024')) + productModel.price,
                            style: TextStyle(
                              fontSize: size.width * .06,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            //  margin: EdgeInsets.all(size.width * .01),
                            //   padding: EdgeInsets.all(size.width * .02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                              size: size.height * .05,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(
              top: size.width * .01,
              left: size.width * .05,
              bottom: size.width * .01,
            ),
            width: size.width * .5,
            padding: EdgeInsets.all(
              size.width * .04,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        productModel.image,
                        width: size.width,
                        height: size.height * .22,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: size.width * .02,
                      top: size.height * .01,
                      child: Container(
                        padding: EdgeInsets.all(size.width * .01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.pink,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: size.width * .05,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Text(
                  productModel.productName,
                  style: TextStyle(
                    fontSize: size.width * .05,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Text(
                  productModel.description.substring(
                    0,
                    15,
                  ),
                  style: TextStyle(
                    fontSize: size.width * .025,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      String.fromCharCodes(new Runes('\u0024')) + productModel.price,
                      style: TextStyle(
                        fontSize: size.width * .06,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.add_circle_rounded,
                      size: size.height * .05,
                    )
                  ],
                )
              ],
            ),
          );
  }
}
