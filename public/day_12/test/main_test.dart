import 'package:aoc_day12/passage_pathing.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Test cases',
    () {
      test('Small example', () {
        final puzzle = PassagePathing(smallInput);
        final result = puzzle();

        expect(result, 10);
      });
      test('larger example', () {
        final puzzle = PassagePathing(largerInput);
        final result = puzzle();

        expect(result, 19);
      });
      test('largest example', () {
        final puzzle = PassagePathing(largestInput);
        final result = puzzle();

        expect(result, 226);
      });
    },
    // skip: 'currently sipped',
  );
}

final smallInput = """start-A
start-b
A-c
A-b
b-d
A-end
b-end""";
final largerInput = """dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc""";
final largestInput = """fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW""";
