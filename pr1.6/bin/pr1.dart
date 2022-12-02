import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("Введите номер задания (1-6): ");
  try {
    switch (int.parse(stdin.readLineSync()!)) {
      case 1:
        taskFirst();
        break;
      case 2:
        taskSecond();
        break;
      case 3:
        taskThird();
        break;
      case 4:
        taskForth();
        break;
      case 5:
        taskFifth();
        break;
      case 6:
        taskSixth();
        break;
      default:
        print("Невозможный номер.");
    }
  } catch (e) {
    print("Неверные данные.");
  }
}

void taskFirst() {
  try {
    File f = File('numsTask1.txt');
    dynamic values = (f.readAsStringSync());
    List<String> str = values.split(" ");
    int lengthWord = 0;

    for (int i = 0; i < str.length; ++i) {
      lengthWord = str[i].length;
      if (lengthWord % 2 == 1) {
        stdout.write('${str[i]} ');
      }
    }
  } catch (e) {
    print(
        "Возникла ошибка. Возможно, введены некорректные данные или нет доступа к файлу. Завершение.");
  }
}

void taskSecond() {
  try {
    File f = File('numsTask2.txt');
    dynamic values = (f.readAsStringSync());
    List<String> str = values.split("\n");
    for (int i = 0; i < str.length; ++i) {
      stdout.write('${str[i]} ');
    }
  } catch (e) {
    print(
        "Возникла ошибка. Возможно, введены некорректные данные. Завершение.");
  }
}

void taskThird() {
  stdout.write("Введите число: ");
  try {
    double number = double.parse(stdin.readLineSync()!);

    if (number % 2 == 0 && number % 10 == 0) {
      print("Да. Ваше число четное и кратное 10.");
    } else {
      print("Нет. Ваше число не четное или не кратное 10");
    }
  } catch (e) {
    print(
        "Возникла ошибка. Возможно, введены некорректные данные. Завершение.");
  }
}

void taskForth() {
  try {
    print(
        "Введите положительные числа. Чтобы закончить, введите отрицательное число.");
    double entered = 1;
    List<double> massif = [];
    double a = 0;
    double summa = 0;

    while (entered > 0) {
      entered = double.parse(stdin.readLineSync()!);
      if (entered < 0) {
        break;
      }
      massif.add(entered);
    }
    stdout.write("Введите число a:");
    a = double.parse(stdin.readLineSync()!);
    if (a <= 0) {
      print('Число a должно быть положительным.');
    } else {
      for (int i = 0; i < massif.length; ++i) {
        if (massif[i] % a == 0) {
          summa += massif[i];
        }
      }
      print('Сумма чисел, делящихся нацело на a: $summa');
    }
  } catch (e) {
    print("Введены некорректные данные. Завершение.");
  }
}

void taskFifth() {
  try {
    stdout.write('Введите количество n строк матрицы: ');
    int n = int.parse(stdin.readLineSync()!);
    stdout.write('Введите количество m столбцов матрицы: ');
    int m = int.parse(stdin.readLineSync()!);

    var a = List.generate(n, (_) => List.filled(m, 0, growable: true));
    int summa = 0;

    for (int i = 0; i < n - 1; ++i) {
      for (int j = 0; j < m; ++j) {
        int rand = (Random().nextInt(2));
        a[i][j] = rand;
      }
    }

    for (int i = 0; i < n; ++i) {
      summa = 0;
      for (int j = 0; j < m; ++j) {
        summa += a[i][j];
      }
      if (summa % 2 == 0) {
        a[i].add(0);
      }
      if (summa % 2 == 1) {
        a[i].add(1);
      }
    }

    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < m + 1; ++j) {
        stdout.write('${a[i][j]} ');
      }
      print(' ');
    }
  } catch (e) {
    print(
        'Возникла ошибка. Возможно, введены некорректные данные. \nПовторите попытку.');
  }
}

void taskSixth() {
  try {
    List<double> nums = List.filled(Random().nextInt(11) + 1, 0);
    List<double> posNums = [];
    List<double> negNums = [];

    for (int i = 0; i < nums.length; ++i) {
      double rand = (Random().nextDouble() * 20) - 10;
      nums[i] = rand;
    }
    print('Получившийся массив: $nums');
    for (int i = 0; i < nums.length; ++i) {
      if (nums[i] > 0) {
        posNums.add(nums[i]);
      } else if (nums[i] < 0) {
        negNums.add(nums[i]);
      }
    }
    print('Массив положительных чисел: $posNums');
    print('Массив отрицательных чисел: $negNums');
  } catch (e) {
    print(
        'Возникла ошибка. Возможно, введены некорректные данные. \nПовторите попытку.');
  }
}
