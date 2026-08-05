//
//  LaranjicaView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 04/08/26.
//

import SwiftUI

struct LaranjicaView: View {
    
    var scale: CGFloat = 1
    
    @State private var isFloating = false
    @State private var isBlinking = false
    
    var body: some View {
        ZStack {
            Image("Laranjica-body")
            
            Image("Laranjica-face")
                .offset(y: 80)
        }
        .offset(y: isFloating ? -12 : 0)
        .scaleEffect((isFloating ? 1.03 : 1) * scale, anchor: .bottom)
        .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: isFloating)
        .frame(maxWidth: .infinity)
        .onAppear {
            isFloating = true
        }
    }
}

#Preview {
    LaranjicaView()
}

