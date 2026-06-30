class UpdateCheckDateRequest {
  final DateTime lastCheck;

  UpdateCheckDateRequest({required this.lastCheck});

  Map<String, dynamic> toJson() => {
    'last_check_date': lastCheck.toIso8601String(),
  };
}
