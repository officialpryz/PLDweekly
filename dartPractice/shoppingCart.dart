import 'dart:math';

void main() {
  List<double> prices = [15.0, 20.0, 5.0, 35.0, 7.5, 50.0];
  
  print('Original prices: $prices');
  
  // Using anonymous function to filter out items under $10
  var filteredPrices = prices.where((price) => price >= 10).toList();
  print('Filtered prices (items \$10 and above): $filteredPrices');
  
  // Calculating total with standard function
  double total = calculateTotal(filteredPrices, taxRate: 0.08);
  print('Total (including 8% tax): \$${total.toStringAsFixed(2)}');
  
  // Applying discount with higher-order function
  var discountedPrices = applyDiscount(filteredPrices, (price) => price * 0.9);
  print('Prices after 10% discount: $discountedPrices');
  
  // Calculating factorial discount
  int itemCount = filteredPrices.length;
  double factorialDiscount = calculateFactorialDiscount(itemCount);
  print('Factorial discount for $itemCount items: ${factorialDiscount.toStringAsFixed(2)}%');
  
  // Applying factorial discount to total
  double finalTotal = total * (1 - factorialDiscount / 100);
  print('Final total after factorial discount: \$${finalTotal.toStringAsFixed(2)}');
}

// Standard function with optional parameter
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double subtotal = prices.reduce((value, element) => value + element);
  return subtotal * (1 + taxRate);
}

// Higher-order function
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function for factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return min(n * calculateFactorialDiscount(n - 1), 50); // Cap discount at 50%
}