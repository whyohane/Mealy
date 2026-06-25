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
    
    private let borderWidth: CGFloat = 7
    private let lipHeight: CGFloat = 6
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
//          Borda externa
            Capsule()
                .fill(borderColor)
                .shadow(radius: 1, x:0, y:2)
            
//          Cor principal
            Capsule()
                .fill(deepColor)
                .padding(borderWidth)
            
//          Borda estática
            Capsule()
            
                .fill(faceColor)
                .padding(borderWidth)
                .shadow(color: .white.opacity(0.3), radius: 0, x: 0, y: 4)
                .overlay(
                    configuration.label
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                )
                
                .offset(y: configuration.isPressed ? 0 : -lipHeight*1.6)
        }
        .frame(height: 60)
        .animation(.easeOut(duration: 0.08), value: configuration.isPressed)
    }
}

   
#Preview {
    Button("Continue") {

    }
    .frame(maxWidth: .infinity)
    .buttonStyle(GameButtonStyle())
    .padding(.horizontal, 24)
}
