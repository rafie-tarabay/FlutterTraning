import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
      appBar: AppBar(title: Text(appTitle)),

      //body: Center(child: Text('My Page!')),
       // body:GridViewScreen(),
        body: DataTableScreen(),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text('Drawer Header'), decoration: BoxDecoration( color: Colors.blue ) ),
            ListTile(title: Text('Item 1'),  onTap: () { Navigator.pop(context);  } ),
            ListTile(title: Text('Item 2'),  onTap: () { Navigator.pop(context);  } ),
            SizedBox(
              height: 300,
              child: ListView.builder(itemCount: 5,
                itemBuilder: (context,i){

                return SizedBox(height: 30, child: ListTile(title: Text('Item '+i.toString()),  onTap: () { Navigator.pop(context);  } ));
                },

              ),
            )
          ],
        ), ), ));
  }
}
class GridViewScreen extends StatelessWidget {
  final List<Map> myProducts =
  List.generate(1000, (index) => {"id": index, "name": "Product $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            /*gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),*/

            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container( alignment: Alignment.center,
                  child: Text(myProducts[index]["name"]),
                  decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)) ),
              );
            }));
  }
}
class DataTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     // Generate a list of fiction prodcts
    final List<Map> _products = List.generate(30, (i) {
      return {"id": i, "name": "Product $i", "price": Random().nextInt(200) + 1};
    });

      return  Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.amber[200]),
                columns: [
                  DataColumn(label: Text('Id')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Price')),
                ],
                rows: _products.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item['id'].toString())),
                    DataCell(Text(item['name'])),
                    DataCell(Text(item['price'].toString()))
                  ]);
                }).toList(),
              ),
          ));
    }

  }



//--------------
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Code Sample',
        home: Scaffold(
            appBar: AppBar(title: Text('Card & ListTile Example') ),
            body: Card(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton( child: const Text('BUY TICKETS'),onPressed: () {/* ... */}, ),
                          SizedBox(width: 8),
                          TextButton( child: const Text('LISTEN'), onPressed: () {/* ... */}, ),
                          SizedBox(width: 8),
                        ],
                      ) ] ) )));
  }}
//-----------------


//------------------------
void mainxx() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: height / 4,
          child: FittedBox(
            child: Image.network('https://i.ibb.co/Y2CNM8V/new-york.jpg',),
            fit: BoxFit.fill,
          ),
        ),
        Foreground()
      ],
    );
  }
}

class Foreground extends StatelessWidget {
  const Foreground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    var inputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(30.0)));
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.ibb.co/Z1fYsws/profile-image.jpg',
              ),
              backgroundColor: Colors.black26,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: DefaultTextStyle(
            style: GoogleFonts.raleway(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text('Hello Rafie', style: TextStyle(fontSize: 30)),
                SizedBox(height: 5),
                Text('Check the weather by the city', style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w700)),
                SizedBox(height: 35),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    hintText: 'Search city',
                    hintStyle: TextStyle(color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
                SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('My locations', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                      IconButton(icon: Icon(Icons.more_horiz),color: Colors.white, onPressed: () {},)
                    ]),
                SizedBox(height: 30),
               ImgRow()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ImgRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var location in locations)
          ClipRRect(borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CachedNetworkImage(width: (width / 2) - 25, height: 300, fit: BoxFit.cover,
                  imageUrl: location.imageUrl,
                  placeholder: (context, url) => new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
                Column(
                  children: [
                    Text(location.text, style: TextStyle(color: Colors.white, fontSize: 19,fontWeight: FontWeight.w600)),
                    Text(location.timing),SizedBox(height: 40),
                    Text(location.temperature.toString() + '°',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600)),
                    SizedBox(height: 50),
                    Text(location.weather),
                  ],
                )]))]);
  }
}



class Location {
  final String text,timing,weather,imageUrl;
  final int temperature;
  Location({ this.text,  this.timing,  this.temperature, this.weather, this.imageUrl,   });
}

final locations = [
  Location(text: 'New York',timing: '10:44 am',temperature: 15, weather: 'Cloudy',imageUrl: 'https://i.ibb.co/df35Y8Q/2.png',),
  Location(text: 'San Francisco', timing: '7:44 am', temperature: 6, weather: 'Raining', imageUrl: 'https://i.ibb.co/7WyTr6q/3.png',),
];

