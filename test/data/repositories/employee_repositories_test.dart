import 'package:flutter_test/flutter_test.dart';
import 'package:salary_management_kata/feature/app/data/models/employee.dart';
import 'package:salary_management_kata/feature/app/data/repositories/employee_repository.dart';
import 'package:salary_management_kata/feature/app/data/services/employee_db_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late EmployeeRepository repository;
  late EmployeeDbService dbService;

  setUpAll(() {
    // REQUIRED for tests
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    dbService = EmployeeDbService();
    repository = EmployeeRepository(dbService);

    // Ensure fresh DB for every test
    final db = await dbService.database;
    await db.delete('employees');
  });

  test('ADD employee → should insert into database', () async {
    // ARRANGE
    final employee = Employee(
      fullName: 'Aslin Geo',
      jobTitle: 'Flutter Developer',
      country: 'India',
      salary: 80000,
    );

    // ACT
    await repository.addEmployee(employee);
    final employees = await repository.getEmployees();

    // ASSERT
    expect(employees.length, 1);
    expect(employees.first.fullName, 'Aslin Geo');
  });

  test('GET employees → should return all employees', () async {
    // ARRANGE
    await repository.addEmployee(
      Employee(
        fullName: 'Employee 1',
        jobTitle: 'Developer',
        country: 'India',
        salary: 50000,
      ),
    );

    await repository.addEmployee(
      Employee(
        fullName: 'Employee 2',
        jobTitle: 'Designer',
        country: 'USA',
        salary: 60000,
      ),
    );

    // ACT
    final employees = await repository.getEmployees();

    // ASSERT
    expect(employees.length, 2);
  });

  test('UPDATE employee → should update existing employee', () async {
    // ARRANGE
    await repository.addEmployee(
      Employee(
        fullName: 'Old Name',
        jobTitle: 'Developer',
        country: 'India',
        salary: 50000,
      ),
    );

    final employees = await repository.getEmployees();
    final existingEmployee = employees.first;

    // ACT
    final updatedEmployee = Employee(
      id: existingEmployee.id,
      fullName: 'Updated Name',
      jobTitle: existingEmployee.jobTitle,
      country: existingEmployee.country,
      salary: 75000,
    );

    await repository.updateEmployee(updatedEmployee);
    final updatedList = await repository.getEmployees();

    // ASSERT
    expect(updatedList.first.fullName, 'Updated Name');
    expect(updatedList.first.salary, 75000);
  });

  test('DELETE employee → should remove employee from database', () async {
    // ARRANGE
    await repository.addEmployee(
      Employee(
        fullName: 'To Be Deleted',
        jobTitle: 'Tester',
        country: 'India',
        salary: 40000,
      ),
    );

    final employees = await repository.getEmployees();
    final employeeId = employees.first.id!;

    // ACT
    await repository.deleteEmployee(employeeId);
    final remainingEmployees = await repository.getEmployees();

    // ASSERT
    expect(remainingEmployees.isEmpty, true);
  });
}
