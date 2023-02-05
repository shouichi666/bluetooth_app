import 'package:logger/logger.dart';

/// デバック
void pd(Object? debugText) => Logger().d(debugText ?? 'DEBUG TARGET IS NULL');

/// デバック INFO
void pi(Object debugText) => Logger().i(debugText);

/// デバック ERROR
void pe(Object debugText) => Logger().e(debugText);
