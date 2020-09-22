


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:funwith3dmodels/Screens/PlanetInfo.dart';
import 'package:funwith3dmodels/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlanetSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),

        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
          decoration: BoxDecoration(
   
          ),
          child: ListView(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> InfoPlanetScreen(
                      planetName: infoList[0]["planetName"],
                      planetSource: infoList[0]["planet3dUrl"],
                    )));
                  },
                  child: PlanetRow(
                    planetBgUrl: infoList[0]["planetBgUrl"],
                    planetThumbnailUrl: infoList[0]["planetThumbnailUrl"],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class PlanetRow extends StatelessWidget {
  final String planetBgUrl;
  final String planetThumbnailUrl;

  const PlanetRow({Key key, this.planetBgUrl, this.planetThumbnailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
          child: Stack(
        children: [
          PlanetCard(planetBgUrl),
         ThumbnailPlanet(planetThumbnailUrl),

      ],
    ),
    );
  }
}




Widget ThumbnailPlanet(String planetThumbnail){
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 16
    ),
    alignment: FractionalOffset.centerLeft,
    child:
       CachedNetworkImage(
          imageUrl: "$planetThumbnail",
          fit: BoxFit.fill,
          placeholder: (context,url){
            return Center(child: CircularProgressIndicator(),);
          },
         height: 92.0,
         width: 92.0,
        ),

  );
}



Widget PlanetCard(String imageUrl){
  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder:(context, imageProvide) => Container(
      height: 124.0,
      margin: EdgeInsets.only(
        left: 46.0,

      ),
      decoration: BoxDecoration(

        image: DecorationImage(
          image: imageProvide,
          fit: BoxFit.fill
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0,10.0)
          )
        ]
      ),
    ),
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
       decoration: BoxDecoration(
         color: Colors.grey[800],
         borderRadius: BorderRadius.only(
           topRight:Radius.circular(30.0) ,
           topLeft: Radius.circular(30.0),
           bottomLeft: Radius.circular(30.0),
           bottomRight: Radius.circular(30.0),
         )
       ),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[800],
       elevation: 0,
        title: Text('Funwith3d',style: GoogleFonts.spaceMono(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        leading: IconButton(icon: FaIcon(FontAwesomeIcons.infinity ,color: Colors.white,), onPressed: null),

      ),
    );
  }
  final Size preferredSize = const Size.fromHeight(kToolbarHeight+10);
}
