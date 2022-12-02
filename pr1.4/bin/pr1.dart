import 'dart:io';

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
    int n = 0;
    int mult = 1;
    stdout.write('Введите n: ');
    n = int.parse(stdin.readLineSync()!);

    if (n > 2) {
      for (int i = 3; i <= n; i += 3) {
        mult *= i;
      }
      print(
          'Произведение натуральных чисел кратных трем и не превышающих число $n = $mult');
    } else if (n > 0 && n <= 2) {
      mult = 0;
      print(
          'Произведение чисел кратных трем и не превышающих число $n = $mult');
    } else {
      print('Введено некорректное значение.');
    }
  } catch (e) {
    print(
        'Возникла ошибка. Возможно, введены некорректные данные. \nПовторите попытку.');
  }
}

void taskSecond() {
  try {
    File f = File('numsTask2.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringValues = values.split(";");
    List<double> nums = stringValues.map(double.parse).toList();
    List<double> newNums = [];
    print('Последовательность чисел из файла: $nums');

    for (int i = 0; i < nums.length; ++i) {
      if (nums[i] == 0) {
        break;
      }
      newNums.add(nums[i]);
    }
    print('Новая последовательность: $newNums');

    double summa = 0;
    for (int i = 0; i < newNums.length; i++) {
      if (nums[i] > 0) {
        summa += nums[i];
      }
    }
    print(
        'Сумма положительных элементов полученной последовательности: $summa');
  } catch (e) {
    print("Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.");
  }
//7.4;-5;10.2;12;-6.5;0;4;33
}

void taskThird() {
  try {
    File f = File('numsTask3.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringValues = values.split(",");
    List<int> nums = stringValues.map(int.parse).toList();
    print('Массив чисел из файла: $nums');
    List<int> newNums = [];

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        break;
      }
      newNums.add(nums[i]);
    }
    print('Новый массив чисел: $newNums');

    int min = newNums[0];
    int max = newNums[0];
    for (int i = 0; i < newNums.length; i++) {
      if (min > newNums[i]) {
        min = newNums[i];
      }
      if (max < newNums[i]) {
        max = newNums[i];
      }
    }
    print('Минимальный элемент: $min');
    print('Максимальный элемент: $max');
    print('Отношение минимального к максимальному: ${min / max}');
    print('Отношение максимального к минимальному: ${max / min}');
  } catch (e) {
    print("Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.");
  }
//1,4,7,23,8,12,5,0,8,10
}

void taskForth() {
  try {
    File f = File('numsTask4.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringValues = values.split(" ");
    List<int> nums = stringValues.map(int.parse).toList();
    print('Массив чисел из файла: $nums');
    int count = 0;
    for (int i = 0; i < nums.length - 1; i++) {
      if (nums[i] == nums[i + 1]) {
        ++count;
      }
    }
    print('Количество одинаковых рядом стоящих чисел: $count');
  } catch (e) {
    print("Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.");
  }
//5 8 6 6 104 5 5 2 2 10
}

void taskFifth() {
  try {
    double a = 0;
    double b = 0;
    stdout.write('Введите число a: ');
    a = double.parse(stdin.readLineSync()!);
    stdout.write('Введите число b: ');
    b = double.parse(stdin.readLineSync()!);

    if (a >= -1 && a <= 3 && b >= -2 && b <= 4) {
      print('Точка ($a; $b) принадлежит заштрихованной области.');
    } else {
      print('Точка ($a; $b) не принадлежит заштрихованной области.');
    }
  } catch (e) {
    print(
        "Возникла ошибка. Возможно, введены неверные данные.\nПовторите попытку.");
  }
}

void taskSixth() {
  try {
    double a = 0;
    double b = 0;
    stdout.write('Введите a: ');
    a = double.parse(stdin.readLineSync()!);
    stdout.write('Введите b: ');
    b = double.parse(stdin.readLineSync()!);
    double q = (-2 - a) * (2 - (-3)) - (0 - (-2)) * (-3 - b);
    double w = (0 - a) * (-3 - 2) - (2 - 0) * (2 - b);
    double e = (2 - a) * (-3 - (-3)) - (-2 - 2) * (-3 - b);

    if ((q >= 0 && w >= 0 && e >= 0) || (q <= 0 && w <= 0 && e <= 0)) {
      print("Точка ($a; $b) принадлежит заштрихованной области.");
    } else {
      print("Точка ($a; $b) не принадлежит заштрихованной области.");
    }
  } catch (e) {
    print(
        "Возникла ошибка. Возможно, введены некорректные данные. \nПовторите попытку.");
  }
}
