import 'package:test/test.dart';
import '../lib/utils/utils.dart';

void main() {
  group('Dates', () {
    test('Date should be 10 chars long (only date)', () {
      expect(Utils.getDate(true).length, 10);
    });

    test('Date should be 19 chars long (only date)', () {
      expect(Utils.getDate(false).length, 19);
    });
  });
}
