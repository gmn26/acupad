import 'package:flutter/material.dart';

class PatientCardListItem extends StatelessWidget{
  const PatientCardListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF000000),
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
                  "Halo, Ghazy Muhari Novrial!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text("Status : Checked In",
                  style: TextStyle(
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