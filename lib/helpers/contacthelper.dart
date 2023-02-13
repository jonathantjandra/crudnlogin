import 'dart:async';

import './dbfunc.dart';
import '../data_models/contacts.dart';

class UserService {
  late Repository _repository;
  UserService() {
    _repository = Repository();
  }
  //Save User
  SaveUser(Contacts contacts) async {
    return await _repository.insertData('contacts', contacts.userMap());
  }

  //Read All Users
  readAllUsers() async {
    return await _repository.readData('contacts');
  }

  //Edit User
  UpdateUser(Contacts contacts) async {
    return await _repository.updateData('contacts', contacts.userMap());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('contacts', userId);
  }
}
