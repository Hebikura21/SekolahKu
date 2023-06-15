import 'package:apk_23/home/database.dart';
import 'package:apk_23/home/form_models.dart';
import 'package:apk_23/nav.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum ProductTypeEnum  { Pria, Wanita }

class UpdateScreen extends StatefulWidget {
  final FormModel? formModel;
  const UpdateScreen({Key? key, this.formModel}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreen();
}

class _UpdateScreen extends State<UpdateScreen> {
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

  @override
  void dispose() {
    _leftController.dispose();
    _rightController.dispose();
    super.dispose();
  }

  Future _refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    print(widget.formModel!.id!);
    databaseinstace = Databaseinstace();
    _leftController.text = widget.formModel!.namadepan ?? '';
    _rightController.text = widget.formModel!.namabelakang ?? '';
    _nomorHp.text = widget.formModel!.nohp ?? '';
    String gender = widget.formModel!.gender ?? '';
    _productTypeEnum = gender == 'Pria' ? ProductTypeEnum.Pria : ProductTypeEnum.Wanita;
    selectedValue =  widget.formModel!.jenjang; '';
    _isChecked = widget.formModel!.hobi!.split(',');
    _alamat.text = widget.formModel!.alamat ?? '';
    super.initState();
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
        backgroundColor: Colors.blue,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MyHomePage();
                },
              ));
            }),
        title: const Text('Update Siswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            _updateText(val);
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
              const SizedBox(height: 20),
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
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await databaseinstace.update(widget.formModel!.id!,{
            "namadepan": _leftController.text,
            "namabelakang": _rightController.text,
            "noHP": _nomorHp.text,
            "gender":
                _productTypeEnum == ProductTypeEnum.Pria ? 'Pria' : 'Wanita',
            "jenjang": selectedValue,
            "hobi": _isChecked.join(','),
            "alamat": _alamat.text,
          });
          // ignore: use_build_context_synchronously
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MyHomePage();
          },));
          _refresh();
          setState(() {});
        }, 
        child: const Icon(Icons.save),
      ),
    );
  }
}
