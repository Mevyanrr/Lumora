import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class CardInfokesehatan extends StatelessWidget {
  const CardInfokesehatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informasi Kesehatan Bayi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
       SizedBox(height: 12),
        Row(
          children: [
            _HealthCard(),
            SizedBox(width: 12),
            _HealthCard(),
          ],
        ),
      ],
    );
  }
}

class _HealthCard extends StatelessWidget {
  const _HealthCard();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(Icons.child_friendly, size: 40),
            SizedBox(height: 8),
            Text(
              "Nutrisi dan Berat Badan",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              "Berat badan yang seimbang menentukan kesehatan.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text("Lanjutkan"),
            )
          ],
        ),
      ),
    );
  }
}
