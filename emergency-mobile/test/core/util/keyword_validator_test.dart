import 'package:dartz/dartz.dart';
import 'package:emergency/core/util/keyword_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  KeywordValidator keywordValidator;

  setUp(() {
    keywordValidator = KeywordValidator();
  });

  group('validateInvalidKeyword', () {
    test(
      'should return origin string when the string has a valid format', 
      () async {
        // arrange
        final str = 'korea';

        // act
        final result = keywordValidator.validateSearchKeyword(str);

        // assert
        expect(result, Right(str));
      }
    );
  });
}