import 'dart:io';

void main() {
  print('Task 1');
  for (int i = 1; i <= 10; i++) {
    for (int j = 1; j <= 10; j++) {
      String product = (i * j).toString().padLeft(4);
      stdout.write('$product');
    }
    print(' ');
  }
  // TASK2
  print('Task 2');
  List<String> datesToTest = [
    '05.09.2026',
    '28.02.2024',
    '28.02.2026',
    '29.02.2026',
    '28.02.2100',
    '31.12.2025',
  ];

  for (String dateStr in datesToTest) {
    List<String> parts = dateStr.split('.');

    if (parts.length != 3) {
      print('$dateStr -> invalid date');
      continue;
    }

    int? day = int.tryParse(parts[0]);
    int? month = int.tryParse(parts[1]);
    int? year = int.tryParse(parts[2]);

    if (day == null ||
        month == null ||
        year == null ||
        month < 1 ||
        month > 12 ||
        day < 1) {
      print('$dateStr -> invalid date');
      continue;
    }
    bool isLeap = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    List<int> daysInMonth = [
      31,
      isLeap ? 29 : 28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
    ];
    if (day > daysInMonth[month - 1]) {
      print('$dateStr -> invalid date');
      continue;
    }
    day++;
    if (day > daysInMonth[month - 1]) {
      day = 1;
      month++;
      if (month > 12) {
        month = 1;
        year++;
      }
    }
    String d = day.toString().padLeft(2, '0');
    String m = month.toString().padLeft(2, '0');
    String y = year.toString().padLeft(4, '0');

    print('$dateStr -> $d.$m.$y');
  }
  // TASK3
  print('Task 3');
  String text = "flutter mobile development";
  int count = 0;
  Set<String> vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};

  for (int i = 0; i < text.length; i++) {
    if (vowels.contains(text[i])) {
      count++;
    }
  }
  print('"$text" -> $count');
  // TASK4
  print('Task 4');
  List<List<int>> testLists = [
    [14, 88, 3, 42, 99, 12, 67],
    [234, 34, 123, 44, 949, 112, 67],
  ];

  for (List<int> numbers in testLists) {
    if (numbers.isEmpty) continue;

    int min = numbers[0];
    int max = numbers[0];

    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] > max) {
        max = numbers[i];
      }
      if (numbers[i] < min) {
        min = numbers[i];
      }
    }
    print('$numbers -> max: $max, min: $min');
  }
  // TASK 5
  print('Task 5');
  List<int> numbersToTest = [3, 6, 1, 2, 17, 25];

  for (int n in numbersToTest) {
    bool isPrime = true;
    if (n <= 1) {
      isPrime = false;
    } else {
      for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) {
          isPrime = false;
          break;
        }
      }
    }
    print('$n -> ${isPrime ? "prime number" : "not prime number"}');
  }
}
