//
//  OnboardingViewModel.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var title: String = "Employee Directory!"
    @Published var subtitle: String = "See the employee details, contact information and pictures of the employees."
    @Published var buttonName: String = "Get Started"
}

