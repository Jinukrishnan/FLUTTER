import 'package:apps/Apps/8_CustomUI/JobCard.dart';
import 'package:flutter/material.dart';

class CustomUI extends StatelessWidget {
  const CustomUI({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> job = [
      ["Apple", "IOS Developer", "lib/icons/1.png", 40],
      ["Face Book", "React Developer", "lib/icons/2.png", 30],
      ["Instagram", "Python Developer", "lib/icons/3.png", 40],
      ["Google", "Flutter Developer", "lib/icons/4.png", 40],
      ["YouTube", "Django Developer", "lib/icons/5.png", 40],
      ["Apple", "IOS Developer", "lib/icons/1.png", 40],
      ["Face Book", "React Developer", "lib/icons/2.png", 30],
      ["Instagram", "Python Developer", "lib/icons/3.png", 40],
      ["Google", "Flutter Developer", "lib/icons/4.png", 40],
      ["YouTube", "Django Developer", "lib/icons/5.png", 40],
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              // menu
              Container(
                child: Icon(
                  Icons.menu_outlined,
                  size: 40,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // header
              Container(
                child: Text(
                  'Discover a New Path',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.black26,
                                offset: Offset(3, 3),
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.white24,
                                offset: Offset(-3, -3),
                              ),
                            ]),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Icon(Icons.search),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search for a Job...",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // for you
              Container(
                child: Text(
                  "For You",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                // color: Colors.green,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: job.length,
                    itemBuilder: (context, index) {
                      return JobCard(
                          comapny: job[index][0],
                          jobTitle: job[index][1],
                          logoImagePath: job[index][2],
                          hourlyRate: job[index][3]);
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "For You",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  height: 180,
                  // color: Colors.green,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: job.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Image.asset(
                              job[index][2],
                              width: 30,
                              height: 30,
                            ),
                          ),
                          title: Text(
                            job[index][1],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            job[index][0],
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green),
                            child: Text(
                              '₹ ${job[index][3].toString()}/h',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
