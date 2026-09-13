/// Static metadata for every link used across the site (socials, resume, email).
class AppLinks {
  const AppLinks({
    required this.github,
    required this.linkedin,
    required this.leetcode,
    required this.resume,
    required this.mailto,
    required this.location,
    required this.email,
  });

  final String github;
  final String linkedin;
  final String leetcode;
  final String resume;
  final String mailto;
  final String location;
  final String email;
}