void miniMaxSum(List<int> arr) {
  // Sort the array in ascending order
  arr.sort();

  // Calculate the minimum sum by summing the first four elements
  int minSum = arr[0] + arr[1] + arr[2] + arr[3];

  // Calculate the maximum sum by summing the last four elements
  int maxSum = arr[1] + arr[2] + arr[3] + arr[4];

  // Print the minimum and maximum sums
  print('$minSum $maxSum');
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5];
  miniMaxSum(arr);
}
