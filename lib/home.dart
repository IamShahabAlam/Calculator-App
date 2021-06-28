import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';



class Home extends StatefulWidget {
 @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var result = "" ;

 Widget btn(var textt) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 12,
         primary: Colors.grey[900],
        onPrimary: Colors.white54,
        // shape: StadiumBorder(),
        shadowColor: Colors.cyan,
        
      ),
      onPressed: (){
        setState(() {
           result = result + textt ;
        });
      }, child: Text(textt,style: TextStyle(fontSize: 16)),
      
      );
} 

clearbtn (){
  setState(() {
    result = "";
  });
}

delbtn (){
  setState(() {
   result = "" ;
  });
}





output(){
  Parser p = Parser();
  Expression exp = p.parse(result);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm) ;

  setState(() {
    result = eval.toString();
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      backgroundColor: Colors.black,
      

      appBar: AppBar(
        elevation: 50,
        shadowColor: Colors.cyan,
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.cyan[200],
            
          ),
          onPressed: (){}, child: Icon(Icons.menu)),
        
        title: Center(child: Text("CALCULATOR", style: TextStyle(letterSpacing: 4),)),
      
      actions: [
        ElevatedButton(style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.cyan[200],
        ),
          onPressed: (){}, child: Icon(Icons.arrow_forward_ios)),
      ],
      ),

      //=================================================================================
     
      body:
      
       SingleChildScrollView(
              child: Column(
                
          children: [
            
             Container(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage("https://c4.wallpaperflare.com/wallpaper/444/262/334/geometry-cyberspace-digital-art-blue-wallpaper-preview.jpg"),
              //     fit: BoxFit.cover     // fits image in full container
              //      ),

              // ),
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              
             

            
              child: 
              
             Center(child: Text("${result}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white70, letterSpacing: 3 ),)),

            ),

            // Container(
            //   child: Text(, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white70, letterSpacing: 3 ),),

            // ),



              SizedBox(height:20),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              
              
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
          elevation: 8,
          primary: Colors.grey[900],
          onPrimary: Colors.red[900],
          // shape: StadiumBorder(),
          shadowColor: Colors.red[600],
        ),
         onPressed: (){ clearbtn();  }, child: Text("C", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),)),
              
            
            
             ElevatedButton(
                  style: ElevatedButton.styleFrom(
          elevation: 10,
          primary: Colors.grey[900],
          onPrimary: Colors.cyan,
          // shape: StadiumBorder(),
          shadowColor: Colors.cyan,
          
        ),
                  onPressed: delbtn, child: Icon(FontAwesomeIcons.backspace, color: Colors.cyan, size: 15,)),
                btn(" % "),
                btn(" / "),
            ],),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("7"),
                btn("8"),
                btn("9"),
                btn(" * "),
            ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("4"),
                btn("5"),
                btn("6"),
                btn(" - "),
            ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn(" + "),
            ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("0"),
                btn("."),
               
               // Elevated gradient button 
            DecoratedBox(
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),   // necessary for shape change
                  gradient: LinearGradient(
                  colors: [Colors.cyan, Color(0xff64B6FF)])
                  ),
            child: 
              Container(
                height: 35,
                width:150,
              child: ElevatedButton(
                   onPressed: output,
              style: ElevatedButton.styleFrom(
                elevation: 15,
                  shadowColor: Colors.cyan,
                shape: RoundedRectangleBorder(
                  
               borderRadius: BorderRadius.circular(1.0),
              
                 ),
                  primary: Colors.transparent,
                  // padding: EdgeInsets.all(0),
                  minimumSize: Size.zero,
                  
                  ),
                  
          child: Text("=",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
         
            ),
              ),
               ),
                  
                
            ],),

           


          ]
        ),
      ) ,
      
      );
  }
} 

  // ==================================================================================


Widget btn(var textt) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        primary: Colors.grey[900],
        onPrimary: Colors.white54,
        shape: StadiumBorder(),
        shadowColor: Colors.cyan,
        
        
      ),
      onPressed: (){}, child: Text(textt,style: TextStyle(fontSize: 16),),
      
      );
}