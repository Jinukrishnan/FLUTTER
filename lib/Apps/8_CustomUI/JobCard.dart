import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String comapny;
  final String jobTitle;
  final String logoImagePath;
  final int hourlyRate;
  JobCard(
      {required this.comapny,
      required this.jobTitle,
      required this.logoImagePath,
      required this.hourlyRate});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black54,
      ),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                logoImagePath,
                width: 30,
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Part Time",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Text(
            jobTitle,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            '₹ ${hourlyRate.toString()}/h',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
