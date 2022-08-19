import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/data/model/product_model.dart';
import 'package:furniture_ecommerce_app/ui/reusable_widget/product_list_item.dart';
import 'package:furniture_ecommerce_app/ui/reusable_widget/search_bar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ProductModel> productList = [
    ProductModel(
      price: '115',
      productName: 'Minimal Chair',
      rating: '4.5',
      description: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual',
      image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    ProductModel(
      price: '225',
      productName: 'Elegant While chart',
      rating: '4.6',
      description: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual',
      image: 'https://media.istockphoto.com/photos/wooden-chairs-at-table-in-bright-open-space-interior-with-lamp-next-picture-id968086564?k=20&m=968086564&s=612x612&w=0&h=dlB2NThpsLZliGMy_RAdjESDjFtgMgLWZjQnG_CchOM=',
    ),
  ];
  List<ProductModel> trendingProduct = [
    ProductModel(
      price: '415',
      productName: 'New Chair',
      rating: '4.5',
      description: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual',
      image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    ProductModel(
      price: '225',
      productName: 'While chart',
      rating: '4.6',
      description: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual',
      image: 'https://images.pexels.com/photos/2762247/pexels-photo-2762247.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .025,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * .05,
                  right: size.width * .05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/menu.png',
                      width: size.width * .1,
                    ),
                    Image.asset(
                      'assets/images/user_account.png',
                      width: size.width * .08,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * .05,
                  right: size.width * .05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width * .75,
                      child: SearchBar(),
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
              SizedBox(
                height: size.height * .02,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * .06,
                  right: size.width * .05,
                ),
                child: Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: size.width * .08,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * .02,
                  top: size.width * .01,
                  bottom: size.width * .01,
                ),
                height: size.height * .41,
                child: ListView.builder(
                    itemCount: productList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/details', arguments: productList[index]);
                        },
                        child: ProductListItem(
                          productModel: productList[index],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * .06,
                  right: size.width * .05,
                ),
                child: Text(
                  'Best Selling',
                  style: TextStyle(
                    fontSize: size.width * .08,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.all(
                  size.width * .05,
                ),
                height: size.height * .41,
                child: ListView.builder(
                    itemCount: trendingProduct.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/details', arguments: productList[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: size.height * .02),
                          child: ProductListItem(
                            productModel: trendingProduct[index],
                            isHorizontal: true,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
