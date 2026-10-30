//
//  MealCardView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 29/10/26.
//

import SwiftUI

struct MealCardView: View {
    @Binding var meal: Meal

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "fork.knife")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .frame(width: 75, height: 75)
                .background(Circle().fill(Color("Lilac")))

            VStack(alignment: .leading, spacing: 8) {
                Text("Meal's name")
                    .font(.custom("PlusJakartaSans-Medium", size: 20))
                    .foregroundStyle(.primary)

                TextField("Ex.: Breakfast", text: $meal.name)
                    .font(.custom("PlusJakartaSans-Medium", size: 17))
                    .padding(.horizontal, 16)
                    .frame(height: 34)
                    .background(Capsule().fill(Color(.systemGray6)))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Time")
                    .font(.custom("PlusJakartaSans-Medium", size: 20))
                    .foregroundStyle(.primary)

                DatePicker("Time", selection: $meal.time, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .padding(.horizontal, 8)
                    .frame(height: 34)
                    .background(Capsule().fill(Color(.systemGray6)))
            }
        }
        .padding(.leading, 26)
        .padding(.trailing, 15)
        .frame(maxWidth: .infinity)
        .frame(height: 96)
        .background(Color(.systemBackground))
        .overlay(alignment: .leading) {
            Rectangle()
                .fill(Color("Lilac"))
                .frame(width: 10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.1), radius: 6, y: 2)
        .padding()
    }
}

#Preview {
    // No preview, o @State faz o papel de "dono" do dado
    @Previewable @State var meal = Meal()
    MealCardView(meal: $meal)
}
