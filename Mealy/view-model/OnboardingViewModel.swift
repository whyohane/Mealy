//
//  OnboardingViewModel.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 23/07/26.
//

import Foundation
import Observation

@Observable
final class OnboardingViewModel {
    var userName: String = ""
    var mealsPerDay: Int = 1
    var nameErrorMessage: String?
    var mealsErrorMessage: String?
    
    func validateName() -> Bool {
        guard isFieldFilled(userName) else {
            nameErrorMessage = "Your name is empty"
            return false
        }
        
        nameErrorMessage = nil
        return true
    }
    
    func validateMeals() -> Bool {
        guard mealsPerDay > 0 else {
            mealsErrorMessage = "Select the number of meals"
            return false
        }
        
        mealsErrorMessage = nil
        return true
    }
        
    private func isFieldFilled(_ text: String) -> Bool {
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
