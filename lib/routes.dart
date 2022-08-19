import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/data/model/product_model.dart';
import 'package:furniture_ecommerce_app/ui/details/details.dart';
import 'package:furniture_ecommerce_app/ui/home/home.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => Home());
    case '/details':
      return MaterialPageRoute(
          builder: (context) => Details(
                productDetails: settings.arguments as ProductModel,
              ));
    default:
      return MaterialPageRoute(builder: (context) => Home());
  }
}
