


import 'package:flutter/material.dart';
import 'package:funwith3dmodels/Screens/PlanetSelectScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer/model_viewer.dart';

void main() {
  runApp(InitialApp());
}

class InitialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: PlanetSelect(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
backgroundColor: Colors.black,
        body: Container(

          child: Container(
            child: Stack(
              children: [
                Container(
                  height: 800,


                  child: ModelViewer(
                    backgroundColor: Colors.black,
                    //src: '',
                    src: 'assets/Venus.glb', // a bundled asset file
                    alt: "A 3D model of an astronaut",
                    ar: true,
                    autoRotate: true,
                    cameraControls: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                  width: double.infinity,
                  child: Column(

                    mainAxisSize: MainAxisSize.min,


                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Planet',style: GoogleFonts.spaceMono(
                            color: Colors.white,
                            fontSize: 22
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Venus',style: GoogleFonts.spaceMono(
                              color: Colors.white,
                              fontSize: 26,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}