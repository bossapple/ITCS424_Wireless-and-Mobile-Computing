import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Route Demo',
      //TODO 1: Update Route Table HERE
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(
              searchText: '',
            ),
      },
      // Start the app with the "/" named route.
      // The app starts on the FirstScreen widget.
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => const FirstScreen();
            break;
          case '/second':
            builder = (BuildContext context) => const SecondScreen(
                  searchText: '',
                );
            break;
          default:
            builder = (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text('Error - Page not found'),
                  ),
                );
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 100),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Get the value from the text field
                  String searchText = _controller.text;

                  // Navigate to the next screen and pass the search text as an argument
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SecondScreen(searchText: searchText),
                    ),
                  );
                },
              ),
              Expanded(
                child: TextField(
                  controller: _controller, // Set the controller
                  decoration: InputDecoration(
                    hintText: 'Search Your Book',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.mic),
                onPressed: () {
                  // Handle voice search action
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        // search result list

        decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 100),
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Book(
                name: "HARRY POTTER AND THE PHILOSOPHER'S STONE",
                author: "JK Rowling",
                category: "Fantasy Novel",
                image:
                    "https://m.media-amazon.com/images/I/91r0dvXhNGL._AC_UF1000,1000_QL80_.jpg"),
            Book(
                name: "HARRY POTTER AND THE CHAMBER OF SECRETS",
                author: "JK Rowling",
                category: "Fantasy Novel",
                image:
                    "https://m.media-amazon.com/images/I/A15suNB9arL._AC_UF1000,1000_QL80_.jpg"),
            Book(
                name: "Selling Hitler",
                author: "Robert Harris",
                category: "History",
                image:
                    "https://m.media-amazon.com/images/I/81HSjoaF9oL._AC_UF1000,1000_QL80_.jpg"),
            Book(
                name: "กาลครั้งหนึ่งในความฝัน",
                author: "อัญชัน",
                category: "Novel",
                image: "https://api.chulabook.com/images/pid-194265.jpg"),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String searchText;
  const SecondScreen({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 100),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Get the value from the text field
                  String searchText = _controller.text;

                  // Navigate to the next screen and pass the search text as an argument
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SecondScreen(searchText: searchText),
                    ),
                  );
                },
              ),
              Expanded(
                child: TextField(
                  controller: _controller, // Set the controller
                  decoration: InputDecoration(
                    hintText: 'Search Your Book',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.mic),
                onPressed: () {
                  // Handle voice search action
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          // Wrap the children with Column
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Showing results for ',
                children: <TextSpan>[
                  TextSpan(
                    text: searchText,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            //-------------------------
            Container(
              width: 200,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 229, 225, 168),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://m.media-amazon.com/images/I/91r0dvXhNGL._AC_UF1000,1000_QL80_.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(200, 20, 200, 20),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(217, 217, 217, 100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Name: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("HARRY POTTER AND THE PHILOSOPHER'S STONE"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Author: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("JK Rowling"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Book category: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Fantasy Novel"),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top:0,
                  right: 250,
                  
                  
                  child: Row(
                    children: <Widget>[
                      
                      FloatingActionButton(
                        onPressed: () {
                          // Handle like button press
                        },
                        child: Icon(Icons.thumb_up),
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(height: 10),
                      FloatingActionButton(
                        onPressed: () {
                          // Handle dislike button press
                        },
                        child: Icon(Icons.heart_broken),
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Book extends StatelessWidget {
  // search result class
  Book(
      {Key? key,
      required this.name,
      required this.author,
      required this.category,
      required this.image})
      : super(key: key);
  final String name;
  final String author;
  final String category;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      height: 150,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(130, 130, 130, 100),
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 229, 225, 168),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Name: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(this.name),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Author: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(this.author),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Book category: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(this.category),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
