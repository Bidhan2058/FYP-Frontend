// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_login_signup/models/VehicleData.dart';
import 'package:flutter_login_signup/src/components/editVehicle.dart';
// import 'package:flutter_login_signup/src/components/Roomdetailed.dart';
// import 'package:flutter_login_signup/src/components/appbar.dart';
// import 'package:flutter_login_signup/src/components/editProperty.dart';
import 'package:flutter_login_signup/src/components/settings.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_login_signup/api/getVehicle.dart';
import 'package:http/http.dart' as http;

// class PropertyCarousel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// ignore: must_be_immutable
class ListedVehicles extends StatefulWidget {
  // String startPrice;
  // String endPrice;
  // String search;
  // SearchedRooms({Key key, this.startPrice, this.endPrice, this.search})
  //     : super(key: key);

  // get room => null;
  @override
  _ListedVehiclesState createState() => _ListedVehiclesState();
}

class _ListedVehiclesState extends State<ListedVehicles> {
  List<Data> _vehicle = [];
  bool _loading;
  var session = FlutterSession();

  @override
  void initState() {
    _loading = true;
    super.initState();
    Services.listedVehicle().then((vehicle) {
      setState(() {
        _vehicle = vehicle;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Added Vehicles"),
          backgroundColor: Color.fromRGBO(13, 71, 161, 1)),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Listed Rooms',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  //   print('This is see more');
                  //   Navigator.push(context,
                  //       // MaterialPageRoute(builder: (context) => ListviewPage()));
                  // },
                  child: Text(
                    _vehicle.length.toString() + " results found",
                    style: TextStyle(
                      color: Colors.blueGrey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 650,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            // color: Colors.grey,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _vehicle.length == null ? 0 : _vehicle.length,
              itemBuilder: (BuildContext context, int index) {
                Data vehicle = _vehicle[index];
                return GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               PropertyListsView(room: room)));

                  //   session.set("roomid", room.roomId);
                  //   // session.set("user_id", room.userId);
                  //   print("Room_Id ==>" + room.roomId.toString());
                  //   print("User ==> " + room.userId.toString());
                  // },
                  child: Card(
                    color: Colors.blueGrey[100],
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 15),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                )
                              ]),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(1.0),
                                child: Image(
                                  height: 185.0,
                                  width: 375.0,
                                  image: NetworkImage(vehicle.vehicleImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "For Rent",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 195, 0, 15),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Icon(
                                    Icons.home_filled,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  Text(
                                    " " + vehicle.description,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                    height: 2,
                                    child: Divider(color: Colors.black)),
                                Row(children: [
                                  Icon(
                                    Icons.monetization_on_rounded,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  Text(
                                    " Rs." + vehicle.price.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    Text(
                                      vehicle.address,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // ignore: missing_required_param
                                    IconButton(
                                      splashColor: Colors.green[600],
                                      splashRadius: 53.0,
                                      icon: Icon(
                                        Icons.edit,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        print(vehicle.vehicleID);
                                        session.set('vehicleID', vehicle.vehicleID);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditVehiclepage()));
                                      },
                                      color: Colors.green[600],
                                    ),
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      splashColor: Colors.red[600],
                                      splashRadius: 53.0,
                                      icon: Icon(
                                        Icons.delete,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        session.set("roomid", vehicle.vehicleID);
                                        // print(
                                        //     "roomid" + room.roomId.toString());
                                        _showDialog();
                                        // deleteRoom();
                                      },
                                      color: Colors.red[600],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  deleteRoom() async {
    // String userId = await FlutterSession().get("id");
    String token = await FlutterSession().get("token");
    String roomId = await FlutterSession().get("roomid");
    String url = "http://10.0.2.2:8000/API/deleteVehicle/$roomId";
    var response = await http.delete(
      url,
      headers: {"Content-type": "application/json", "Authorization": "$token"},
    );
    print(response.body);
    if (response.statusCode == 200) {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => SettingsTwoPage()));
    } else {
      print(response);
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert!!"),
          content: new Text("Click button to delete !"),
          titleTextStyle: TextStyle(
              fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
          contentTextStyle: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              splashColor: Colors.blue,
              color: Colors.redAccent,
              child: new Text(
                "Delete",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onPressed: () {
                deleteRoom();
                Navigator.of(context).pop(SettingsTwoPage());
              },
            ),
          ],
        );
      },
    );
  }
}