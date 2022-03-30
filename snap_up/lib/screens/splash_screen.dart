import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../server_handler.dart';
import './sellers_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key ? key}):super(key:key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // ignore: non_constant_identifier_names
  bool show_loader = false;
  dynamic _timer;

  void getSellers(){
    ServerHandler().getSellers()
    .then((value) => 
    Navigator.of(context)
    .popAndPushNamed(SellersScreen.routeName,arguments: value))
    
    // transfer coontrol to the seller_screen.dart file
     //print(value))

    .catchError((e)=>print(e)); //
    // then as it is in future
  }

  @override
  void initState() {

    super.initState();
 _timer = Timer(const Duration(seconds:3),()=>{
      show_loader = true,
      setState((){}),// transfers the control back to the main function.}
      // calling the seller handler to get the information of the sellers.
      getSellers(),
  
    } 
  );
  }
  @override
  void dispose() {
    _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment:Alignment.center,
        color: const Color(0xffE6F3EC),
        child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[Text('Splash Screen', style: GoogleFonts.pacifico(
        color:const Color(0xff425d7a),
        fontSize:20,
        ),
        ),
        
        // loading animation.

        if(show_loader)
        const SizedBox(
          height:20.0,
          width:20.0,
          child:CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff425d7a)),
          strokeWidth: 4,
        ),
        ),
        // Loading text.
           if(show_loader)
          Padding(
          padding: const EdgeInsets.only(top:25.0),
          child: Text("Loading Sellers",style:GoogleFonts.pacifico(),),
        ),
        ],
        ),
      ),
    );
  }
}