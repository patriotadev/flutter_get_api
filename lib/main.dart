import 'package:crud_api/User.dart';
import 'package:crud_api/detail_user.dart';
import 'package:crud_api/slide_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Contact'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  fetchOneUser(context, userId) async {
    Navigator.push(context, SlideRightRoute(page: DetailUser(getUser: userId)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: User.fetchDataUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // List<User> user = snapshot.data;
            // final user = snapshot.data;
            // return Center(
            //     child: Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text("Id : ${user.id}"),
            //       Text("Name : ${user.email}")
            //     ],
            //   ),
            // ));
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    // List<User> user = snapshot.data[index];
                    return Card(
                        margin: EdgeInsets.all(20),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(snapshot.data[index]['avatar']),
                          ),
                          title: Text(snapshot.data[index]['first_name'] +
                              " " +
                              snapshot.data[index]['last_name']),
                          subtitle: Text(snapshot.data[index]['email']),
                          onTap: () =>
                              fetchOneUser(context, snapshot.data[index]),
                        ));
                    // ListTile(
                    //   title: Text(snapshot.data[index]['email'])
                    //   );
                  }),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error));
          }
          return Center(child: Text("Loading..."));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
