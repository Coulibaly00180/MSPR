class User {
  String email;
  String password;

  User({required this.email, required this.password});
}

class UserService {
  List<User> _users = [
    User(email: 'user1@example.com', password: 'password123'),
    User(email: 'user2@example.com', password: 'mypassword'),
  ];

  User? validateUser(String email, String password) {
    for (var user in _users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }

  // Method to register a new user
  void registerUser(String email, String password) {
    final newUser = User(email: email, password: password);
    _users.add(newUser);
  }
}
