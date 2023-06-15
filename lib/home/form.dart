import 'package:apk_23/home/database.dart';
import 'package:apk_23/nav.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum ProductTypeEnum { Pria, Wanita }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final TextEditingController _leftController = TextEditingController();
  final TextEditingController _rightController = TextEditingController();
  Databaseinstace databaseinstace = Databaseinstace();
  final _nomorHp = TextEditingController();
  ProductTypeEnum? _productTypeEnum;
  var _productName;
  var _alamatName;
  String? selectedValue;
  List<String> _isChecked = [];
  final _alamat = TextEditingController();
  String _namadepan = '';
  String _namabelakang = '';
  final _formState = GlobalKey<FormState>();
  String _namadepanbaru = '';
  String _namabelakangbaru = '';
  String _noHpbaru = '';

  @override
  void dispose() {
    _leftController.dispose();
    _rightController.dispose();
    super.dispose();
  }

  void _updateText(val) {
    setState(() {
      _productName = _leftController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 82, 149),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MyHomePage();
                },
              ));
            }),
        title: const Text('Buat Siswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formState,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return "Tidak Boleh Kosong";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value == _namadepanbaru)
                            setState(() {
                              _namadepanbaru = value;
                            });
                        },
                        controller: _leftController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nama Depan',
                          hintText: 'Ketik di sini',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _rightController,
                        validator: (value) {
                          if (value == '') {
                            return "Tidak Boleh Kosong";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value == _namabelakangbaru)
                            setState(() {
                              _namabelakangbaru = value;
                            });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nama Belakang',
                          hintText: 'Ketik di sini',
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 2),

              // No Hp
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return "Tidak Boleh Kosong";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value == _noHpbaru)
                      setState(() {
                        _noHpbaru = value;
                      });
                  },
                  keyboardType: TextInputType.number,
                  controller: _nomorHp,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nomer HP',
                    hintText: 'Ketik Di sini',
                  ),
                ),
              ),

              const SizedBox(height: 10),
              // Jenis Kelamin
              Row(
                children: const [
                  Text(
                    'Jenis Kelamin',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              // radio button
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                        value: ProductTypeEnum.Pria,
                        groupValue: _productTypeEnum,
                        title: Text(ProductTypeEnum.Pria.name),
                        onChanged: (val) {
                          setState(() {
                            _productTypeEnum = val;
                          });
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        value: ProductTypeEnum.Wanita,
                        groupValue: _productTypeEnum,
                        title: Text(ProductTypeEnum.Wanita.name),
                        onChanged: (val) {
                          setState(() {
                            _productTypeEnum = val;
                          });
                        }),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              // dropdown
              DropdownButton(
                value: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                hint: Text('Jenjang'),
                isExpanded: true,
                items: const [
                  DropdownMenuItem(child: Text("SD"), value: "SD"),
                  DropdownMenuItem(child: Text("SMP"), value: "SMP"),
                  DropdownMenuItem(child: Text("SMA/SMK"), value: "SMA/SMK"),
                  DropdownMenuItem(child: Text("KULIAH"), value: "KULIAH"),
                ],
              ),
              const SizedBox(height: 20),
              // checkbox
              Row(
                children: const [
                  Text(
                    'Hobi',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              // checkbox
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CheckboxListTile(
                    title: const Text('Membaca'),
                    value: _isChecked.contains('Membaca'),
                    onChanged: (checked) {
                      setState(() {
                        if (checked!) {
                          _isChecked.add('Membaca');
                        } else {
                          _isChecked.remove('Membaca');
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    title: const Text('Menulis'),
                    value: _isChecked.contains('Menulis'),
                    onChanged: (checked) {
                      setState(() {
                        if (checked!) {
                          _isChecked.add('Menulis');
                        } else {
                          _isChecked.remove('Menulis');
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    title: const Text('Menggambar'),
                    value: _isChecked.contains('Menggambar'),
                    onChanged: (checked) {
                      setState(() {
                        if (checked!) {
                          _isChecked.add('Menggambar');
                        } else {
                          _isChecked.remove('Menggambar');
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _alamat,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Ketik di sini',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 82, 149),
        onPressed: (_namadepanbaru.isNotEmpty |
                _namabelakangbaru.isNotEmpty ||
                _noHpbaru.isNotEmpty)
            ? null
            : () async {
                if (_formState.currentState!.validate()) {
                  _formState.currentState!.save();
                  await databaseinstace.insert({
                    "namadepan": _leftController.text,
                    "namabelakang": _rightController.text,
                    "noHP": _nomorHp.text,
                    "gender": _productTypeEnum == ProductTypeEnum.Pria
                        ? 'Pria'
                        : 'Wanita',
                    "jenjang": selectedValue,
                    "hobi": _isChecked.join(','),
                    "alamat": _alamat.text,
                  });
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  setState(() {});
                }
              },
        child: const Icon(Icons.save),
      ),
    );
  }
}
