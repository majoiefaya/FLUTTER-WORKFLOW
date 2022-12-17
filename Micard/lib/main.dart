import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white60,
          //0Xe2ceb8

          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: Text('ma carte ipnet',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/batman1.jpg'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'GOGO\'S SHOTO',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              SizedBox(
                width: 80.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Text('FULLSTACK DEVELOPPER',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                height: 40.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.phone,color: Colors.brown,size: 40.0),
                    Text('+228 90123456',style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.brown,
                      fontWeight:FontWeight.bold,
                    ),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                height: 40.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.mail,color:Colors.brown,size: 40.0),
                    Text('mahfouzauthentic@gmail.com',style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.brown,
                      fontWeight:FontWeight.bold,
                    ),)],
                ),
              )
            ],
          ),
        ));
  }
}
