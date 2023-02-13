class Contacts {
  int? id;
  String? contactname;
  String? contactmail;
  String? contactnumber;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['contactname'] = contactname!;
    mapping['contactmail'] = contactmail!;
    mapping['contactnumber'] = contactnumber!;
    return mapping;
  }
}
