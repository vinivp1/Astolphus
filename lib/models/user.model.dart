class User{
  String? email;

  User({this.email});

  User.fromJson(Map<dynamic, dynamic> json){
    email = json[''];
  }
}
