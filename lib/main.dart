import 'package:flutter/material.dart';
import 'package:magang_day_1/adddatapage.dart';

import 'apiservices.dart';
import 'userprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _myappState();
}

class _myappState extends State<MyApp> {
  Service serviceAPI = Service();
  late Future<List<UserProfile>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Data'),
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              child: FutureBuilder<List<UserProfile>>(
                future: listData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<UserProfile> isiData = snapshot.data!;
                    return ListView.builder(
                      itemCount: isiData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.person),
                          title: Text(isiData[index].firstName!),
                          subtitle: Text(isiData[index].lastName!),
                          trailing: Container(
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                serviceAPI.deleteData(isiData[index].id!);
                                setState(() {
                                  listData = serviceAPI.getAllData();
                                });
                              },
                            ),
                            // child: InkWell(
                            //     onTap: () {
                            //       serviceAPI
                            //           .deleteData(isiData[index].id!)
                            //           .then((value) {
                            //         setState(() {
                            //           listData = serviceAPI.getAllData();
                            //         });
                            //       });
                            //     },
                            //     child: Icon(Icons.delete)),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ),
          Builder(builder: (context) {
            return Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  //tambahData();
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => adddatapage()),
                    );
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Add Data', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            );
          }),
        ]),
      ),
    );
  }
}
