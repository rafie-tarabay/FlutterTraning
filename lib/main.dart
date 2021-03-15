import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:cached_network_image/cached_network_image.dart";

void main() => runApp(AppList());
class AppList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Drawer Demo';
    return MaterialApp(
        title: appTitle,
        home: DrawerWidget());
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Drawer Demo';
    return  Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: Center(child: Text('Demo')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: FittedBox(fit: BoxFit.fill,
                child: Image.network('https://i.ibb.co/df35Y8Q/2.png')) ),
            ListTile(title: Text('GridViewBuilderScreen'),   onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GridViewBuilderScreen())); } ),
            ListTile(title: Text('GridViewCountScreen'),   onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GridViewCountScreen())); } ),
            ListTile(title: Text('DataTableScreen'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => DataTableScreen())); } ),
            ListTile(title: Text('TabBarWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => TabBarWidget())); } ),
            ListTile(title: Text('ListTileWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => ListTileWidget())); } ),
            ListTile(title: Text('RadioListTileWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => RadioListTileWidget())); } ),

            ListTile(title: Text('StackWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => StackWidget())); } ),
            SizedBox(
              height: 300,
              child: ListView.builder(itemCount: 5,
                itemBuilder: (context,i){

                return SizedBox(height: 30, child: ListTile(title: Text('Item '+i.toString()),  onTap: () { Navigator.pop(context);  } ));
                },

              ),
            )
          ],
        ), ), );
  }
}
class GridViewBuilderScreen extends StatelessWidget {
  final List<Map> myProducts =
  List.generate(1000, (index) => {"id": index, "name": "Product $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('GridView.builder Widget')),
    body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, ),
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return Card(child: Text(myProducts[index]["name"]));
            })));
  }
}
class GridViewCountScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('GridView.count Widget')),
        body: GridView.count(
          crossAxisCount: 3,
          children: [
            Card(child: Text("He'd have you all unravel ")),
            Card(child: Text('Heed not the rabble')),
            Card(child: Text('Sound of screams but the')),
            Card(child: Text('Who scream')),
            Card(child: Text('Revolution is coming...')),
            Card(child: Text('Revolution, they...')),
          ],
        ));
  }
}
class DataTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     // Generate a list of fiction prodcts
    final List<Map> _products = List.generate(30, (i) {
      return {"id": i, "name": "Product $i", "price": Random().nextInt(200) + 1};
    });

      return Scaffold(
        appBar: AppBar(title: const Text('DataTable Widget')),
    body: Container(
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
          )));
    }

  }

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(initialIndex: 1,length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text:'xxxx',icon: Icon(Icons.cloud_outlined)),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
            ], ),),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Text('It\'s cloudy here')),
            Center(child: Text('It\'s rainy here')),
            Center(child: Text('It\'s sunny here') ),
          ])));}}

class ListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      ) ] ) ));
  }}

  class RadioListTileWidget extends StatefulWidget {
    @override
    _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
  }
  
  class _RadioButtonWidgetState extends State<RadioListTileWidget> {
    @override
    String _character = '';
    TextEditingController nameController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: const Text('TabBar Widget')),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Selected Answer: ' + _character.toString()),
                Text('Textbox text: ' + nameController.text),
                RadioListTile(title: const Text('aaaa'),
                  value: 'a',
                  groupValue: _character,
                  onChanged: (String value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile(title: const Text('bbbbbb'),
                  value: 'b',
                  groupValue: _character,
                  onChanged: (String value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),

                SizedBox(height: 30,)
                ,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Theme(data: new ThemeData(
                    primaryColor: Colors.blueAccent,
                    primaryColorDark: Colors.blue,),
                    child: new TextField(
                      decoration: new InputDecoration(
                                                      border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.teal)),
                                                      hintText: 'hint Text',
                                                      helperText: 'helper Text',
                                                      labelText: 'label Text',
                                                      prefixIcon: const Icon(Icons.person, color: Colors.blue,),
                                                      prefixText: ' ',
                                                      suffixText: 'USD',
                                                      suffixStyle: const TextStyle(color: Colors.blue)),
                      controller: nameController,
                    ),),
                ),

                SizedBox(height: 30,),

                SizedBox(width: 300,
                    child: ElevatedButton.icon(
                      label: Text('Submit'),
                      icon: Icon(Icons.web),
                      onPressed: () {
                        print('Pressed');
                      },
                    )),


                SizedBox(height: 10,),


                SizedBox(width: 300,
                    child: ElevatedButton(
                      child: Text('Reset'),
                      onPressed: () {
                        print('Pressed');
                      },
                    )),


                SizedBox(width: 300,
                    child: OutlinedButton(
                      child: Text('AlertDialog'),
                      onPressed: () { print('help...........................');
                      showDialog(context: context,builder:(_)=> dialogWidget() );
                      },
                    )),


                SizedBox(width: 300,
                  child: OutlinedButton.icon(
                    label: Text('Exit'),
                    icon: Icon(Icons.web),
                    onPressed: () {
                      var snackBar = SnackBar(content: Text('Textbox value='+nameController.text));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ),


              ],
            ),
          ));
    }
  }
  class dialogWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content:Text('AlertDialog content'),
        actions: <Widget>[
          TextButton(
            child: Text('ok'),
            onPressed: () { Navigator.of(context).pop(); },
          ),
        ],
      );
    }
  }

  
class StackWidget extends StatelessWidget {
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

  final locations = [
    Location(text: 'New York',timing: '10:44 am',temperature: 15, weather: 'Cloudy',imageUrl: 'https://i.ibb.co/df35Y8Q/2.png',),
    Location(text: 'San Francisco', timing: '7:44 am', temperature: 6, weather: 'Raining', imageUrl: 'https://i.ibb.co/7WyTr6q/3.png',),
  ];

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



