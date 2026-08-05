//
//  AbacaxinhoView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 27/07/26.
//

import SwiftUI


struct AbacaxinhoView: View {
    
    var scale: CGFloat = 1

    @State private var isFloating = false
    @State private var isBlinking = false

    var body: some View {
        ZStack {
            Image("Abacaxinho-body")

            Image("Abacaxinho-eye-left")
                .scaleEffect(y: isBlinking ? 0.08 : 1, anchor: .center)
                .offset(x: 55, y: 85)

            Image("Abacaxinho-eye-right")
                .scaleEffect(y: isBlinking ? 0.08 : 1, anchor: .center)
                .offset(x: -55, y: 85)

            Image("Abacaxinho-cheeks")
                .offset(y: 120)

            Image("Abacaxinho-mouth")
                .offset(y: 135)
        }
        .offset(y: isFloating ? -12 : 0)
        .scaleEffect((isFloating ? 1.03 : 1) * scale, anchor: .bottom)
        .frame(maxWidth: .infinity)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                isFloating = true
            }
        }
        .task {
            await blinkEyes()
        }
    }

    private func blinkEyes() async {
        while !Task.isCancelled {
            try? await Task.sleep(for: .seconds(2))

            withAnimation(.easeIn(duration: 0.08)) {
                isBlinking = true
            }

            try? await Task.sleep(for: .milliseconds(120))

            withAnimation(.easeOut(duration: 0.08)) {
                isBlinking = false
            }
        }
    }
}

#Preview {
    AbacaxinhoView()
}
