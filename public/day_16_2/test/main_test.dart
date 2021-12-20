import 'package:aoc_day12/packet_decoder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Test cases ',
    () {
      test(
        'Example A',
        () {
          final puzzle = PacketDecoder('C200B40A82');
          final result = puzzle();
          expect(result, 3);
        },
      );
      test(
        'Example b',
        () {
          final puzzle = PacketDecoder('04005AC33890');
          final result = puzzle();
          expect(result, 54);
        },
      );
    },
    // skip: 'currently skipped',
  );
}
