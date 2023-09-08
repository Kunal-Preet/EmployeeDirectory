//
//  EmployeesListViewModel.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import Foundation

class EmployeesListViewModel: ObservableObject {
    
    @Published var employeesDetails: EmployeesListModel = EmployeesListModel(employees: [])
    
    init() {
        fetchEmployees()
    }
    
    // Fetching employees details from URL.
    // Need to cache data. Did not find a way to cache data.
    func fetchEmployees() {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
        //guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json") else {
        //guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(EmployeesListModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.employeesDetails = model
                    print("Success from URL")
                }
            }
            catch {
                print("Failed to fetch data from URL! \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    // Fetching employees details from cache.
    // Did not find a way to cache data. So fetching the data from the URL here too.
    func fetchEmployeesFromCashe() {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(EmployeesListModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.employeesDetails = model
                    print("Success from Cashe for refresh")
                }
            }
            catch {
                print("Failed to fetch data from cashe for refresh! \(error)")
            }
        }
        task.resume()
    }
}
