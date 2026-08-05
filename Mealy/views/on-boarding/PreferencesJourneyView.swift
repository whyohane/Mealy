//
//  PreferencesJourneyView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 04/08/26.
//
import SwiftUI

struct PreferencesJourneyView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        return VStack(alignment: .leading, spacing: 20) {
            Text("Choose your journey")
                .font(.custom("ElmsSans-SemiBold", size: 20))
                .foregroundStyle(.primary)
            JourneysView()
                .clipShape(RoundedRectangle(cornerRadius: 20))
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
                }
            }
        }
        .overlay(alignment: .bottom) {
            LaranjicaView()
                .padding(.bottom, -15)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
#Preview {
    NavigationStack {
        PreferencesJourneyView()
    }
}
