import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/products_screen.dart';
import '../models/product.dart';
import 'package:google_fonts/google_fonts.dart';

class product_details_screen extends StatelessWidget {
  static const routeName = '/product-details-screen';

  const product_details_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Product product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name!, style: GoogleFonts.poppins(), ),
        elevation: 0.0,
        backgroundColor: Color(0xFF4E8489),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        // Background color for the details of the product.
        color: Color(0xFF4E8489),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                "http://whoisrishav.com/better-buys/assets/${product.image!}",
                // "http://whoisrishav.com/better-buys/assets/${product.unCompressedImage!}",
                height: MediaQuery.of(context).size.height * 1 / 2,
                fit: BoxFit.cover,
                // 1/2 of screen size to the image.
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text("${product.PricePerKg!}", style: GoogleFonts.poppins(
                    color: const Color(0xFF4E8489),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )),
              // type cast to string.
               ),
               Container(
                  // Product description.
                  // entire width
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child:Text(product.desciption!.substring(0,190), style: GoogleFonts.poppins(
                    color: const Color(0xFF4E8489),
                  ),
                  ),
               ),
              // Review container.
              Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15.0),
                ),
              ),
               ],
          ),
        ),
      ),
    );
  }
}













// Repeating pattern for screens.

// import 'package:flutter/material.dart';

// class product_details_screen extends StatelessWidget {
//   static const routeName = '/sellers-screen';

//   const product_details_screen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container();
//   }
// }
// import the route in product details screen.

