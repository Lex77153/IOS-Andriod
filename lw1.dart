void main() {
  processOrder(
    orderId: 'ORD-001',
    itemPrice: 2500.0,
  );
  processOrder(
    orderId: 'ORD-002',
    itemPrice: 10000.0,
    promoCode: 'SAVE10',
    deliveryFee: 200.0,
  );
}

double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  final double discount = (promoCode == 'SAVE10') ? (itemPrice * 0.10) : 0.0;
  final double discountedPrice = itemPrice - discount;
  final double effectiveDeliveryFee = deliveryFee ?? 500.0;

  final double finalTotal = discountedPrice + effectiveDeliveryFee;

  print('Order Summary [$orderId]');
  print('Item Price:   ₸${itemPrice.toStringAsFixed(2)}');
  if (discount > 0) {
    print('Discount:   -₸${discount.toStringAsFixed(2)}');
  }
  print('Delivery Fee: ₸${effectiveDeliveryFee.toStringAsFixed(2)}');
  print('-----------------------------');
  print('Final Total:  ₸${finalTotal.toStringAsFixed(2)}\n');
  return finalTotal;
}