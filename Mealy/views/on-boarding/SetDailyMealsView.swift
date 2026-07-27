//
//  SetDailyMealsView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 24/07/26.
//

import SwiftUI

struct SetDailyMealsView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
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

            ToolbarItem(placement: .confirmationAction) {
                Button {

                } label: {
                    Image(systemName: "plus")
                        .fontWeight(.semibold)
                }
                .tint(Color.indigo)
            }
        }
    }
}
#Preview {
    NavigationStack {
        SetDailyMealsView()
    }
}
