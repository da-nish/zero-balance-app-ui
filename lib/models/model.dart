class Message {
  final UserType user;
  String message;
  bool error;

  Message(this.user, this.message, {this.error = false});
}

enum UserType { Bot, User }
