import 'dart:io';

import 'package:dart_project/src/data/database.dart';
import 'package:dart_project/src/data/repositories/client_repository_impl.dart';
import 'package:dart_project/src/data/repositories/house_repository_impl.dart';
import 'package:dart_project/src/data/repositories/order_repository_impl.dart';
import 'package:dart_project/src/data/repositories/service_repository_impl.dart';
import 'package:dart_project/src/domain/models/client.dart';
import 'package:dart_project/src/domain/models/house.dart';
import 'package:dart_project/src/domain/models/order.dart';
import 'package:dart_project/src/domain/models/service.dart';
import 'package:dart_project/src/cli/input_helper.dart';

void runMenu(ConstructionDatabase db) {
  final clientRepo = ClientRepositoryImpl(db);
  final houseRepo = HouseRepositoryImpl(db);
  final serviceRepo = ServiceRepositoryImpl(db);
  final orderRepo = OrderRepositoryImpl(db);

  while (true) {
    stdout.writeln('''
--- Строительная компания ---
1 — список клиентов
2 — добавить клиента
3 — изменить клиента
4 — удалить клиента
5 — список домов
6 — добавить дом
7 — изменить дом
8 — удалить дом
9 — список услуг
10 — добавить услугу
11 — изменить услугу
12 — удалить услугу
13 — список заказов
14 — добавить заказ
15 — изменить заказ
16 — удалить заказ
17 — показать всё из БД
0 — выход
Выберите пункт:''');

    final choice = stdin.readLineSync()?.trim() ?? '';
    switch (choice) {
      case '1':
        _printClients(clientRepo);
      case '2':
        _addClient(clientRepo);
      case '3':
        _updateClient(clientRepo);
      case '4':
        _deleteClient(clientRepo);
      case '5':
        _printHouses(houseRepo);
      case '6':
        _addHouse(houseRepo);
      case '7':
        _updateHouse(houseRepo);
      case '8':
        _deleteHouse(houseRepo);
      case '9':
        _printServices(serviceRepo);
      case '10':
        _addService(serviceRepo);
      case '11':
        _updateService(serviceRepo);
      case '12':
        _deleteService(serviceRepo);
      case '13':
        _printOrders(orderRepo);
      case '14':
        _addOrder(orderRepo, clientRepo, serviceRepo, houseRepo);
      case '15':
        _updateOrder(orderRepo, clientRepo, serviceRepo, houseRepo);
      case '16':
        _deleteOrder(orderRepo);
      case '17':
        _printAll(clientRepo, houseRepo, serviceRepo, orderRepo);
      case '0':
        stdout.writeln('До свидания.');
        return;
      default:
        stdout.writeln('Неизвестная команда.');
    }
    stdout.writeln();
  }
}

void _printClients(ClientRepositoryImpl repo) {
  final list = repo.getAllClients();
  if (list.isEmpty) {
    stdout.writeln('Клиентов нет.');
    return;
  }
  for (final c in list) {
    stdout.writeln('id: ${c.id} | ${c.name} | ${c.phone}');
  }
}

void _addClient(ClientRepositoryImpl repo) {
  final id = askString('id клиента: ');
  final name = askString('имя: ');
  final phone = askString('телефон: ');
  repo.insertClient(Client(id: id, name: name, phone: phone));
  stdout.writeln('Клиент сохранён.');
}

void _updateClient(ClientRepositoryImpl repo) {
  final id = askString('id клиента: ');
  final existing = repo.getClient(id);
  if (existing == null) {
    stdout.writeln('Клиент не найден.');
    return;
  }
  final name = askString('новое имя (${existing.name}): ');
  final phone = askString('новый телефон (${existing.phone}): ');
  repo.updateClient(Client(id: id, name: name, phone: phone));
  stdout.writeln('Клиент обновлён.');
}

void _deleteClient(ClientRepositoryImpl repo) {
  final id = askString('id клиента: ');
  repo.deleteClient(id);
  stdout.writeln('Готово (если id был в базе).');
}

void _printHouses(HouseRepositoryImpl repo) {
  final list = repo.getAllHouses();
  if (list.isEmpty) {
    stdout.writeln('Домов нет.');
    return;
  }
  for (final h in list) {
    stdout.writeln('id: ${h.id} | ${h.address} | ${h.floors} эт. | ${h.area} м²');
  }
}

void _addHouse(HouseRepositoryImpl repo) {
  final id = askString('id дома: ');
  final address = askString('адрес: ');
  final floors = askInt('этажность: ');
  final area = askDouble('площадь (м²): ');
  repo.insertHouse(House(id: id, address: address, floors: floors, area: area));
  stdout.writeln('Дом сохранён.');
}

void _updateHouse(HouseRepositoryImpl repo) {
  final id = askString('id дома: ');
  final existing = repo.getHouse(id);
  if (existing == null) {
    stdout.writeln('Дом не найден.');
    return;
  }
  final address = askString('новый адрес (${existing.address}): ');
  final floors = askInt('новая этажность (${existing.floors}): ');
  final area = askDouble('новая площадь (${existing.area}): ');
  repo.updateHouse(House(id: id, address: address, floors: floors, area: area));
  stdout.writeln('Дом обновлён.');
}

void _deleteHouse(HouseRepositoryImpl repo) {
  final id = askString('id дома: ');
  repo.deleteHouse(id);
  stdout.writeln('Готово (если id был в базе).');
}

void _printServices(ServiceRepositoryImpl repo) {
  final list = repo.getAllServices();
  if (list.isEmpty) {
    stdout.writeln('Услуг нет.');
    return;
  }
  for (final s in list) {
    stdout.writeln('id: ${s.id} | ${s.title} | ${s.description} | ${s.price} ₽');
  }
}

void _addService(ServiceRepositoryImpl repo) {
  final id = askString('id услуги: ');
  final title = askString('название: ');
  final description = askString('описание: ');
  final price = askDouble('цена (₽): ');
  repo.insertService(Service(id: id, title: title, description: description, price: price));
  stdout.writeln('Услуга сохранена.');
}

void _updateService(ServiceRepositoryImpl repo) {
  final id = askString('id услуги: ');
  final existing = repo.getService(id);
  if (existing == null) {
    stdout.writeln('Услуга не найдена.');
    return;
  }
  final title = askString('новое название (${existing.title}): ');
  final description = askString('новое описание (${existing.description}): ');
  final price = askDouble('новая цена (${existing.price}): ');
  repo.updateService(Service(id: id, title: title, description: description, price: price));
  stdout.writeln('Услуга обновлена.');
}

void _deleteService(ServiceRepositoryImpl repo) {
  final id = askString('id услуги: ');
  repo.deleteService(id);
  stdout.writeln('Готово (если id был в базе).');
}

void _printOrders(OrderRepositoryImpl repo) {
  final list = repo.getAllOrders();
  if (list.isEmpty) {
    stdout.writeln('Заказов нет.');
    return;
  }
  for (final o in list) {
    stdout.writeln('id: ${o.id} | клиент: ${o.clientId} | дом: ${o.houseId} | услуга: ${o.serviceId} | ${o.date.toLocal()}');
  }
}

void _addOrder(
  OrderRepositoryImpl orderRepo,
  ClientRepositoryImpl clientRepo,
  ServiceRepositoryImpl serviceRepo,
  HouseRepositoryImpl houseRepo,
) {
  stdout.writeln('Доступные клиенты:');
  _printClients(clientRepo);
  stdout.writeln('Доступные услуги:');
  _printServices(serviceRepo);
  stdout.writeln('Доступные дома:');
  _printHouses(houseRepo);

  final id = askString('id заказа: ');
  final clientId = askString('id клиента: ');
  final houseId = askString('id дома: ');
  final serviceId = askString('id услуги: ');
  final date = askDateTime('дата и время (YYYY-MM-DD HH:MM): ');

  orderRepo.insertOrder(Order(id: id, date: date, clientId: clientId, houseId: houseId, serviceId: serviceId));
  stdout.writeln('Заказ сохранён.');
}

void _updateOrder(
  OrderRepositoryImpl orderRepo,
  ClientRepositoryImpl clientRepo,
  ServiceRepositoryImpl serviceRepo,
  HouseRepositoryImpl houseRepo,
) {
  final id = askString('id заказа: ');
  final existing = orderRepo.getOrder(id);
  if (existing == null) {
    stdout.writeln('Заказ не найден.');
    return;
  }

  stdout.writeln('Доступные клиенты:');
  _printClients(clientRepo);
  stdout.writeln('Доступные услуги:');
  _printServices(serviceRepo);
  stdout.writeln('Доступные дома:');
  _printHouses(houseRepo);

  final clientId = askString('новый id клиента (${existing.clientId}): ');
  final houseId = askString('новый id дома (${existing.houseId}): ');
  final serviceId = askString('новый id услуги (${existing.serviceId}): ');
  final date = askDateTime('новая дата (${existing.date.toLocal()}): ');

  orderRepo.updateOrder(Order(id: id, date: date, clientId: clientId, houseId: houseId, serviceId: serviceId));
  stdout.writeln('Заказ обновлён.');
}

void _deleteOrder(OrderRepositoryImpl repo) {
  final id = askString('id заказа: ');
  repo.deleteOrder(id);
  stdout.writeln('Готово (если id был в базе).');
}

void _printAll(
  ClientRepositoryImpl clientRepo,
  HouseRepositoryImpl houseRepo,
  ServiceRepositoryImpl serviceRepo,
  OrderRepositoryImpl orderRepo,
) {
  stdout.writeln('=== КЛИЕНТЫ ===');
  _printClients(clientRepo);
  stdout.writeln('=== ДОМА ===');
  _printHouses(houseRepo);
  stdout.writeln('=== УСЛУГИ ===');
  _printServices(serviceRepo);
  stdout.writeln('=== ЗАКАЗЫ ===');
  _printOrders(orderRepo);
}
