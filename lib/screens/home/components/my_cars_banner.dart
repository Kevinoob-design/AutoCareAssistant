import 'package:auto_care_assistant/shared/config/constants.dart';
import 'package:flutter/material.dart';

class MyCarsBanner extends StatelessWidget {
  const MyCarsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          customBorder: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            0.5,
          ),
          splashColor: kPrimaryColor.withValues(alpha: 0.1),
          focusColor: kPrimaryColor.withValues(alpha: 0.1),
          highlightColor: kPrimaryColor.withValues(alpha: 0.1),
          hoverColor: kPrimaryColor.withValues(alpha: 0.1),
          onTap: () => Navigator.pushNamed(context, '/my-cars'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.car_repair, color: Color(0xFF4A3298)),
              ),
              title: Text(
                "My Cars",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                "View all my cars",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
