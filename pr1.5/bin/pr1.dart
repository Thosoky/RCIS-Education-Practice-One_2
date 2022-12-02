import 'dart:io';

void main() {
  stdout.write("Введите номер задания (1-5): ");
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
    List<String> stringValues = values.split(" ");
    List<int> nums = stringValues.map(int.parse).toList();
    int temp = nums[0];
    int tempIndex = 0;
    int multi = 1;

    for (int i = 0; i < nums.length; ++i) {
      if (temp > nums[i]) {
        temp = nums[i];
        tempIndex = i;
      }
    }
    for (int i = tempIndex + 1; i < nums.length; ++i) {
      multi *= nums[i];
    }

    print('Массив чисел из файла: $nums');
    print('Произведение элементов после минимального: $multi');
  } catch (e) {
    print("Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.");
  }
  //5 10 9 1 5 7 3 7 12 6
}

void taskSecond() {
  try {
    File f = File('numsTask2.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringValues = values.split(";");
    List<double> nums = stringValues.map(double.parse).toList();
    double temp = 0;

    print('Массив чисел из файла: $nums');

    for (int i = 0; i < (nums.length - 1); ++i) {
      for (int j = 0; j < (nums.length - i - 1); ++j) {
        if (nums[j] > nums[j + 1]) {
          temp = nums[j];
          nums[j] = nums[j + 1];
          nums[j + 1] = temp;
        }
      }
    }

    String data = nums.toString();
    data = data.replaceAll(",", "");
    data = data.replaceAll("[", "");
    data = data.replaceAll("]", "");
    print('Полученная отсортированная последовательность: $data');

    f.writeAsStringSync(data);
  } catch (e) {
    print("Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.");
  }
  //7.4;0;-5;-6.5;4;33 - исходная последовательность.
}

void taskThird() {
  try {
    File f = File('numsTask3.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringValues = values.split(" ");
    List<int> nums = stringValues.map(int.parse).toList();
    int min = nums[0];
    int minIndex = 0;
    int sum = 0;

    print('Массив чисел из файла: $nums');

    for (int i = 0; i < nums.length; ++i) {
      if (nums[i] < min) {
        min = nums[i];
        minIndex = i;
      }
    }

    for (int i = 0; i < minIndex; ++i) {
      sum += nums[i];
    }

    print('Минимальный элемент: $min');
    print(
        'Среднее арифметическое элементов расположенных до минимального: ${sum / minIndex}');
  } catch (e) {
    print('Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.');
  }
  //12 4 6 8 2 3 1 12 5 9
}

void taskForth() {
  try {
    File f = File('numsTask4.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringValues = values.split(" ");
    List<int> nums = stringValues.map(int.parse).toList();
    int max = nums[0];
    print('Массив чисел из файла: $nums');

    for (int i = 0; i < nums.length; ++i) {
      if (nums[i] > max) {
        max = nums[i];
      }
    }

    print('Максимальный элемент: $max');

    int element = max - 1;
    int count = 0;

    for (int i = 0; i < nums.length; ++i) {
      if (element == nums[i]) {
        ++count;
      }
    }

    element *= count;
    if (count == 0) {
      print('Суммы не существует.');
    } else {
      print('Сумма элементов, отличающихся от максимального на 1: $element');
    }
  } catch (e) {
    print('Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.');
  }
  //12 15 14 16 13 8 9 15 10 13
}

void taskFifth() {
  try {
    File f = File('numsTask5.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringValues = values.split(" ");
    List<int> nums = stringValues.map(int.parse).toList();
    print(' $nums');

    int min = nums[0];
    int max = nums[0];
    int indexMin = 0;
    int indexMax = 0;
    int count = 0;
    int sum = 0;

    for (int i = 0; i < nums.length; ++i) {
      if (nums[i] < min) {
        min = nums[i];
        indexMin = i;
      }
      if (nums[i] > max) {
        max = nums[i];
        indexMax = i;
      }
    }

    for (int i = 0; i < nums.length; ++i) {
      if (i > indexMin && i < indexMax) {
        sum += nums[i];
        count++;
      } else if (i > indexMax && i < indexMin) {
        sum += nums[i];
        count++;
      }
    }

    print('Минимальный элемент: $min');
    print('Максимальный элемент: $max');

    if (count > 0) {
      print(
          'Среднее арифметическое элементов расположенных между минимальным и максимальным : ${sum / count}');
    }
    if (count == 0) {
      print('Между минимальным и максимальным нет элементов.');
    }
  } catch (e) {
    print('Возникла ошибка. Возможно, файл недоступен. \nПовторите попытку.');
  }
  //5 6 9 1 4 5 3 10 6 9
}
