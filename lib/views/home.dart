import 'package:blogapp/views/widgets/blog_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Blogs',
                  style: GoogleFonts.workSans(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Blog',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      hintStyle: GoogleFonts.workSans(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BlockWidget(
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                const BlockWidget(
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 10,
                ),
                const BlockWidget(
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 10,
                ),
                const BlockWidget(
                  color: Colors.yellow,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}