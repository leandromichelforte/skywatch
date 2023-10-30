import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/resources/gifs/gif_paths.dart';

void main() {
  test('should return the correct error gif path', () {
    expect(GifPaths.error, 'assets/gifs/error.gif');
  });
}
