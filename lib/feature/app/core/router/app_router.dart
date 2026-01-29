
import 'package:go_router/go_router.dart';
import 'package:salary_management_kata/feature/app/presentation/ui/add_employee/add_edit_employee_page.dart' show AddEditEmployeePage;
import 'package:salary_management_kata/feature/app/presentation/ui/employee_list/employee_list_page.dart';
import '../../data/models/employee.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'employee-list',
      builder: (context, state) => const EmployeeListPage(),
    ),
    GoRoute(
      path: '/add',
      name: 'add-employee',
      builder: (context, state) => const AddEditEmployeePage(),
    ),
    GoRoute(
      path: '/edit',
      name: 'edit-employee',
      builder: (context, state) {
        final employee = state.extra as Employee;
        return AddEditEmployeePage(employee: employee);
      },
    ),
  ],
);
