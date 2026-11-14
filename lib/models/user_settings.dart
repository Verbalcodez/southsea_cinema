class UserSettings {
  final String address;
  final String email;
  final String patronNumber;
  final bool receiveNewsByEmail;

  const UserSettings({
    this.address = '',
    this.email = '',
    this.patronNumber = '',
    this.receiveNewsByEmail = false,
  });
}
