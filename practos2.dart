void main() {
  List<String> subjects = ['Java', 'Python', 'C#', 'Dart'];

  Map<String, Map<String, int>> journal = {
    'Ученик 1': {'Java': 5, 'Python': 4, 'C#': 5, 'Dart': 4},
    'Ученик 2': {'Java': 3, 'Python': 3, 'C#': 4, 'Dart': 3},
    'Ученик 3': {'Java': 5, 'Python': 5, 'C#': 5, 'Dart': 5},
    'Ученик 4': {'Java': 4, 'Python': 4, 'C#': 5, 'Dart': 4},
    'Ученик 5': {'Java': 2, 'Python': 3, 'C#': 3, 'Dart': 4},
    'Ученик 6': {'Java': 4, 'Python': 5, 'C#': 4, 'Dart': 5},
  };

  print('=' * 30);
  print('ЖУРНАЛ УСПЕВАЕМОСТИ ГРУППЫ');
  print('=' * 30);

  print('Список предметов:');
  for (var subj in subjects) {
    print('- $subj');
  }

  print('\nСписок студентов:');
  int index = 1;
  for (var student in journal.keys) {
    print('$index. $student');
    index++;
  }

  print('\nОценки студентов:');
  for (var student in journal.keys) {
    print('$student:');
    var grades = journal[student]!;
    for (var subject in subjects) {
      print('   $subject: ${grades[subject]}');
    }
  }

  print('\nСредний балл по предметам:');
  double minSubjectAvg = 10.0;
  String worstSubject = '';

  for (var subject in subjects) {
    int sum = 0;
    int count = 0;
    for (var student in journal.keys) {
      var grade = journal[student]![subject];
      if (grade != null) {
        sum += grade;
        count++;
      }
    }
    double avg = count > 0 ? sum / count : 0;
    print('- $subject: ${avg.toStringAsFixed(2)}');

    if (avg < minSubjectAvg) {
      minSubjectAvg = avg;
      worstSubject = subject;
    }
  }
  print(
    '\nПредмет с наименьшим средним баллом: $worstSubject ($minSubjectAvg)',
  );

  print('\nСредний балл студентов:');
  double maxStudentAvg = -1.0;
  String bestStudent = '';

  for (var student in journal.keys) {
    var grades = journal[student]!;
    int sum = 0;
    for (var grade in grades.values) {
      sum += grade;
    }
    double avg = sum / grades.length;
    print('- $student: ${avg.toStringAsFixed(2)}');

    if (avg > maxStudentAvg) {
      maxStudentAvg = avg;
      bestStudent = student;
    }
  }
  print('\nЛучший студент: $bestStudent (${maxStudentAvg.toStringAsFixed(2)})');

  int totalSum = 0;
  int totalCount = 0;
  for (var student in journal.keys) {
    for (var grade in journal[student]!.values) {
      totalSum += grade;
      totalCount++;
    }
  }
  double groupAvg = totalCount > 0 ? totalSum / totalCount : 0;
  print('\nОбщий средний балл по группе: ${groupAvg.toStringAsFixed(2)}');

  print('\nПеречень предметов без повторов:');
  Set<String> uniqueSubjects = {};
  for (var student in journal.keys) {
    uniqueSubjects.addAll(journal[student]!.keys);
  }
  print('   ${uniqueSubjects.join(", ")}');
  print('   Количество: ${uniqueSubjects.length}');

  print('\n. Студенты без двоек:');
  bool foundNoTwos = false;
  for (var student in journal.keys) {
    if (!journal[student]!.values.contains(2)) {
      print('- $student');
      foundNoTwos = true;
    }
  }
  if (!foundNoTwos) print('   Нет таких студентов');

  print('\nСтуденты, у которых все оценки не ниже 4:');
  bool foundGood = false;
  for (var student in journal.keys) {
    bool allGood = journal[student]!.values.every((grade) => grade >= 4);

    if (allGood) {
      print('- $student');
      foundGood = true;
    }
  }
  if (!foundGood) print('   Нет таких студентов');
}
