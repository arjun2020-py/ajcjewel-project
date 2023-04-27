//key: need to convert employee data that it can be recoganized by the data grid.
//key: achive this inherit the  'dataGridSource' & convert each employee row data to dataGridRow.
//kry: dataGridSource class has rows property & build row method help to achive the data conversion

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'data_grid_model.dart';

class EmployeeDataSource extends DataGridSource {
  //key: set dataGridRows with values
  EmployeeDataSource(List<Employee> employee) {
    //key: consturtor set the dataGridRows field with  employee  parmeter

    dataGridRows = employee
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell(columnName: 'id', value: dataGridRow.id),
              DataGridCell(columnName: 'name', value: dataGridRow.name),
              DataGridCell(
                  columnName: 'desgination', value: dataGridRow.desigation),
              DataGridCell(columnName: 'salary', value: dataGridRow.salary)
            ]))
        .toList();
  }

  //key:  declare the  field as list of 'dataGridRow()'
  late List<DataGridRow> dataGridRows;

  @override

  //key: override the rows property and assgin a field to it.
  List<DataGridRow> get rows => dataGridRows;

  //key: create the widget reqiured for each cell
  DataGridRowAdapter? buildRow(DataGridRow row) {
    //key: defined the row with a collection  of cells built using conatiner and text widget.
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        padding: EdgeInsets.all(16),
        alignment: (dataGridCell.columnName == 'id' ||
                dataGridCell.columnName == 'salary')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Text(
          dataGridCell.value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }).toList());
  }
}

class MyPageData extends DataTableSource {
  @override
  DataRow? getRow(int index) {}

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => throw UnimplementedError();

  @override
  // TODO: implement rowCount
  int get rowCount => throw UnimplementedError();

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => throw UnimplementedError();
}
