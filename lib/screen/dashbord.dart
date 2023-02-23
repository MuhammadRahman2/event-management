import 'package:event/widgets/circle_container.dart';
import 'package:flutter/material.dart';

import '../widgets/grid_event.dart';

class DashBord extends StatelessWidget {
  const DashBord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/Event.jpg',
                        ),
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Upcoming Event',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_circle_left_outlined,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ]),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5),
                      itemBuilder: (context, index) {
                        return const GridEvent(
                          title: 'Music Night',
                          imageUrl:
                              'https://img.freepik.com/free-vector/music-event-poster-with-photo-2021_52683-42065.jpg?w=740&t=st=1675012054~exp=1675012654~hmac=321d065671621404a67c224d1b6c719c9546cec3a67b237ce708372b3f16668d',
                        );
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
