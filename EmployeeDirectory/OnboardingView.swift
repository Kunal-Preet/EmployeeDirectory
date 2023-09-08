//
//  OnboardingView.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var shouldShowOnboarding: Bool
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .padding(.bottom, 20)
                .font(.system(size: 36))
            Text(viewModel.subtitle)
                .padding(20)
                .font(.system(size: 24))
            Button(viewModel.buttonName) {
                shouldShowOnboarding.toggle()
            }
        }
    }
}
