import 'package:acupad/component/patient_card_list_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFFFFFFF),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
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
                              fontSize: 16.0,
                            ),
                          ),
                          Text("Status : Checked In"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              "Pasien Berikutnya",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 18.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFFFFFFF),
                ),
                child: const Column(
                  children: [
                    Text(
                      "Mamang Resing",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    Text("Status Pasien :"),
                    Text(
                      "Gawat Darurat",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    Text("Penanganan Terakhir :"),
                    Text("12.00 AM"),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          PatientCardListItem(),
                          PatientCardListItem(),
                          PatientCardListItem(),
                          PatientCardListItem(),
                          PatientCardListItem(),
                          PatientCardListItem(),
                          PatientCardListItem(),
                          PatientCardListItem(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
