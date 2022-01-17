import 'package:crud_api/User.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// ignore: must_be_immutable
class DetailUser extends StatefulWidget {
  final getUser;

  DetailUser({Key key, this.getUser}) : super(key: key);

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  // Future getUserDetail(id) async {
  //   final url = Uri.parse("https://reqres.in/api/users/" + id);
  //   var result = await http.get(url);
  //   return json.decode(result.body)['data'];
  //   // return id;
  // }

  Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    // futureUser = User.fetchUser(widget.getUser);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              widget.getUser['first_name'] + ' ' + widget.getUser['last_name']),
        ),
        // body: Container(child: Center(child: Text(widget.getUser['first_name']))),

        // body: FutureBuilder<User>(
        //   future: futureUser,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Center(child: Text(snapshot.data.id.toString()));
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text(snapshot.error));
        //     } else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     // return Center(child: CircularProgressIndicator());
        //   },
        // ),

        body: Container(
          color: Colors.grey[200],
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[200], spreadRadius: 2, blurRadius: 7)
                  ]),
              margin: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(widget.getUser['avatar']),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Center(
                            child: Text(widget.getUser['first_name'] +
                                ' ' +
                                widget.getUser['last_name'])),
                        Center(child: Text(widget.getUser['email'])),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
