//
//  ButtonStyle.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 17/06/26.
//

import SwiftUI

struct GameButtonStyle: ButtonStyle {
    var faceColor: Color = Color("ButtonPurple")
    var deepColor: Color = Color("ButtonBackground")
    var borderColor: Color = Color("ButtonBorder")
    
    var faceColorDisabled: Color = Color("ButtonPurpleDisabled")
    var deepColorDisabled: Color = Color("ButtonBackgroundDisabled")
    var FontDisabled: Color = Color("FontDisabled")
    
    let feedback = UIImpactFeedbackGenerator(style: .soft)
    @Environment(\.isEnabled) private var isEnabled
    
    private let borderWidth: CGFloat = 7
    private let lipHeight: CGFloat = 6
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // Borda externa
            Capsule()
                .fill(borderColor)
                .shadow(radius: 1, x: 0, y: 2)
            
            // Cor principal
            Capsule()
                .fill(isEnabled ? deepColor : deepColorDisabled)
                .padding(borderWidth)
            
            // Face do botão
            Capsule()
                .fill(isEnabled ? faceColor : faceColorDisabled)
                .padding(borderWidth)
                .shadow(color: .white.opacity(0.3), radius: 0, x: 0, y: 4)
                .overlay(
                    configuration.label
                        .foregroundColor(isEnabled ? .white : FontDisabled)
                            .font(.custom("ElmsSans-Bold", size: 20))
                )
                .offset(y: configuration.isPressed ? 0 : -lipHeight * 1.6)
        }
        .frame(height: 60)
        .animation(.easeOut(duration: 0.08), value: configuration.isPressed)
        .onChange(of: configuration.isPressed) { _, isPressed in
            if isPressed {
                feedback.impactOccurred()
            }
        }
    }
}
   
#Preview {
    Button("Continue") {

    }
    .font(.custom("ElmsSans-Bold", size: 20))
    .frame(maxWidth: .infinity)
    .buttonStyle(GameButtonStyle())
    .padding(.horizontal, 24)
}
