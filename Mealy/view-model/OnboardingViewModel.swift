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
    var mealsPerDay: String = ""
    var nameErrorMessage: String?
    var mealsErrorMessage: String?
    
    func validateName() -> Bool {
        guard isFieldFilled(userName) else {
            nameErrorMessage = "Nome vazio"
            return false
        }
        
        nameErrorMessage = nil
        return true
    }
    
    func validateMeals() -> Bool {
        guard isFieldFilled(mealsPerDay) else {
            mealsErrorMessage = "Quantidade de refeições vazia"
            return false
        }
        
        mealsErrorMessage = nil
        return true
    }
    
    private func isFieldFilled(_ text: String) -> Bool {
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
