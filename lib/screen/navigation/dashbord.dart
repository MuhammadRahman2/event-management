import 'package:event/screen/navigation/notifications.dart';
import 'package:event/screen/navigation/profile.dart';
import 'package:event/widgets/circle_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../widgets/grid_event.dart';

class DashBord extends StatefulWidget {
  const DashBord({super.key});

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  final ref = FirebaseDatabase.instance.ref('event');


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(
        child: Stack(
          children: [
            const CirlceContainer(),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'DashBoard',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                  ),
                  Row(
                    children: const [
                      Text(
                        'All',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(
                        width: 5,
                      ),
                     Text(
                        'Event',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 195, 240, 1),
                        ),
                      ),
                     
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: StreamBuilder(
                      stream: ref.onValue,
                      builder:
                          (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasData) {
                          return GridView.builder(
                            itemCount: snapshot.data!.snapshot.children.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) {
                              Map<dynamic, dynamic> map =
                                  snapshot.data!.snapshot.value as dynamic;
                              List<dynamic> list = [];
                              list = map.values.toList();
                              return GridEvent(
                                nodeId: list[index]['node'],
                                imageUrl:list[index]['imageURL'],
                                ename: list[index]['name'],
                                date: list[index]['date'],
                                
                                
                              );

                              // return ListTile(
                              //   title: Text(list[index]['ename'].toString()),
                              // );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('Some thing is wrong'),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
