import 'dart:io';
import 'dart:math';

import 'level_controller.dart';

enum Operator { add, sub, mul, div }

String operatorStr(Operator op) {
  switch (op) {
    case Operator.add:
      return "+";
    case Operator.sub:
      return "-";
    case Operator.mul:
      return "x";
    case Operator.div:
      return "/";
  }
}

class Problem {
  final int n1;
  final int n2;
  final Operator op;
  final int result;
  final int level;

  Problem(
      {required this.n1,
      required this.n2,
      required this.op,
      required this.result,
      required this.level});

  @override
  String toString() {
    return '$level,${op.index},$n1,$n2,$result';
  }
}

List<Problem> generateByTwoNums(int n1, int n2) {
  var results = List<Problem>.empty(growable: true);
  n1 = max(n1, n2);
  n2 = min(n1, n2);
  results.add(Problem(
      n1: n1,
      n2: n2,
      op: Operator.add,
      result: n1 + n2,
      level: getLevel(n1, n2, n1 + n2, Operator.add)));
  results.add(Problem(
      n1: n1,
      n2: n2,
      op: Operator.sub,
      result: n1 - n2,
      level: getLevel(n1, n2, n1 - n2, Operator.sub)));
  results.add(Problem(
      n1: n1,
      n2: n2,
      op: Operator.mul,
      result: n1 * n2,
      level: getLevel(n1, n2, n1 * n2, Operator.mul)));
  if (n1 != 0 && n2 != 0) {
    results.add(Problem(
        n1: n1 * n2,
        n2: n2,
        op: Operator.div,
        result: n1,
        level: getLevel(n1 * n2, n2, n1, Operator.div)));
    results.add(Problem(
        n1: n1 * n2,
        n2: n1,
        op: Operator.div,
        result: n2,
        level: getLevel(n1 * n2, n1, n2, Operator.div)));
  }

  return results;
}

void main() {
  const maxNum = 1000; //only 3 digits
  const outputFile = "problems.txt";

  final problems = List<Problem>.empty(growable: true);

  for (int n1 = 0; n1 < maxNum; n1++) {
    for (int n2 = 0; n2 < maxNum; n2++) {
      problems.addAll(generateByTwoNums(n1, n2));
    }
  }

  //filtering the too hard problems
  final List<Problem> goodProblems =
      problems.where((p) => p.level > 0).toList();

  //output the statistics for each level
  final problemsInLevel = Map<int, int>();
  for (final p in goodProblems) {
    problemsInLevel[p.level] = (problemsInLevel[p.level] ?? 0) + 1;
  }

  final file = File(outputFile);

  file.writeAsStringSync(goodProblems.map((p) => p.toString()).join('\n'));

  print('Lines written to the file: $outputFile');
  print(problemsInLevel);
}
