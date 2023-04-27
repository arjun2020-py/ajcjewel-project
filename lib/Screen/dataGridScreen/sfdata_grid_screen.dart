import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'data_grid_model.dart';
import 'data_source_screen.dart';

class DataGridScreen extends StatefulWidget {
  DataGridScreen({super.key});

  @override
  State<DataGridScreen> createState() => _DataGridScreenState();
}

class _DataGridScreenState extends State<DataGridScreen> {
  late List<Employee> employee;

  //key:  assgin the datasource to the data grid
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    //key: intalize the employee collection the method  'getEmployeData()'
    employee = getEmployeData();

    //key: assgin employee datasource  field by calling  the class employee datasource  by passing employee's collection
    employeeDataSource = EmployeeDataSource(employee);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key:  run this app, raw employeeData is convereted to  dataGrid understble dataSource  with  rows and cells
      body: SfDataGrid(
        //key: enable selection in sfdataGrid
        selectionMode: SelectionMode.multiple,

        //key; enable sorting in sfdataGrid
        allowSorting: true,

        source: employeeDataSource,
        columns: [
          GridColumn(
            columnName: 'id',
            label: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: const Text(
                'Id',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: 'name',
            label: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: const Text(
                'NAME',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: 'desigation',
            label: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: const Text(
                'DESIGATION',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: 'salary',
            label: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: const Text(
                'SALARY',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Employee> getEmployeData() {
    return [
      Employee(10001, 'james', 'Project Lead', '20000'),
      Employee(10002, 'Andason', 'Manager', '30000'),
      Employee(10003, 'John', 'Developer', '15000'),
      Employee(10004, 'Cenia', ' Desginer', '12000'),
      Employee(10005, 'Staut', 'Conent Writter', '10000'),
      Employee(10006, 'board', 'sr.developer', '25000'),
      Employee(10007, 'fafu', ' Hr', '28000'),
      Employee(10008, 'james', 'Project Lead', '20000'),
      Employee(10009, 'james', 'Project Lead', '20000'),
      Employee(10010, 'james', 'Project Lead', '20000'),
      Employee(10011, 'james', 'Project Lead', '20000'),
    ];
  }
}
