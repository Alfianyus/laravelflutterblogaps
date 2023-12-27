import 'package:blogapp/constants/constants.dart';
import 'package:blogapp/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({
    super.key,
    required this.posts,
  });

  final PostModel posts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage('$postImageurl${posts.image}'),
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
                  posts.createdAt.toIso8601String(),
                  style: GoogleFonts.workSans(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  posts.title,
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
