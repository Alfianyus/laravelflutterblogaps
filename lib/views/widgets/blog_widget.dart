import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({
    super.key,
    required this.title,
    required this.image,
    required this.body,
    required this.created_at,
  });

  final String title;
  final String image;
  final String body;
  final String created_at;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
              ),
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
                  created_at,
                  style: GoogleFonts.workSans(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  title,
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
