import 'package:url_launcher/url_launcher.dart';

/// Opens a URL in the system browser. Safe on every platform.
Future<void> openUrl(String url) async {
  final parsed = Uri.tryParse(url);
  if (parsed == null) return;
  // Relative paths (e.g. bundled `resume.pdf`) resolve against the site URL.
  final uri = parsed.hasScheme ? parsed : Uri.base.resolveUri(parsed);
  try {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (_) {
    // Ignore launch failures on unsupported platforms.
  }
}
