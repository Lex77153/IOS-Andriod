void main() {
  final cart = ShoppingCart();

  cart.addItem(EBook(
    id: 'B01',
    title: 'Atomic Habits',
    price: 14.99,
    fileSizeMB: 3.5,
    author: 'James Clear',
  ));

  cart.addItem(Audiobook(
    id: 'A01',
    title: 'Project Hail Mary',
    price: 24.99,
    durationHours: 16.2,
    narrator: 'Ray Porter',
  ));

  cart.addItem(EBook(
    id: 'B02',
    title: 'Deep Work',
    price: 9.99,
    fileSizeMB: 2.1,
    author: 'Cal Newport',
  ));

  cart.printReceipt();

  print('Items Under \$15');
  var affordableItems = cart.filterByMaxPrice(15.00);
  for (var item in affordableItems) {
    print(item.getDetails());
  }
}

abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem({
    required this.id,
    required this.title,
    required this.price,
  });

  String getDetails();
}

mixin Downloadable {
  void download(String title) {
    print('Downloading "$title"...');
  }
}

class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook({
    required String id,
    required String title,
    required double price,
    required this.durationHours,
    required this.narrator,
  }) : super(id: id, title: title, price: price);

  @override
  String getDetails() {
    return '[Audiobook] $title - Narrated by $narrator (${durationHours}h) | \$$price';
  }
}

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook({
    required String id,
    required String title,
    required double price,
    required this.fileSizeMB,
    required this.author,
  }) : super(id: id, title: title, price: price);

  @override
  String getDetails() {
    return '[EBook] $title - By $author (${fileSizeMB}MB) | \$$price';
  }
}

class ShoppingCart {
  final List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  double calculateTotalWithTax({double taxRate = 0.12}) {
    double subtotal = _items.fold(0.0, (sum, item) => sum + item.price);
    return subtotal * (1 + taxRate);
  }

  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items.where((item) => item.price <= maxPrice).toList();
  }

  void printReceipt() {
  print('Receipt');
  for (var item in _items) {
    print(item.getDetails());
    if (item is Downloadable) {
      (item as Downloadable).download(item.title);
    }
    print('');
  }
  double total = calculateTotalWithTax();
  print('Total Price (incl. 12% tax): \$${total.toStringAsFixed(2)}');
}
}





/**  
 * git add hw3.dart
 * git status
 * git commit -m "Added hw3.dart"
 * git push
**/