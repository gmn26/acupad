import 'package:flutter/material.dart';

class PatientCardListItem extends StatelessWidget {
  const PatientCardListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: const Border(
          right: BorderSide(
            color: Color(0xFFDDDDDD),
            width: 1.0,
          ),
          bottom: BorderSide(
            color: Color(0xFFDDDDDD),
            width: 1.0,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          spacing: 12.0,
          children: [
            CircleAvatar(
              radius: 36.0,
              backgroundColor: Color(0XFF000000),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mamang Resing",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "Status : Checked In",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Last Checked : 10.00AM",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
                Text("Next Reminder : 12.00AM",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
