import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_management_kata/feature/app/data/repositories/employee_repository.dart';
import 'package:salary_management_kata/feature/app/presentation/state/employee/employee_state.dart';
import 'package:salary_management_kata/feature/app/presentation/state/employee/employee_event.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository repository;

  EmployeeBloc(this.repository) : super(EmployeeInitial()) {
    on<LoadEmployees>(_onLoadEmployees);
    on<AddEmployee>(_onAddEmployee);
    on<DeleteEmployee>(_onDeleteEmployee);
    on<UpdateEmployee>(_onUpdateEmployee);
  }

  Future<void> _onLoadEmployees(
    LoadEmployees event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoading());
    final employees = await repository.getEmployees();
    emit(EmployeeLoaded(employees));
  }

  Future<void> _onAddEmployee(
    AddEmployee event,
    Emitter<EmployeeState> emit,
  ) async {
    await repository.addEmployee(event.employee);
    final employees = await repository.getEmployees();
    emit(EmployeeLoaded(employees));
  }

  Future<void> _onUpdateEmployee(
    UpdateEmployee event,
    Emitter<EmployeeState> emit,
  ) async {
    await repository.updateEmployee(event.employee);
    final employees = await repository.getEmployees();
    emit(EmployeeLoaded(employees));
  }

  Future<void> _onDeleteEmployee(
    DeleteEmployee event,
    Emitter<EmployeeState> emit,
  ) async {
    await repository.deleteEmployee(event.id);
    final employees = await repository.getEmployees();
    emit(EmployeeLoaded(employees));
  }
}
