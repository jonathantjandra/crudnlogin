import '../data_models/contacts.dart';
import '../helpers/contacthelper.dart';
import 'package:flutter/material.dart';

class EditCon extends StatefulWidget {
  final Contacts contact;
  const EditCon({Key? key, required this.contact}) : super(key: key);

  @override
  State<EditCon> createState() => _EditConState();
}

class _EditConState extends State<EditCon> {
  var _contactNameController = TextEditingController();
  var _contactMailController = TextEditingController();
  var _contactPhoneController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  var _userService = UserService();

  @override
  void initState() {
    setState(() {
      _contactNameController.text = widget.contact.contactname ?? '';
      _contactMailController.text = widget.contact.contactmail ?? '';
      _contactPhoneController.text = widget.contact.contactnumber ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Demo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit Contact',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _contactNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    errorText: _validateName ? 'Name can\'t be empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _contactMailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter E-mail',
                    labelText: 'E-mail',
                    errorText:
                        _validateContact ? 'E-mail can\'t be empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _contactPhoneController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Phone',
                    labelText: 'Phone Number',
                    errorText: _validateDescription
                        ? 'Phone Number can\'t be empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.lightGreen,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _contactNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _contactMailController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _contactPhoneController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;
                        });
                        if (_validateName == false &&
                            _validateContact == false &&
                            _validateDescription == false) {
                          var _contact = Contacts();
                          _contact.id = widget.contact.id;
                          _contact.contactname = _contactNameController.text;
                          _contact.contactmail = _contactMailController.text;
                          _contact.contactnumber = _contactPhoneController.text;
                          var result = await _userService.UpdateUser(_contact);
                          Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Update Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _contactNameController.text = '';
                        _contactMailController.text = '';
                        _contactPhoneController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
