//
//  SetDailyMealsView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 24/07/26.
//

import SwiftUI

struct SetDailyMealsView: View {
    
    @Bindable var viewModel: OnboardingViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var shouldShowPreferencesJourneyView: Bool = false

    var body: some View {
        return VStack(alignment: .leading, spacing: 20) {
            Text("Set your daily meals")
                .font(.custom("ElmsSans-SemiBold", size: 20))
                .foregroundStyle(.primary)

            // One card per meal the user chose in the previous step
            ScrollView {
                VStack(spacing: 0) {
                    ForEach($viewModel.meals) { $meal in
                        MealCardView(meal: $meal)
                    }
                }
            }

            Button("Continue") {
                shouldShowPreferencesJourneyView = true
            }
            .buttonStyle(GameButtonStyle())
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
                        .symbolEffectsRemoved()
                }
            }

            ToolbarItem(placement: .confirmationAction) {
                Button {

                } label: {
                    Image(systemName: "plus")
                        .fontWeight(.semibold)
                        .symbolEffectsRemoved()
                }
                .buttonStyle(.glassProminent)
                .tint(Color("ButtonPurple"))
            }

        }
        .navigationDestination(isPresented: $shouldShowPreferencesJourneyView) {
           PreferencesJourneyView()
        }
        .overlay(alignment: .bottom) {
            MoranguView()
                .padding(.bottom, -15)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
#Preview {
    let viewModel = OnboardingViewModel()
    viewModel.mealsPerDay = 3
    viewModel.prepareMeals()
    return NavigationStack {
        SetDailyMealsView(viewModel: viewModel)
    }
}
