import 'package:flutter/material.dart';
import 'package:magang_day_1/main.dart';
import 'package:magang_day_1/userprofile.dart';

import 'apiservices.dart';

class adddatapage extends StatefulWidget {
  @override
  _adddatapageState createState() => _adddatapageState();
}

class _adddatapageState extends State<adddatapage> {
  final _globalKey = GlobalKey<FormState>();
  Service serviceAPI = Service();
  var userProfile = UserProfile(
    '',
    '',
    false,
    0,
    0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carved Rock Fitness'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Form(
                key: _globalKey,
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (currentValue) {
                      if (currentValue!.isEmpty) {
                        return 'First name is required';
                      }
                    },
                    onSaved: (currentValue) {
                      userProfile.firstName = currentValue;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (currentValue) {
                      if (currentValue!.isEmpty) {
                        return 'Last name is required';
                      }
                    },
                    onSaved: (currentValue) {
                      userProfile.lastName = currentValue;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Loyalty Points'),
                    keyboardType: TextInputType.number,
                    validator: (currentValue) {
                      if (int.parse(currentValue!) <= 0) {
                        return 'Loyalty point must be greater than zero';
                      }
                    },
                    onSaved: (currentValue) {
                      userProfile.loyaltyPoints = int.parse(currentValue!);
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(hintText: 'Fitness Goal'),
                    onChanged: (newValue) {},
                    items: [
                      ['Lose weight', 1],
                      ['Build muscle', 2],
                      ['Train for a sport', 3],
                      ['Recreation', 4]
                    ].map((item) {
                      return DropdownMenuItem(
                          child: Text(item[0].toString()), value: item[1]);
                    }).toList(),
                    onSaved: (currentValue) {
                      userProfile.fitnessGoal = currentValue as int?;
                    },
                  ),
                  SwitchListTile(
                    value: userProfile.isActive!,
                    onChanged: (newValue) {
                      setState(() {
                        userProfile.isActive = newValue;
                      });
                    },
                    title: Text('Active'),
                  ),
                  RaisedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        var _message = '';
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();
                          _message = 'to json';
                          serviceAPI.postData(userProfile);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                              (Route<dynamic> route) => false);
                        } else {
                          _message = 'There was an error in the form';
                        }
                        // showDialog(
                        //     context: context,
                        //     builder: (_) {
                        //       return AlertDialog(
                        //         title: Text(userProfile.toJson()),
                        //         content: Text(_message),
                        //         actions: [
                        //           FlatButton(
                        //             child: Text('OK'),
                        //             onPressed: () {
                        //               setState(() {
                        //                 Navigator.push(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                       builder: (context) =>
                        //                           const MyApp()),
                        //                 );
                        //               });
                        //             },
                        //           ),
                        //         ],
                        //       );
                        //     });
                      })
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
