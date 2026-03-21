import 'package:pushup_hub/features/auth/data/models/user_profile.dart';

/// Prénom si présent, sinon partie locale de l’email, sinon repli.
String userProfileDisplayName(UserProfile user) {
  final first = user.firstName?.trim();
  if (first != null && first.isNotEmpty) return first;
  final email = user.email.trim();
  final at = email.indexOf('@');
  if (at > 0) return email.substring(0, at);
  return email.isNotEmpty ? email : 'Athlète';
}
