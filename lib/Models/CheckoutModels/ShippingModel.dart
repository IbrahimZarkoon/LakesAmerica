class Shipping {
  String _shippingTitle;
  String _shippingDays;
  String _shippingPrice;

  Shipping(this._shippingTitle, this._shippingDays, this._shippingPrice);

  // Getters
  String get shippingTitle => _shippingTitle;
  String get shippingDays => _shippingDays;
  String get shippingPrice => _shippingPrice;

  // Setters
  set shippingTitle(String newShippingTitle) => _shippingTitle = newShippingTitle;
  set shippingDays(String newShippingDays) => _shippingDays = newShippingDays;
  set shippingPrice(String newShippingPrice) => _shippingPrice = newShippingPrice;
}