import 'package:aoc_day12/packet_decoder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Test cases',
    () {
      test(
        'Example A',
        () {
          final puzzle = PacketDecoder('8A004A801A8002F478');
          final result = puzzle();
          expect(result, 16);
        },
      );
      test(
        'Example B',
        () {
          final puzzle = PacketDecoder('620080001611562C8802118E34');
          final result = puzzle();
          expect(result, 12);
        },
      );
      test(
        'Example C',
        () {
          final puzzle = PacketDecoder('C0015000016115A2E0802F182340');
          final result = puzzle();
          expect(result, 23);
        },
      );
      test(
        'Example D',
        () {
          final puzzle = PacketDecoder('A0016C880162017C3686B18A3D4780');
          final result = puzzle();
          expect(result, 31);
        },
      );
    },
    // skip: 'currently skipped',
  );
}
