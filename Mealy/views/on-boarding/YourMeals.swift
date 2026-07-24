//
//  YourMeals.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 28/06/26.
//

import SwiftUI

struct YourMeals: View {
    @State private var viewModel = OnboardingViewModel()
    @State private var shouldShowDailyMealsView: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        return VStack(alignment: .leading) {
            Text("How many meals do you eat every day?")
                .font(.custom("ElmsSans-SemiBold", size: 20))
                .foregroundStyle(.primary)
            NumberPickerField(
                placeholder: "Select the number...",
                options: Array(1...10),
                selected: Binding(
                    get: { viewModel.mealsPerDay },
                    set: { viewModel.mealsPerDay = $0 ?? 1 }
                )
            )
            
            if let mealsErrorMessage = viewModel.mealsErrorMessage {
                Text(mealsErrorMessage)
                    .font(.custom("ElmsSans-Medium", size: 14))
                    .foregroundStyle(.red)
            }
            
            Button("Continue") {
                
                shouldShowDailyMealsView = true
                guard viewModel.validateMeals() else { return }
            }
            .padding(.top, 10)
            .font(.custom("ElmsSans-Bold", size: 20))
            .frame(maxWidth: .infinity)
            .buttonStyle(GameButtonStyle())

            Spacer()
            
            Image("Abacaxinho")
        }
        .padding(.horizontal)
        .ignoresSafeArea(edges: .bottom)
        .navigationTitle("Mealy")
        .toolbarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationDestination(isPresented: $shouldShowDailyMealsView) {
           SetDailyMealsView()
        }
    }
}

#Preview {
    NavigationStack {
        YourMeals()
    }
}
