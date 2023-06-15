import 'package:apk_23/home/database.dart';
import 'package:apk_23/home/home2.dart';
import 'package:apk_23/home/update.dart';
import 'package:apk_23/icons.dart';
import 'package:apk_23/home/form_models.dart';
import 'package:apk_23/nav.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum ProductTypeEnum { Pria, Wanita }

class InfoAkun extends StatefulWidget {
  const InfoAkun({Key? key, required this.snapshot}) : super(key: key);
  final FormModel snapshot;

  @override
  State<InfoAkun> createState() => _InfoAkun();
}

class _InfoAkun extends State<InfoAkun> {
  Databaseinstace? databaseinstace;

  Future _refresh() async {
    setState(() {});
  }

  Future initDatabase() async {
    await databaseinstace!.database();
    setState(() {});
  }

  @override
  void initState() {
    databaseinstace = Databaseinstace();
    initDatabase();
    super.initState();
  }

  Future delete(int id) async {
    await databaseinstace!.delete(id);
    setState(() {});
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap buttons to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this data?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () async {
                delete(widget.snapshot.id!);
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return MyHomePage();
                  },
                ));
                _refresh();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 82, 149),
        title: Row(
          children: [
            const Expanded(
              child: Text('Info Account'),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return UpdateScreen(formModel: widget.snapshot);
                  },
                ));
                // Logika untuk mengedit data
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              backgroundImage: AssetImage(
                widget.snapshot.gender == 'Pria'
                    ? 'lib/images/Pria.png'
                    : 'lib/images/Wanita.png',
              ),
              radius: 100,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.contacts),
                const SizedBox(width: 50),
                Text(
                  (widget.snapshot.namadepan ?? '') +
                      '' +
                      (widget.snapshot.namabelakang ?? ''),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.trending_up_sharp),
                const SizedBox(width: 50),
                Text(
                  widget.snapshot.jenjang ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.label),
                const SizedBox(width: 50),
                Text(
                  widget.snapshot.gender ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.phone),
                const SizedBox(width: 50),
                Text(
                  widget.snapshot.nohp ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.rocket_launch_rounded),
                const SizedBox(width: 50),
                Text(
                  widget.snapshot.hobi ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.my_location),
                const SizedBox(width: 50),
                Text(
                  widget.snapshot.alamat ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
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
