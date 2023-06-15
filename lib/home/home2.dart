import 'package:apk_23/home/database.dart';
import 'package:apk_23/home/form_models.dart';
import 'package:apk_23/home/infomurid.dart';
import 'package:apk_23/home/searchpage.dart';
import 'form.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.token});
  final String token;

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 82, 149),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SearchPage();
              },));
            },
          )
        ],
        automaticallyImplyLeading: false,
        title: const Text('Sekolah kita'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: databaseinstace != null
            ? FutureBuilder<List<FormModel>>(
                future: databaseinstace!.all(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InfoAkun(
                                      snapshot: snapshot.data![index],
                                    ),
                                  ));
                            },
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                snapshot.data![index].gender == 'Pria'
                                    ? 'lib/images/Pria.png'
                                    : 'lib/images/Wanita.png',
                              ),
                            ),
                            title: Text(
                                (snapshot.data![index].namadepan ?? '') +
                                    ' ' +
                                    (snapshot.data![index].namabelakang ?? '')),
                            subtitle: Text(snapshot.data![index].gender ?? ''),
                            trailing: Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(snapshot.data![index].jenjang ?? '',
                                          textAlign: TextAlign.justify),
                                          
                                    ],
                                  ),
                                  Text(snapshot.data![index].nohp ?? ''),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    );
                  }
                })
            : const Center(
                child: CircularProgressIndicator(color: Colors.green)),
      ),
      floatingActionButton: FloatingActionButton(
         backgroundColor: Color.fromARGB(255, 0, 82, 149),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const MyStatefulWidget();
              },
            ),
          );
          _refresh();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

