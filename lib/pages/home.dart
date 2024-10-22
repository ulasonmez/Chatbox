import 'package:chatbox/pages/incoming_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.message), label: "Message"),
          NavigationDestination(icon: Icon(Icons.call), label: "Calls"),
          NavigationDestination(icon: Icon(Icons.contacts), label: "Contacts"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 70, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white)),
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:
                          AssetImage('assets/home_screen/profile_picture.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.orange, width: 1.0),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/home_screen/profile_picture.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Ulaş",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.notifications,
                          spacing: 10,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.delete,
                          spacing: 1,
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IncomingCallPage()),
                        );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 25, bottom: 20, right: 25),
                        height: 70,
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 1.0),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/home_screen/profile_picture.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Alex Linderson",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 24),
                                ),
                                Text(
                                  "How are you today?",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Spacer(
                              flex: 9,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("2 min ago"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(
                              flex: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
