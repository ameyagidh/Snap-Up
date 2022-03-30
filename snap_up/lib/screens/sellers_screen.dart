import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/seller.dart';
import '../widgets/seller_item.dart';

// put constants in the init state.

class SellersScreen extends StatefulWidget{

// stateless as when user interacts its state does not change.

static const routeName = '/sellers-screen';

const SellersScreen({Key?key}):super(key:key);
  @override
   State<SellersScreen> createState()=>_SellersScreenState();
  
}

class _SellersScreenState extends State <SellersScreen>{
        List<Color>sellerItemsBackgroundColor = [];

             @override
        void initState(){
          super.initState();
          sellerItemsBackgroundColor.add(const Color(0xFFE6F3EC));
          sellerItemsBackgroundColor.add(const Color(0xFE3F3EFC));
          sellerItemsBackgroundColor.add(const Color(0xFFA6E3EC));
          sellerItemsBackgroundColor.add(const Color(0xFF6B3EEC));
          
        }


 @override
  Widget build(BuildContext context) {
    // list of sellers. ! for null safety
    List<seller> sellers = ModalRoute.of(context)!.settings.arguments as List<seller>;    
    return Scaffold(
       body: Container(
        alignment:Alignment.center,
        child:SingleChildScrollView(
          child: Column(
              children: [
              // Padding(padding: const EdgeInsets.symmetric(
              //   horizontal: 20.0,
              //   vertical: 50.0,
              // ),
        
            // Header row    
            
                   
             Padding(

               padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 50.0,
               ),
               child: Row(
                 // row has children with text.
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 // seperate the 2 elements
        
                 children:[
                 Text("Snap Up",style: GoogleFonts.poppins(
                   fontWeight: FontWeight.w500,
                   fontSize: 23.0,
                   color: const Color(0xFF4E84389),
                 )),
                 Container(
                   height: 50.0,
                   width: 50.0,
                   decoration: const BoxDecoration(
                     shape: BoxShape.circle,
                     color : Color.fromARGB(255, 48, 57, 73),
                   ),
                 ),
                 ],
               ),
             ),
             // displaying the sellers.
             Column(
               // column has childrens
               children: sellers.map((e) => SellerItem(seller1: e, backgroundColor: sellerItemsBackgroundColor[sellers.indexOf(e)%4],)).toList()           
              .toList(),
              
             )
             ],              
          ),
        ),
        

        //Text('Sellers Screen!!!'),
    ),
    );

  }

}
