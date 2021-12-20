import 'passage_pathing.dart';

void main() {
  final puzzle = PassagePathing(input);
  final result = puzzle();
  print('result: $result');
}

final String input = """EO-jc
end-tm
jy-FI
ek-EO
mg-ek
jc-jy
FI-start
jy-mg
mg-FI
jc-tm
end-EO
ds-EO
jy-start
tm-EO
mg-jc
ek-jc
tm-ek
FI-jc
jy-EO
ek-jy
ek-LT
start-mg""";
