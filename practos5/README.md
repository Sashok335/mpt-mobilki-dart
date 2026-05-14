# dart_project — модульное CLI-приложение на Dart

Консольное приложение для учёта заказов строительной компании с хранением данных в SQLite.

## Предметная область

Система автоматизации строительной компании:

- **Клиенты** (`Client`) — заказчики;
- **Дома** (`House`) — объекты строительства;
- **Услуги** (`Service`) — виды работ;
- **Заказы** (`Order`) — связывают клиента, дом и услугу с датой.

## Архитектура и структура папок

Проект разделён на модули по слоям:

```text
lib/
  dart_project.dart           # публичный экспорт
  src/
    domain/
      id.dart                  # базовый интерфейс
      models/                  # сущности
        client.dart
        house.dart
        service.dart
        order.dart
      validators/              # валидация
        text_validator.dart
        number_validator.dart
      interfaces/              # абстрактные репозитории
        client_repository.dart
        house_repository.dart
        service_repository.dart
        order_repository.dart
    data/
      database.dart            # SQLite, создание таблиц
      repositories/            # реализации CRUD
        client_repository_impl.dart
        house_repository_impl.dart
        service_repository_impl.dart
        order_repository_impl.dart
    cli/
      input_helper.dart        # ввод с валидацией
      menu.dart                # цикл меню и обработчики
bin/
  dart_project.dart            # точка входа (main)
test/
  domain_test.dart             # toMap / fromMap
  data_test.dart               # вставка и чтение из SQLite
  validation_test.dart         # валидный и невалидный ввод
```

### Что вынесено в каждый слой и почему

- **domain**: описывает данные (`Id`, модели, `toMap`/`fromMap`), правила валидации и контракты репозиториев. Не зависит от SQL и консоли.
- **data**: отвечает за хранение, создание таблиц и CRUD-запросы через SQLite. Не зависит от консоли.
- **cli**: отвечает за взаимодействие с пользователем (`stdin`/`stdout`) и навигацию по меню. Не зависит от реализации БД.

Такое разделение упрощает поддержку, тестирование и замену инфраструктуры (например, SQLite на другой способ хранения).

## Реализованная функциональность

- просмотр, добавление, изменение и удаление клиентов, домов, услуг и заказов;
- связи между сущностями: заказ привязан к клиенту, дому и услуге (внешние ключи с `ON DELETE CASCADE`);
- пункт меню «показать всё из БД».

## Валидация

Реализованы проверки:

- **обязательное текстовое поле**: значение не пустое после `trim()`;
- **числовое поле больше 0**: цена, этажность, площадь;
- **дата/время**: корректно парсится через `DateTime.parse()`.

## Тесты

1. **domain_test.dart** — проверка `toMap`/`fromMap` для сущностей `Client` и `House`.
2. **data_test.dart** — вставка и чтение клиента и заказа из временной SQLite.
3. **validation_test.dart** — валидный и невалидный ввод (текст, число, дата).

## Запуск

```bash
dart pub get
dart run
dart test
```
