void main() {
  final library = Library();

  library.addBook(Book(title: '1984', author: 'George Orwell', price: 15.99));
  library.addBook(Book(title: 'The Hobbit', author: 'J.R.R. Tolkien', price: 20.00, isBorrowed: true));
  library.addBook(Book(title: 'Dune', author: 'Frank Herbert', price: 18.50));
  library.addBook(Book(title: 'Fahrenheit 451', author: 'Ray Bradbury', price: 12.25));

  print('Available Books');
  for (var book in library.getAvailableBooks()) {
    print(book);
  }

  print('\nTotal Library Collection Value: \$${library.getTotalValue().toStringAsFixed(2)}');
}

class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });

  @override
  String toString() => '$title by $author (\$$price)';
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => !book.isBorrowed).toList();
  }

  double getTotalValue() {
    return _books.fold(0.0, (sum, book) => sum + book.price);
  }
}

/**  
 * git add hw3.dart
 * git status
 * git commit -m "Added hw3.dart"
 * git push
**/