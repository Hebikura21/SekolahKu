class FormModel{
  int? id;
  String? namadepan, namabelakang, nohp, gender, jenjang, hobi, alamat;

  FormModel({this.id, this.namadepan, this.namabelakang, this.nohp, this.gender, this.jenjang, this.hobi, this.alamat});

  factory FormModel.formJson(Map<String, dynamic> json) {
    return FormModel(
      id: json['id'],
      namadepan: json['namadepan'],
      namabelakang: json['namabelakang'],
      nohp: json['nohp'],
      gender: json['gender'],
      jenjang: json['jenjang'],
      hobi: json['hobi'],
      alamat: json['alamat'],
    );
  }
}