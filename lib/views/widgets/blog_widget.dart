import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '25 feb',
                  style: GoogleFonts.workSans(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'How to code tutorial',
                  style: GoogleFonts.workSans(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '50k',
                      style: GoogleFonts.workSans(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.comment),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
