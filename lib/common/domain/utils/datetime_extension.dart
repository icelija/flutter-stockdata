import 'package:intl/intl.dart';
import 'package:stockdata/generated/l10n.dart';

extension DateTimeExtension on DateTime {
  String getFullDateString() =>
      DateFormat(S.current.full_date_format).format(this);
}
