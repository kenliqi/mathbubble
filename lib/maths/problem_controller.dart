import 'dart:math';

import 'package:flame/components.dart';
import 'package:mathbubble/maths/problem_generator.dart';

class ProblemController extends Component {
  final String data;
  late Map<int, List<Problem>> problemSet;
  final Random random = Random();

  ProblemController({required this.data}) {
    var map = <int, List<Problem>>{};
    for (String line in data.split('\n')) {
      final List<int> items = line.split(',')
          .map((s) => int.parse(s)!)
          .toList();
      final p = Problem(n1: items[2],
          n2: items[3],
          op: Operator.values[items[1]],
          result: items[4],
          level: items[0]);
      map.putIfAbsent(p.level, () => []).add(p);
    }
    problemSet = map;
  }

  Problem get(int level) {
    int idx = random.nextInt(problemSet[level]!.length);
    return problemSet[level]![idx];
  }

}
