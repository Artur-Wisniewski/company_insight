import 'package:company_insight_app/core/helpers/text_transformers.dart';
import 'package:test/test.dart';

void main() {
  group('Reduce number of letters in text value', () {
    test('Short value should not be changed', () {
      expect(abbreviationValue(100.0, fractionDigits: 1), '100.0');
    });

    test('Value should have 3 digits after dot', () {
      expect(abbreviationValue(123.3145, fractionDigits: 3), '123.314');
    });

    test('Value should have 2 digits after dot', () {
      expect(abbreviationValue(123.3145, fractionDigits: 2), '123.31');
    });

    test('Value should have K letter at end', () {
      expect(abbreviationValue(1230.3145, fractionDigits: 1), '1.2K');
    });

    test('Value should have M letter at end', () {
      expect(abbreviationValue(1230000.3145, fractionDigits: 1), '1.2M');
    });

    test('Value should have B letter at end', () {
      expect(abbreviationValue(1230000000.3145, fractionDigits: 1), '1.2B');
    });

    test('Value should have T letter at end', () {
      expect(abbreviationValue(1230000000000.3145, fractionDigits: 1), '1.2T');
    });

    test('Value should have T letter at end and value should be larger than one thousand', () {
      expect(abbreviationValue(1230000000000000.3145, fractionDigits: 1), '1230.0T');
    });

    test('Value should have T letter at end and value should be less than one thousand', () {
      expect(abbreviationValue(999900000000000.3145, fractionDigits: 1), '999.9T');
    });

    // TODO - Fix abbreviationValue function to pass this test
    test('Value should have T letter at end and value should be less than one thousand', () {
      expect(abbreviationValue(999999999999999.99999, fractionDigits: 17), '999.99999999999999999T');
    });

    test('Should throw ArgumentException', () {
      expect(() => abbreviationValue(1.1, fractionDigits: -1), throwsA(isA<ArgumentError>()));
    });
  });
}
