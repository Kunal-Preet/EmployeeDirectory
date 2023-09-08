//
//  EmployeeDetailsViewModel.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import Foundation

class EmployeeDetailsViewModel: ObservableObject {
    
    @Published var employeesDetailsFromCashe: EmployeesListModel = EmployeesListModel(employees: [])
    
    init() {
        fetchEmployeesFromCashe()
    }
    
    // Fetching employees details from cashe.
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
                    self.employeesDetailsFromCashe = model
                    print("Success from Cashe for details")
                }
            }
            catch {
                print("Failed to fetch data from cashe for details! \(error)")
            }
        }
        task.resume()
    }
}
