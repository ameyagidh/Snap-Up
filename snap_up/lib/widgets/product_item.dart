import 'package:flutter/material.dart';
import 'package:snap_up/utility/colors.dart';
import '../models/product.dart';
import '../models/seller.dart';
import '../server_handler.dart';
import '../widgets/seller_item.dart';
import "../utility/colors.dart";
import 'package:google_fonts/google_fonts.dart';
import "../screens/product_details_screen.dart";
class ProductItem extends StatelessWidget {
  static const routeName = '/product-screen';
  final Product product;
  final int productIndex;
  const ProductItem({Key? key, required this.product, required this.productIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //dividing the colors by 4 and taking the remainder
    // as this will allow us to get the colors which are only 4 in our cart.js.

    return 
    GestureDetector(
    // navgate to a product screen from the current product item when clicked.
    onTap: () => Navigator.of(context).pushNamed(product_details_screen.routeName, arguments: product),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,          
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:Border.all(
                      color: primaryColors[productIndex % 4],
                      width:3.0,
                     )),
                ),
                  Container(
                      height: 100.0,
                      width: 100.0,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                          primaryColors[productIndex % 4],
                          primaryColors[productIndex % 4].withOpacity(0.0),
                      ], // red to yellow
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                  child: Image.network(
                    "http://whoisrishav.com/better-buys/assets/${product.image!}"),
                  // color: Colors.cyan,
                ),
                ],
                ),
          ),
        // writing the text 
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(product.name!, style: GoogleFonts.poppins(
           color: Color(0xFF4E8489),
          fontSize: 12.0, 
       )
      ),
        )  ],
      ),
    );      
  }
}
