//
//  MoranguView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 04/08/26.
//

import SwiftUI


struct MoranguView: View {
    
    var scale: CGFloat = 1
    
    @State private var isFloating = false
    @State private var isBlinking = false
    
    var body: some View {
        ZStack {
            Image("Morangu-body")

            Image("Morangu-eye-left")
                .scaleEffect(y: isBlinking ? 0.08 : 1, anchor: .center)
                .offset(x: -58, y: 75)
                .animation(.easeInOut(duration: 0.08), value: isBlinking)

            Image("Morangu-eye-right")
                .scaleEffect(y: isBlinking ? 0.08 : 1, anchor: .center)
                .offset(x: 58, y: 75)
                .animation(.easeInOut(duration: 0.08), value: isBlinking)

            Image("Morangu-mouth")
                .offset(y: 110)
        }
        .offset(y: isFloating ? -12 : 0)
        .scaleEffect((isFloating ? 1.03 : 1) * scale, anchor: .bottom)
        .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: isFloating)
        .frame(maxWidth: .infinity)
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
            isBlinking = true
            try? await Task.sleep(for: .milliseconds(120))
            isBlinking = false
        }
    }
}

#Preview {
    MoranguView()
}
