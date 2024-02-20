class MyInformation {
  String _email;
  String _firstName;
  String _lastName;

  MyInformation(this._email, this._firstName, this._lastName);

  // Getters
  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;

  // Setters
  set email(String newEmail) => _email = newEmail;
  set firstName(String newFirstName) => _firstName = newFirstName;
  set lastName(String newLastName) => _lastName = newLastName;
}