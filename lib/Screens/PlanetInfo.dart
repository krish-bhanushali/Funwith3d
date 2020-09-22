import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer/model_viewer.dart';

class InfoPlanetScreen extends StatelessWidget {
  final String planetName;
  final String planetSource;

  const InfoPlanetScreen({Key key, this.planetName, this.planetSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  src: '$planetSource', // a bundled asset file
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
                        Text('$planetName',style: GoogleFonts.spaceMono(
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
    );
  }
}
