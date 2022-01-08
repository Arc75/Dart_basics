class User {
  String email = "";

  User(this.email);
}

class AdminUser extends User with UserTools {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

class UserTools {
  String getMailSystem(String email) {
    var regex = RegExp("\\w+[.]\\w+");

    final result = regex.firstMatch(email)?.group(0);

    return result ?? "";
  }
}

class UserManager<T extends User> {
  final userList = List.empty(growable: true);

  void addUser(User user) {
    userList.add(user);
  }

  void removeUser(String email) {
    var user = userList.firstWhere((user) => (user as User).email == email);
    
    if (user == null) {
      return;
    }

    userList.remove(user);
  }

  String printUsersEmails() {
    var result = List.empty(growable: true);

    for (var user in userList) {
      if (user is AdminUser) {
        result.add(user.getMailSystem(user.email));
      } else if (user is User) {
        result.add(user.email);
      }
    }

    return result.join(',');
  }
}
