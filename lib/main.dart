import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

//---------
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'  show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
//---------
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
  _launch(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Not supported");
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Drawer Demo';
    return  Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: //Center(child: Text('Demo')),
      SingleChildScrollView(
        child: Column(
          children: [
          Card(
          color: Colors.blue,
          child:Padding(padding: const EdgeInsets.all(8.0),
            child: Text('Data entry form to collect all needed information to create apointment',style: TextStyle(color: Colors.white,fontSize:20)),
          )),
            Card(
              color: Colors.yellow,
              child: ListTile(
                  leading : Icon(Icons.arrow_forward_ios),
                  title : TextFormField(
                    keyboardType : TextInputType.multiline,
                    maxLines : 2,
                    decoration : InputDecoration(hintText : "Title"),
                    //controller : _contentEditingController,
                  )
              ),
            ),
            Card(
              color: Colors.pink,
              child: ListTile(
                  leading : Icon(Icons.content_paste),
                  title : TextFormField(
                                          keyboardType : TextInputType.multiline,
                                          maxLines : 8,
                                          decoration : InputDecoration(hintText : "Content"),
                                          //controller : _contentEditingController,
                                      )
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: FittedBox(fit: BoxFit.fill,
                child: Image.network('https://i.ibb.co/df35Y8Q/2.png')) ),

            InkWell(
              onTap: () async { },
              child: Chip(
                  avatar : CircleAvatar(backgroundImage : AssetImage("img/ron.jpg")),
                  backgroundColor : Colors.grey.shade300,
                  label : Text("Active Status")
              ),
            ),

            ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://i1.wp.com/codesundar.com/avicon.png")),
              title: Text("Rafie Tarabay"),
              subtitle: Text("eng_rafie@mans.edu.eg"),
              trailing: PopupMenuButton(
                  onSelected : (String result) { print(result); },
                  itemBuilder : (BuildContext context) => [
                    PopupMenuItem(value : "copy", child : Text("Copy")),
                    PopupMenuItem(value : "cut", child : Text("Cut") ),
                    PopupMenuItem(value : "paste", child : Text("Paste")  )
                  ]
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home Tel"),onTap: (){_launch('tel:+919952313535');},),
            ListTile(leading: Icon(Icons.grid_on), title: Text("Website"),onTap: (){_launch('https://google.com');}),
            ListTile(leading: Icon(Icons.contacts), title: Text("Contact Us (SMS)"),onTap: (){_launch('sms:+919952313535');}),

            ListTile(title: Text('myCustomCalander'),   onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => myCustomCalander())); } ),
            ListTile(title: Text('stepperWidget'),   onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => stepperWidget())); } ),
            ListTile(title: Text('ListView_builderWidget'),   onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListView_builderWidget())); } ),
            ListTile(title: Text('GridViewBuilderScreen'),   onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GridViewBuilderScreen())); } ),
            ListTile(title: Text('GridViewCountScreen'),   onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GridViewCountScreen())); } ),
            ListTile(title: Text('DataTableScreen'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => DataTableScreen())); } ),
            ListTile(title: Text('TabBarWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => TabBarWidget())); } ),
            ListTile(title: Text('AppBar_leading_actions_bottom_TabBar'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => AppBar_leading_actions_bottom_TabBar())); } ),
            ListTile(title: Text('BottomNavigationBarWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => BottomNavigationBarWidget())); } ),
            ListTile(title: Text('ListTileWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => ListTileWidget())); } ),
            ListTile(title: Text('AlertDialog_SnackBar_Button'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => AlertDialog_SnackBar_Button())); } ),
            ListTile(title: Text('RadioListTileWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => RadioListTileWidget())); } ),
            ListTile(title: Text('TextFormField_vs_TextField_Widget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => TextFormField_vs_TextField_Widget())); } ),
            ListTile(title: Text('HTTPloadData'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => HTTPloadData())); } ),
            ListTile(title: Text('FormWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => FormWidget())); } ),
            ListTile(title: Text('StackWidget'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => StackWidget())); } ),
            ListTile(title: Text('Exam'),  onTap: () {  Navigator.push(context, MaterialPageRoute( builder: (context) => Exam())); } ),

          ],
        ), ), );
  }
}
class ListView_builderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title:Text('ListView_builderWidget')) ,

          body:ListView.builder(itemCount: 5,
            itemBuilder: (context,i){
              return Text('Item '+i.toString());
            },
          ),
    );
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
class AppBar_leading_actions_bottom_TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("leading_actions_bottom"),
          leading: Icon(Icons.menu),
          backgroundColor: Colors.teal[700],
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () => { }),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () => { })
          ],
          bottom: TabBar(
            indicatorColor: Colors.yellow,
            tabs: <Widget>[
              Tab(text: "Chats", icon:  Icon(Icons.chat)),
              Tab(text: "Groups", icon: Icon(Icons.group)),
              Tab(text: "Settings", icon: Icon(Icons.settings))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text("Chat Tab")),
            Center(child: Text("Group Tab")),
            Center(child: Text("Settings Tab")),
          ],
        ),
      ),
    )
    ;
  }
}

class stepperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("leading_actions_bottom")),
        body: Stepper(
          currentStep: 1,
          steps: [
            Step(
              title: Text("Step 1 title"),
              isActive: true,
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Content for Step 1")
              ),
            ),
            Step(
              title: Text("Step 2 title"),
              isActive: true,
              content: Text("Content for Step 2"),
            ),
          ],
        )

    );
  }
}

//===================================
class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}
class _bottomNavigationBarState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;
  List PagesList = [
    Text('Home Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Settings Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('BottomNavigationBar Example'),
          backgroundColor: Colors.teal
      ),
      body: Center(
        child: PagesList[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:[
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home' ),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {  _selectedIndex = index;  });
          },
      ),
    );
  }
}
//=====================================================
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
//====================================================
class RadioListTileWidget extends StatefulWidget {
    @override
    _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
  }
  class _RadioButtonWidgetState extends State<RadioListTileWidget> {
    @override
    String _character = '';

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: const Text('TabBar Widget')),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Selected Answer: ' + _character.toString()),
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
              ],
            ),
          ));
    }
  }
//==================================================
class TextFormField_vs_TextField_Widget extends StatefulWidget {
  @override
  _TextFormField_vs_TextField_WidgetState createState() => _TextFormField_vs_TextField_WidgetState();
}
class _TextFormField_vs_TextField_WidgetState extends State<TextFormField_vs_TextField_Widget> {
    TextEditingController txtController1 = TextEditingController();
    TextEditingController txtController2 = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: const Text('TextFormFieldWidget')),
      body: Column(children: [



        TextFormField(
          controller: txtController1,
          keyboardType: TextInputType.emailAddress,

          decoration: const InputDecoration(
                 prefix: Text('Prefix'),
                 suffix: Text('Suffix'),
                 border: OutlineInputBorder(),
               ),
        ),


        TextField(
          obscureText: true, //hide txt for pw
          keyboardType: TextInputType.numberWithOptions()
        ),


        TextField(
          controller: txtController2,
          decoration: InputDecoration(
                                          //border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.teal)),
                                          hintText: 'hint Text',
                                          helperText: 'helper Text',
                                          labelText: 'label Text',
                                          prefixIcon: const Icon(Icons.person, color: Colors.blue,),
                                          prefixText: ' ',
                                          suffixText: 'USD',
                                          suffixStyle: const TextStyle(color: Colors.blue)),
        ),

        OutlinedButton.icon(
          label: Text('Show txt value'),
          icon: Icon(Icons.web),
          onPressed: () {
            var snackBar = SnackBar(content: Text('txt value:'+txtController1.text+'---'+txtController2.text));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        )

        ]));
    }
}
//============================================
class HTTPloadData extends StatefulWidget {
  @override
  _HTTPloadDataState createState() => _HTTPloadDataState();
}

class _HTTPloadDataState extends State<HTTPloadData> {

  List _users = [];
  getUsers() async {

    setState(() {
      _users = ['loading'];
    });

    http.get(Uri.parse('https://reqres.in/api/users')).then((res) {
      Map userData = json.decode(res.body);
      setState(() {
        _users = userData["data"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => getUsers(),
          )
        ],
      ),
      body: (_users.length == 0) ? Center(child: Text("No user Found"))
          :(_users.length == 1 && _users[0]=='loading') ? Center(child: CircularProgressIndicator())
          :  ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(_users[index]['avatar'])),
            title: Text(_users[index]['first_name'] + " " +  _users[index]['last_name']),
            subtitle: Text(_users[index]['email']),
          );
        },
      ),
    );
  }
}
//============================================
/*
to add validation to a form
1- Create a Form with a GlobalKey.
2- Add Form Fields with validation logic.
3- Create a button to validate and submit the form.
*/
class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}
class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Form Widget')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      else
                        return null;
                    },
                  ),
                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // submit form
                      }
                    },
                  ),
                ],
              ),
            )));
  }
}
//=============================================
  class AlertDialog_SnackBar_Button extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: const Text('AlertDialog_SnackBar_Button')),
          body: Column(children: [

            ElevatedButton.icon(
              label: Text('ElevatedButton.icon'),
              icon: Icon(Icons.web),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text('ElevatedButton'),
              onPressed: () {},
            ),

            OutlinedButton(
              child: Text('OutlinedButton+AlertDialog'),
              onPressed: () {
                              showDialog(
                                            context: context,
                                            builder: (_) => my_dialogWidget()
                                        );
              },
            ),


            OutlinedButton.icon(
              label: Text('OutlinedButton.icon+SnackBar'),
              icon: Icon(Icons.web),
              onPressed: () {
                              var snackBar = SnackBar(content: Text('Process your request'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
            )
          ]
          ));
    }
  }
  class my_dialogWidget extends StatelessWidget {
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
 //=============================================
class myCustomCalander extends StatelessWidget {
  EventList<Event> myEventList = new EventList<Event>();

  @override
  Widget build(BuildContext context) {
    CalendarCarousel _calendarCarousel = CalendarCarousel<Event>(
      height: 420.0,
      firstDayOfWeek: 6,
      markedDatesMap: myEventList,
      markedDateCustomShapeBorder: CircleBorder( side: BorderSide(color: Colors.pink, width: 2) ),
      onDayPressed: (DateTime date, List<Event> events) {
        print('onDayPressed'+date.toIso8601String());
        events.forEach((event) => print(event.title));
        Event event=new Event(date:date,title:"Vacation");
        if(events.length==0) myEventList.add(date,event);
        else myEventList.removeAll(date);
      },
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("calendar Carousel"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarousel,
              ), //
            ],
          ),
        ));
  }
}
//===================================================
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
//=========================================
final _questions = const [
  {
    'questionText': '1- What\'s your favorite color?',
    'answers': [
      {'text': 'Black', 'score': 10},
      {'text': 'Red', 'score': 5},
      {'text': 'Green', 'score': 3},
      {'text': 'White', 'score': 1},
    ],
  },
  {
    'questionText': '2- What\'s your favorite animal?',
    'answers': [
      {'text': 'Rabbit', 'score': 3},
      {'text': 'Snake', 'score': 11},
      {'text': 'Elephant', 'score': 5},
      {'text': 'Lion', 'score': 9},
    ],
  },
  {
    'questionText': '3- Who\'s your favorite instructor?',
    'answers': [
      {'text': 'a', 'score': 1},
      {'text': 'b', 'score': 1},
      {'text': 'c', 'score': 1},
      {'text': 'd', 'score': 1},
    ],
  },
];

class Exam extends StatefulWidget {
  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  bool done=false;
  @override
  Widget build(BuildContext context) {
    List answers= _questions[Current.currentQindex]['answers'];

    return Scaffold(
        appBar: AppBar(  title: const Text('Exam')  ),
        body: (done)?
             Center(child:Text('Score:'+Current.currentScore.toString()))
             :
             Column( children:
                [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Card(child:Text(_questions[Current.currentQindex]['questionText'])),
                 ),
                  ...answers.map((answer) {
                    return SizedBox(
                      width: double.infinity,
                      child:ElevatedButton(
                          child: Text(answer['text']),
                          onPressed: () {
                            Current.currentScore+=answer['score'];
                            if(Current.currentQindex< _questions.length-1) {
                              setState(() {
                                Current.currentQindex++;
                              });
                            }
                            else
                              {
                                  setState(() {
                                    done=true;
                                  });
                              }
                          }
                      ),
                    );
                  } ).toList()
               ]

             )
    );
  }
}

class Current
{
  static int currentQindex=0;
  static int currentScore=0;
}