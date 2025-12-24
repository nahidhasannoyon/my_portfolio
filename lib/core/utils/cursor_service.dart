import 'package:my_portfolio/core/utils/cursor_service_stub.dart'
    if (dart.library.js) 'cursor_service_web.dart';

void disableCursor() => disableCursorImpl();
void enableCursor() => enableCursorImpl();
