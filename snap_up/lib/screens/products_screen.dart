import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import '../server_handler.dart';
import '../widgets/seller_item.dart';
import '../models/seller.dart';
import "../models/product.dart";
import 'package:google_fonts/google_fonts.dart';

import "../widgets/product_item.dart";
// to get the product we need to make an api call.
// like sellers use local host of xampp
// or use the api url link below.

//stateful widget as we need to call it in another function.
class ProductScreen extends StatefulWidget {
  static const routeName = "./product-screen";
  const ProductScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // list to store the procucts
  List<Product> _products = [];
  bool _firstexec = true;

  void getProductsPerSeller(int sellerid) {
    ServerHandler()
        .getProductsPerSeller(sellerid)
        .then((value) => {
              // changing the state.
              _products = value
            })
        .catchError((e) => (print(e)));
  }

  @override
  Widget build(BuildContext context) {
    seller seller1 = ModalRoute.of(context)!.settings.arguments as seller;
    // argument seller for gesturedetector in seller_item.dart. is passed here
    // and stored.

    if (_firstexec)
      // getting the products
      getProductsPerSeller(seller1.id!);
    _firstexec = false;
    // stop from executing again.
    return (Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // header
          Padding(
            padding: const EdgeInsets.only(
              left:30.0,
              right:30.0,
              top:30.0,
              bottom:30.0,
            ),
            child: Row(
              // row has children with text.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // seperate the 2 elements

              children: [
                Text("Snap Up",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 23.0,
                      color: const Color(0xFF4E84389),
                    )),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 48, 57, 73),
                  ),
                ),
              ],
            ),
          ),

          if (_products .isEmpty) // if products then we have the products displayed.
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xff425d7a)),
                    strokeWidth: 4,
                  ),
                ),
              ],
            ),
          // if products then we have the products displayed.
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              "Loading Products",
              style: GoogleFonts.pacifico(),
            ),
          ),
          SizedBox(
            height: 170.0,
            child: ListView.builder(
                // horizontal list
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                itemBuilder: (context, index) =>
                 ProductItem(product:_products[index], productIndex:index), 
                // Container(
                //       height: 50.0,
                //       width: 50.0,
                //       color: Colors.pink,
                //       margin: const EdgeInsets.all(5.0),
                //     )
                    ),
          )
        ],
      ),
      // List of items
 ),
    ));
  }
}















// Boiler plate for the project
// include a static routeName
// Add the route import in main.dart.
// in the routes: add ProductScreen.routeName (_)
// in gesture detection use on tap for each item in the seller item 
// where should we head when we click on the item. use navigaotr and import that screen.
// pass the respective seller as an argument.
// product.dart will be in models and have all the data types which are to be 
// feed into the database.
// in products screen add a loading screen.
// in server handler create a function to get the list of products.
// create a function with int seller id as an argument to fetch the necessary
//products. and it is of type future list.





//import "package:flutter/material.dart";
// class ProductScreen extends StatelessWidget{
//   static const routeName = "./product-screen";
//   const ProductScreen({Key? key}):super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return(
//       Scaffold(
//         body: Container(
//           child: Text("Product Screen"),
//         )
//       )

//     );
//   }

// }
