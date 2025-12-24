import 'dart:js_interop';

@JS('tomJerryCursor')
external TomJerryCursor? get _tomJerryCursor;

extension type TomJerryCursor(JSObject _) implements JSObject {
  external void disable();
  external void enable();
}

void disableCursorImpl() {
  _tomJerryCursor?.disable();
}

void enableCursorImpl() {
  _tomJerryCursor?.enable();
}
