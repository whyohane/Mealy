//
//  Meal.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 29/10/26.
//

import Foundation

struct Meal: Identifiable, Hashable {
    let id: UUID
    var name: String
    var time: Date

    init(id: UUID = UUID(), name: String = "", time: Date = Date()) {
        self.id = id
        self.name = name
        self.time = time
    }
}
