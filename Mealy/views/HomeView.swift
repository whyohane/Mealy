//
//  HomeView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 25/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var shouldShowNameView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if shouldShowNameView {
                    YourNameView()
                        .navigationBarBackButtonHidden(true)
                        .transition(.opacity.combined(with: .scale(scale: 0.98)))
                } else {
                    splashContent
                        .transition(.opacity.combined(with: .scale(scale: 1.03)))
                }
            }
            .animation(.easeInOut(duration: 0.35), value: shouldShowNameView)
            .task {
                try? await Task.sleep(for: .seconds(1))
                shouldShowNameView = true
            }
        }
    }
    
    private var splashContent: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top, spacing: 3) {
                    Text("Mealy")
                        .font(.custom("ElmsSans-ExtraBold", size: 90))
                        .foregroundStyle(.primary)
                    
                    Image("Glitter")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.primary)
                        .frame(width: 50, height: 50)
                        .padding(.top, 18)
                }
                
                Text("The best way to track your\ndaily meals")
                    .font(.custom("ElmsSans-Semibold", size: 20))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .padding(.top, 40)
            
            Spacer()
            
            Image("Fruits")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HomeView()
}
