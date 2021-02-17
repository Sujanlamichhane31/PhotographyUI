import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool themeSwitch= false;
  
  dynamic themeColors(){
    if(themeSwitch){
      return Colors.grey[850];
    }else{
      return Colors.greenAccent;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors(),
        elevation: 0,
        brightness: themeSwitch? Brightness.dark:Brightness.light,
        leading: IconButton(
          icon: themeSwitch?Icon(
            Icons.brightness_3,
            color: themeSwitch?Colors.greenAccent:Colors.grey[850],
          ):Icon(
            Icons.wb_sunny,
            color: themeSwitch?Colors.greenAccent:Colors.grey[850],
          ),
          onPressed: () {
            setState(() {
              themeSwitch= ! themeSwitch;
              print(themeSwitch);
            });
           
          },
        ),
      ),
      body: SafeArea(
          child: Container(
            color: themeColors(),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeColors(),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.0),
                  )),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UnSplash",
                    style: TextStyle(
                      color: themeSwitch
                          ?Colors.greenAccent
                          :Colors.grey[850],
                      fontSize: 26.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Photos For EveryOne",
                    style: TextStyle(
                      color: themeSwitch
                          ?Colors.greenAccent
                          :Colors.grey[850],                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintText: "Search for Photos",
                          hintStyle: TextStyle(
                            color: themeSwitch
                                ?Colors.greenAccent
                                :Colors.grey[850],                            fontSize: 15.0,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: themeSwitch
                                ?Colors.greenAccent
                                :Colors.grey[850],                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 200.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              imageCard("assets/IMG_0079.JPG", "One"),
                              imageCard("assets/IMG_3579.JPG", "One"),
                              imageCard("assets/IMG_3580.JPG", "One"),
                              imageCard("assets/IMG_6999.JPG", "One"),
                              imageCard("assets/IMG_7172.JPG", "One"),
                              imageCard("assets/IMG_8412.JPG", "One"),
                              imageCard("assets/IMG_0079.JPG", "One"),
                              imageCard("assets/IMG_20191101_081245_801.JPG",
                                  "Hello world"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/IMG_20191101_081245_801.JPG"
                              )
                            )
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                            child: Text("Current Festival",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

Widget imageCard(image, title) {
  return AspectRatio(
    aspectRatio: 2 / 3,
    child: Container(
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                image,
              ))),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
