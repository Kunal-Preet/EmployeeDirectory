//
//  EmployeesListView.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import SwiftUI

struct EmployeesListView: View {
    
    let employeesText: LocalizedStringKey = "employees"
    
    @State private var search_text: String = ""
    @StateObject var viewModel = EmployeesListViewModel()
    @State var fromURL: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(listOfEmployees, id: \.self) { employee in
                    NavigationLink(destination: EmployeeDetailsView( uuid: employee.uuid)) {
                        EmployeeCell(full_name: employee.full_name , team: employee.team , photo_url_small: employee.photo_url_small ?? "")
                    }
                }
            }
            .navigationTitle(employeesText)
            .onAppear {
                if fromURL {
                    viewModel.fetchEmployees()
                    fromURL.toggle()
                }
                else {
                    viewModel.fetchEmployeesFromCashe()
                }
            }
            .searchable(text: $search_text)
            .refreshable {
                viewModel.fetchEmployeesFromCashe()
                print("Refreshed!")
            }
        }
    }
    // For search employees
    var listOfEmployees: [Employees] {
        return search_text == "" ? viewModel.employeesDetails.employees : viewModel.employeesDetails.employees.filter{
            $0.full_name.contains(search_text)
        }
    }
}

struct EmployeesListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListView(fromURL: true )
    }
}
