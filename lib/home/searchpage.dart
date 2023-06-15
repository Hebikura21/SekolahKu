import 'package:apk_23/home/database.dart';
import 'package:flutter/material.dart';
import 'form_models.dart';
import 'infomurid.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<FormModel>? _searchResults;
  Databaseinstace? databaseinstace;

  void _search() async {
    final results = await databaseinstace!.search(_searchText);
    setState(() {
      _searchResults = results;
    });
  }

  @override
  void initState() {
    databaseinstace = Databaseinstace();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 82, 149),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Cari...",
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
            onSubmitted: (value) {
              _search();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _search();
            },
          ),
        ],
      ),
      body: _searchResults != null
          ? ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _searchResults!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoAkun(
                          snapshot: _searchResults![index],
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      _searchResults![index].gender == 'Pria'
                          ? 'lib/images/Pria.png'
                          : 'lib/images/Wanita.png',
                    ),
                  ),
                  title: Text((_searchResults![index].namadepan ?? '') +
                      ' ' +
                      (_searchResults![index].namabelakang ?? '')),
                  subtitle: Text(_searchResults![index].gender ?? ''),
                  trailing: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_searchResults![index].jenjang ?? '',
                                textAlign: TextAlign.justify),
                          ],
                        ),
                        Text(_searchResults![index].nohp ?? ''),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text("Silakan masukkan kata kunci pencarian"),
            ),
    );
  }
}
