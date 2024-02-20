class BillingAddress {
  String _address;
  String _company;
  String _addressLine2;
  String _city;
  String _postalCode;
  String _state;

  BillingAddress(this._address, this._company, this._addressLine2, this._city, this._postalCode, this._state);

  // Getters
  String get address => _address;
  String get company => _company;
  String get addressLine2 => _addressLine2;
  String get city => _city;
  String get postalCode => _postalCode;
  String get state => _state;

  // Setters
  set address(String newAddress) => _address = newAddress;
  set company(String newCompany) => _company = newCompany;
  set addressLine2(String newAddressLine2) => _addressLine2 = newAddressLine2;
  set city(String newCity) => _city = newCity;
  set postalCode(String newPostalCode) => _postalCode = newPostalCode;
  set state(String newState) => _state = newState;
}