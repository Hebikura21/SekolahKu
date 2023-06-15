import 'package:apk_23/home/photo.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
   Info({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 82, 149),
        centerTitle: true,
        title: const Text('Account Info'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 30),
            const Square(imagePath: 'lib/images/Pria.png'),
            const SizedBox(height: 30),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(Icons.contacts),
                SizedBox(width: 50),
                Text(
                  "HK? ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(Icons.trending_up_sharp),
                SizedBox(width: 50),
                Text(
                  "SMK Jurusan Teknik Komputer Jaringan",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(Icons.my_location),
                SizedBox(width: 50),
                Text(
                  "Cloppenburg (Lower Saxony)",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(Icons.label),
                SizedBox(width: 50),
                Text(
                  "Pria",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(Icons.phone),
                SizedBox(width: 50),
                Text(
                  "66589771554",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(Icons.monitor_heart),
                SizedBox(width: 50),
                Text(
                  "Menggambar",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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
