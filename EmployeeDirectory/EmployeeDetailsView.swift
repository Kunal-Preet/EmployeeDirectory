//
//  EmployeeDetailsView.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import SwiftUI

struct EmployeeDetailsView: View {
    
    var uuid: String
    
    @StateObject var viewModel = EmployeeDetailsViewModel()
    
    var body: some View {
        
        ForEach(employeeToDisplay, id: \.self) { employee in
            let image_url = URL(string: employee.photo_url_large ?? "")
            
            VStack {
                Text("Full name: \(employee.full_name)")
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                Text("UUID: \(uuid)")
                    .font(.system(size: 15))
                    .padding(.bottom, 10)
                Text("Phone number: \(employee.phone_number ?? "")")
                    .font(.system(size: 15))
                    .padding(.bottom, 10)
                Text("Email: \(employee.email_address)")
                    .font(.system(size: 15))
                    .padding(.bottom, 10)
                Text("Biography: \(employee.biography ?? "")")
                    .font(.system(size: 15))
                    .padding(.bottom, 10)
                Text("Employee type: \(employee.employee_type)")
                    .font(.system(size: 15))
                    .padding(.bottom, 10)
                Text("Team: \(employee.team)")
                    .font(.system(size: 15))
                    .padding(.bottom, 20)
                AsyncImage(url: image_url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } placeholder: {
                    Color.gray
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))

            }
        }
    }
    
    // For fetch the employee details from cashe
    var employeeToDisplay: [Employees] {
        return viewModel.employeesDetailsFromCashe.employees.filter{
            $0.uuid.contains(uuid)
        }
    }
}

struct EmployeeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailsView(uuid: "UUID")
    }
}
