import 'package:mathbubble/maths/problem_generator.dart';

class Level {
  final int level;
  final String description;

  Level({required this.level, required this.description});
}

/*
- 1 - 10:
- 1: two operands, only add, within 10
- 2: two operands, only add, max 2 digits
- 3: two operands, add and sub, max 2 digits
- 4: two operands, add and sub, max 3 digits
- 5: two operands, mult, 1 digit (times table)
- 6: two operands, div, (times table)
- 7: two operands, mult, 2 digits
- 8: two operands, div, 2 digits
- 9: two operands, mult, 3 digits x 1 digit
- 10: two operands, div, 3 digits division
*/

final AllLevels = [
  Level(level: 1, description: "Addition with 1 digit"),
  Level(level: 2, description: "Addition and Subtraction with 2 digits"),
  Level(level: 3, description: "Addition with 3 digits"),
  Level(level: 4, description: "Addition and Subtraction with 3 digits"),
  Level(level: 5, description: "Multiplication with 1 digit"),
  Level(level: 6, description: "Division with 1 digit"),
  Level(level: 7, description: "Multiplication with 2 digits"),
  Level(level: 8, description: "Division with 2 digits"),
  Level(level: 9, description: "Multiplication with 3 digits"),
  Level(level: 10, description: "Division with 3 digits"),
];

int getLevel(int n1, int n2, int res, Operator op) {
  if (n1 <= 10 && n2 <= 10 && op == Operator.add) {
    return 1;
  } else if (n1 <= 100 &&
      n2 <= 100 &&
      (op == Operator.add || op == Operator.sub)) {
    return 2;
  } else if (op == Operator.add && res < 500) {
    return 3;
  } else if ((op == Operator.add || op == Operator.sub) && res < 100) {
    return 4;
  } else if (n1 < 10 && n2 < 10 && op == Operator.mul) {
    return 5;
  } else if (n1 < 100 && op == Operator.div) {
    return 6;
  } else if (n1 <= 100 && n2 <= 20 && op == Operator.mul) {
    return 7;
  } else if (n1 < 300 && op == Operator.div) {
    return 8;
  } else if (n1 <= 1000 && n2 <= 10 && op == Operator.mul) {
    return 9;
  } else if (n1 <= 1000 && op == Operator.div && res < 10 && res > 0) {
    return 10;
  } else {
    return -1;
  }
}

class LevelController {
  late Map<int, Level> levels;

  LevelController() {
    levels = {for (var l in AllLevels) l.level: l};
  }

  Level? getLevel(int idx) {
    return levels[idx];
  }
}
