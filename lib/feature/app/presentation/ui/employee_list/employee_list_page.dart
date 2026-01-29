import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salary_management_kata/feature/app/presentation/state/employee/employee_bloc.dart';
import 'package:salary_management_kata/feature/app/presentation/state/employee/employee_event.dart';
import 'package:salary_management_kata/feature/app/presentation/state/employee/employee_state.dart';
import 'package:salary_management_kata/feature/app/presentation/ui/employee_list/employee_card.dart';
import 'package:salary_management_kata/feature/app/presentation/ui/widgets/confirm_popup.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeBloc>().add(LoadEmployees());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employees'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/add");
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EmployeeLoaded) {
            return state.employees.isEmpty
                ? const _EmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.employees.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return EmployeeCard(
                        employee: state.employees[index],
                        onEdit: () {
                          context.push('/edit', extra: state.employees[index]);
                        },
                        onDelete: () async {
                          final confirmed = await showConfirmDeleteDialog(
                            context,
                          );
                          if (confirmed == true) {
                            // ignore: use_build_context_synchronously
                            context.read<EmployeeBloc>().add(
                              DeleteEmployee(state.employees[index].id ?? 0),
                            );
                          }
                        },
                      );
                    },
                  );
          } else if (state is EmployeeError) {
            return Center(child: Text("Failed to load employees"));
          }
          return SizedBox();
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.people_outline, size: 80, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            'No employees found',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 6),
          Text(
            'Tap + to add a new employee',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
