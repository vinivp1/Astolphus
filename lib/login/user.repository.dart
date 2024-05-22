import 'package:get/get.dart';
import '../models/user.model.dart';
import '../models/password.model.dart';


class UserRepository extends GetConnect{
  Future<List<User>> getUserList()async{

    List<User> userList = [];

    var path = 'https://flasktest-f17y.onrender.com/login?argumentos=';

    final response = await get(path);

    final users = response.body;

    for(Map user in users){
      User u = User.fromJson(user);

      userList.add(u);
    }

    return userList;
  }
}

class PasswordRepository extends GetConnect{
  Future<List<Password>> getPasswordList()async{

    List<Password> passwordList = [];

    var path = 'https://flasktest-f17y.onrender.com/login?argumentos=';

    final response = await get(path);

    final passwords = response.body;


    for(Map password in passwords){
      Password u = Password.fromJson(password);

      passwordList.add(u);
    }

    return passwordList;
  }
}
