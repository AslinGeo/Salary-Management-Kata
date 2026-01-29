import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salary_management_kata/feature/app/data/models/employee.dart';
import 'package:salary_management_kata/feature/app/presentation/ui/employee_list/employee_card.dart';
import 'package:salary_management_kata/feature/app/presentation/ui/widgets/confirm_popup.dart';

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TEMP dummy data (later comes from BLoC)
    final employees = <Employee>[
      Employee(
        id: 1,
        fullName: 'Aslin Geo',
        jobTitle: 'Flutter Developer',
        country: 'India',
        salary: 85000,
      ),
      Employee(
        id: 2,
        fullName: 'John Smith',
        jobTitle: 'Product Designer',
        country: 'USA',
        salary: 95000,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Employees'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/add");
        },
        child: const Icon(Icons.add),
      ),
      body: employees.isEmpty
          ? const _EmptyState()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: employees.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return EmployeeCard(
                  employee: employees[index],
                  onEdit: () {
                    context.push('/edit', extra: employees[index]);
                  },
                  onDelete: () async {
                    final confirmed = await showConfirmDeleteDialog(context);
                    if (confirmed == true) {}
                  },
                );
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
