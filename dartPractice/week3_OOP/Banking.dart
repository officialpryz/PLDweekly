class BankAccount {
  String _owner;  // Private variable
  double _balance;  // Private variable

  BankAccount(this._owner, this._balance);

  // Getter for owner
  String get owner => _owner;

  // Getter for balance
  double get balance => _balance;

  // Setter for balance
  set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    } else {
      print("Balance cannot be negative");
    }
  }

  // Method to deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited $amount. New balance: $_balance");
    } else {
      print("Deposit amount must be positive.");
    }
  }

  // Method to withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrew $amount. New balance: $_balance");
    } else {
      print("Insufficient balance or invalid amount.");
    }
  }
}



class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(String owner, double balance, this.interestRate) : super(owner, balance);

  // Method to apply interest to the balance
  void applyInterest() {
    double interest = balance * (interestRate / 100);
    balance += interest;  // Using the setter of parent class
    print("Interest applied: $interest. New balance: $balance");
  }
}

void main() {
  BankAccount account = BankAccount("John Doe", 1000);
  print("Owner: ${account.owner}");
  account.deposit(500);
  account.withdraw(200);
  print("Current Balance: ${account.balance}");

  SavingsAccount savingsAccount = SavingsAccount("Alice", 2000, 5);
  savingsAccount.applyInterest();
}
