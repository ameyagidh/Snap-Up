// shows the seller items.
import '../models/seller.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import '../screens/products_screen.dart';

class SellerItem extends StatelessWidget{
  final seller seller1;
  final Color backgroundColor;
  const SellerItem({Key ? key, required this.seller1, required this.backgroundColor}):super(key:key);

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: ()=>Navigator.of(context).pushNamed(ProductScreen.routeName,arguments: seller),
     child: Container(
       margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        height: 200.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
   
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
           Column(children:[
             Padding(
               padding: const EdgeInsets.only(
                 left:25.0,
                 top:50.0),
               child: Text
               (seller1.name!,
               style: GoogleFonts.pacifico(
               color : Colors.black,
               fontSize:18.0,
               fontWeight: FontWeight.bold,
               ),),
             ),
             Container(
               width: 160.0,
                 padding: const EdgeInsets.only(
                 left:25.0,
                 top:5.0),
               child: Text(seller1.address!,
               maxLines: 2, overflow:TextOverflow.ellipsis,
               ),
             ),
             //google fonts so no const.
            Container(
              width: 160.0,
              padding: const EdgeInsets.only(
                 left:25.0,
                 top:5.0),
              child: Text("No Rating",textAlign: TextAlign.start,style: GoogleFonts.pacifico(
                 color : Colors.black,
                 fontSize:13.0,
                 ),
               ),
            ),],),        
        Padding(
          padding: const EdgeInsets.only(right:10.0),
          child: Image.network("http://whoisrishav.com/better-buys/assets/${seller1.image!}"),
        ),
        ],
      )
   
     ),
   );
  }
}