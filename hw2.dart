void main() {
  print('ATM TERMINAL SIMULATOR\n');
  String userName = 'Alex';
  double userBalance = 500.0;
  //Проверка баланса
  checkBalance(name: userName, balance: userBalance);
  //Пополнение счета (успешно)
  userBalance = deposit(currentBalance: userBalance, amount: 250.0);
  //Пополнение счета с null значением (сработает ?? 0.0)
  userBalance = deposit(currentBalance: userBalance, amount: null);
  //Снятие наличных (неверный PIN-код)
  userBalance = withdraw(
    name: userName,
    currentBalance: userBalance,
    amount: 100.0,
    pinCode: 9999,
  );
  //Снятие наличных (недостаточно средств)
  userBalance = withdraw(
    name: userName,
    currentBalance: userBalance,
    amount: 1000.0,
    pinCode: 1234,
  );
  //Успешное снятие наличных
  userBalance = withdraw(
    name: userName,
    currentBalance: userBalance,
    amount: 200.0,
    pinCode: 1234,
  );
  //Итоговый баланс
  checkBalance(name: userName, balance: userBalance);
}

//Arrow function для проверки баланса
void checkBalance({required String name, required double balance}) => print(
  'User: $name | Current Available Balance: \$${balance.toStringAsFixed(2)}',
);

//Пополнение баланса с обработкой null (??)
double deposit({required double currentBalance, double? amount}) {
  double validAmount = amount ?? 0.0;

  if (validAmount <= 0) {
    print('Deposit declined: Invalid or zero amount.');
    return currentBalance;
  }
  double newBalance = currentBalance + validAmount;
  print('RECEIPT: Successfully deposited \$${validAmount.toStringAsFixed(2)}.');
  print('Updated Balance: \$${newBalance.toStringAsFixed(2)}');
  return newBalance;
}

//Снятие наличных с проверкой PIN-кода и баланса
double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  int enteredPin = pinCode ?? 0000;
  const int correctPin = 1234;
  // Проверка PIN-кода
  if (enteredPin != correctPin) {
    print('TRANSACTION DECLINED: Incorrect PIN code.');
    return currentBalance;
  }
  // Безопасная распаковка суммы
  double validAmount = amount ?? 0.0;
  if (validAmount <= 0) {
    print('TRANSACTION DECLINED: Invalid withdrawal amount.');
    return currentBalance;
  }
  // Проверка достаточности средств
  if (validAmount > currentBalance) {
    print('TRANSACTION DECLINED: Insufficient funds on account.');
    return currentBalance;
  }
  // Успешная транзакция
  double newBalance = currentBalance - validAmount;
  print(
    'TRANSACTION SUCCESSFUL: $name withdrew \$${validAmount.toStringAsFixed(2)}.',
  );
  print('Remaining Balance: \$${newBalance.toStringAsFixed(2)}');
  return newBalance;
}
