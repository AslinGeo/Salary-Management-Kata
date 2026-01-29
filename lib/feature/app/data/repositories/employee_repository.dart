import 'package:salary_management_kata/feature/app/data/models/employee.dart';
import '../services/employee_db_service.dart';

class EmployeeRepository {
  final EmployeeDbService _dbService;

  EmployeeRepository(this._dbService);

  Future<void> addEmployee(Employee employee) async {
    await _dbService.insertEmployee(employee.toMap());
  }

  Future<List<Employee>> getEmployees() async {
    final result = await _dbService.getAllEmployees();
    return result.map(Employee.fromMap).toList();
  }

  Future<void> deleteEmployee(int id) async {
    await _dbService.deleteEmployee(id);
  }

  Future<void> updateEmployee(Employee employee) async {
    await _dbService.updateEmployee(employee.toMap());
  }
}
