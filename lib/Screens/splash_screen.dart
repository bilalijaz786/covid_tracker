import 'dart:async';
import 'dart:math' as math;
import 'package:covid_tracker/Screens/Home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
late final AnimationController controller=AnimationController(
  duration: Duration(seconds: 3),

  
  vsync:this,)..repeat();
  @override
  
  
  

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    
    Timer(Duration(seconds: 3), () {
       Navigator.push(
             context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  
    
    
    
    );
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 22, 18, 18),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              child: Container(
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.height*0.5,
                child:Image(image: AssetImage( "Images/virus.png"),)
              ),
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: controller.value*2.0*math.pi,
                  child: child,
                  );
                
              }
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.08,),
            Text("Covid-19\nTracker App",
            style: TextStyle(
              color: Colors.white   ,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
            )
          ],
        )
        ),
    );
  }
}