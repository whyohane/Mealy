//
//  YourNameView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 25/06/26.
//

import SwiftUI

struct YourNameView: View {
    @State private var viewModel = OnboardingViewModel()
    @State private var shouldShowMealsView = false
    
    var body: some View {

        @Bindable var viewModel = viewModel
        
        return VStack(alignment: .leading, spacing: 20) {
            Text("What's your name?")
                .font(.custom("ElmsSans-SemiBold", size: 20))
                .foregroundStyle(.primary)
            BasicTextField(placeholder: "Type here your name...", text: $viewModel.userName)

            if let nameErrorMessage = viewModel.nameErrorMessage {
                Text(nameErrorMessage)
                    .font(.custom("ElmsSans-Medium", size: 14))
                    .foregroundStyle(.red)
            }

            Button("Continue") {
                guard viewModel.validateName() else { return }
                shouldShowMealsView = true
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .font(.custom("ElmsSans-Bold", size: 20))
        .frame(maxWidth: .infinity)
        .buttonStyle(GameButtonStyle())
        .overlay(alignment: .bottom) {
            BlueberryView()
                .padding(.bottom, -15)
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationTitle(Text("Mealy"))
        .toolbarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $shouldShowMealsView) {
            YourMeals()
        }
    }
}

#Preview {
    NavigationStack {
        YourNameView()
    }
}
