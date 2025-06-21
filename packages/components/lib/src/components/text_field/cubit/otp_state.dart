/// OTP State representation
class OTPState {
  final List<String> digits;
  final int currentIndex;
  final String? error;
  final bool isCompleted;
  final bool isLoading;

  const OTPState({
    required this.digits,
    this.currentIndex = 0,
    this.error,
    this.isCompleted = false,
    this.isLoading = false,
  });

  /// Get the complete OTP string
  String get otpValue => digits.join();

  /// Check if OTP has any digits
  bool get hasValue => digits.any((digit) => digit.isNotEmpty);

  OTPState copyWith({
    List<String>? digits,
    int? currentIndex,
    String? error,
    bool? isCompleted,
    bool? isLoading,
  }) {
    return OTPState(
      digits: digits ?? this.digits,
      currentIndex: currentIndex ?? this.currentIndex,
      error: error,
      isCompleted: isCompleted ?? this.isCompleted,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OTPState &&
          runtimeType == other.runtimeType &&
          digits.toString() == other.digits.toString() &&
          currentIndex == other.currentIndex &&
          error == other.error &&
          isCompleted == other.isCompleted &&
          isLoading == other.isLoading;

  @override
  int get hashCode =>
      digits.hashCode ^
      currentIndex.hashCode ^
      error.hashCode ^
      isCompleted.hashCode ^
      isLoading.hashCode;
}
