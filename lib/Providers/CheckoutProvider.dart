import 'package:flutter/cupertino.dart';

import '../Models/CheckoutModels/BillingAddressModel.dart';
import '../Models/CheckoutModels/MyInfoModel.dart';
import '../Models/CheckoutModels/ShippingModel.dart';

class CheckoutProvider with ChangeNotifier {
  MyInformation _myInformation = MyInformation('', '', '');
  BillingAddress _billingAddress = BillingAddress('', '', '', '', '', '');
  Shipping _shipping = Shipping('', '', '');

  CheckoutProvider();

  // Getters
  MyInformation get myInformation => _myInformation;
  BillingAddress get billingAddress => _billingAddress;
  Shipping get shipping => _shipping;

  // Setters for MyInformation
  set myInformation(MyInformation newInfo) {
    _myInformation = newInfo;
    notifyListeners();
  }

  // Setters for BillingAddress
  set billingAddress(BillingAddress newAddress) {
    _billingAddress = newAddress;
    notifyListeners();
  }

  // Setters for Shipping
  set shipping(Shipping newShipping) {
    _shipping = newShipping;
    notifyListeners();
  }
}