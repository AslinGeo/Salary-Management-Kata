import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salary_management_kata/feature/app/data/models/employee.dart';
import 'package:salary_management_kata/feature/app/presentation/state/employee/employee_bloc.dart';
import 'package:salary_management_kata/feature/app/presentation/state/employee/employee_event.dart';
import 'package:salary_management_kata/feature/app/presentation/ui/add_employee/app_text_field.dart';

class AddEditEmployeePage extends StatefulWidget {
  final Employee? employee;

  const AddEditEmployeePage({super.key, this.employee});

  @override
  State<AddEditEmployeePage> createState() => _AddEditEmployeePageState();
}

class _AddEditEmployeePageState extends State<AddEditEmployeePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _jobTitleController;
  late final TextEditingController _countryController;
  late final TextEditingController _salaryController;

  bool get isEditMode => widget.employee != null;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: widget.employee?.fullName ?? '',
    );
    _jobTitleController = TextEditingController(
      text: widget.employee?.jobTitle ?? '',
    );
    _countryController = TextEditingController(
      text: widget.employee?.country ?? '',
    );
    _salaryController = TextEditingController(
      text: widget.employee?.salary.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobTitleController.dispose();
    _countryController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final employee = Employee(
      id: widget.employee?.id,
      fullName: _nameController.text.trim(),
      jobTitle: _jobTitleController.text.trim(),
      country: _countryController.text.trim(),
      salary: double.parse(_salaryController.text),
    );

    if (employee.id == null) {
      context.read<EmployeeBloc>().add(AddEmployee(employee));
    } else {
      context.read<EmployeeBloc>().add(UpdateEmployee(employee));
    }
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Employee' : 'Add Employee'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  icon: Icons.person,
                  validator: _requiredValidator,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _jobTitleController,
                  label: 'Job Title',
                  icon: Icons.work_outline,
                  validator: _requiredValidator,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _countryController,
                  label: 'Country',
                  icon: Icons.location_on_outlined,
                  validator: _requiredValidator,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _salaryController,
                  label: 'Salary',
                  icon: Icons.currency_rupee,
                  keyboardType: TextInputType.number,
                  validator: _salaryValidator,
                ),
                const SizedBox(height: 32),

                GestureDetector(
                  onTap: _onSubmit,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF14B8A6),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        isEditMode ? 'Update Employee' : 'Add Employee',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _salaryValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Salary is required';
    }
    final salary = double.tryParse(value);
    if (salary == null || salary <= 0) {
      return 'Enter a valid salary';
    }
    return null;
  }
}
