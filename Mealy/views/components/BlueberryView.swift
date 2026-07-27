//
//  BlueberryView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 27/07/26.
//

import SwiftUI

/// Mascote Blueberry com animação de flutuar e piscar os olhos.
/// Reutilizável em qualquer tela — basta chamar `BlueberryView()`.
struct BlueberryView: View {
    /// Escala geral do mascote. Escala imagem e offsets juntos, mantendo a proporção.
    var scale: CGFloat = 1

    @State private var isFloating = false
    @State private var isBlinking = false

    var body: some View {
        ZStack {
            Image("Blueberry-body")

            Image("Blueberry-eye-left")
                .scaleEffect(y: isBlinking ? 0.08 : 1, anchor: .center)
                .offset(x: -55, y: 75)

            Image("Blueberry-eye-right")
                .scaleEffect(y: isBlinking ? 0.08 : 1, anchor: .center)
                .offset(x: 55, y: 75)

            Image("Blueberry-cheeks")
                .offset(y: 110)

            Image("Blueberry-mouth")
                .offset(y: 105)
        }
        .offset(y: isFloating ? -12 : 0)
        .scaleEffect((isFloating ? 1.03 : 1) * scale, anchor: .bottom)
        .frame(maxWidth: .infinity)
        .animation(
            .easeInOut(duration: 1.2).repeatForever(autoreverses: true),
            value: isFloating
        )
        .onAppear {
            isFloating = true
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
    BlueberryView()
}
