// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math';

/// An indexed position in a String which can read by specified character
/// counts, or read digits up to a delimiter.
class StringIterator {
  final String contents;
  int _index = 0;
  int get index => _index;

  StringIterator(this.contents);

  bool atEnd() => index >= contents.length;

  String next() => contents[_index++];

  /// Return the next [howMany] characters, or as many as there are remaining,
  /// and advance the index.
  String pop([int howMany = 1]) {
    var result = peek(howMany);
    _index += howMany;
    return result;
  }

  /// Returns whether the input starts with [pattern] from the current index.
  bool startsWith(String pattern) => contents.startsWith(pattern, index);

  /// Return the next [howMany] characters, or as many as there are remaining,
  /// without advancing the index.
  String peek([int howMany = 1]) =>
      contents.substring(index, min(index + howMany, contents.length));

  /// Return the remaining contents of the String, without advancing the index.
  String peekAll() => peek(contents.length - index);
}
