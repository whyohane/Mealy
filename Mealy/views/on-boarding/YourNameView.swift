//
//  YourNameView.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 25/06/26.
//

import SwiftUI

struct YourNameView: View {
    
    @State private var userName: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(
                    colors: [
                        Color(.systemBackground),
                        Color("GradientBackground")
                    ],
                    startPoint: .center,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("What's your name?")
                        .font(.custom("ElmsSans-SemiBold", size: 20))
                        .foregroundStyle(.primary)
                    BasicTextField(placeholder: "Type here your name...", text: $userName)
                        .padding(.bottom, 15)
                    
                    Button("Continue") {
                        
                    }
                    .font(.custom("ElmsSans-Bold", size: 20))
                    .disabled(userName.isEmpty)
                    .frame(maxWidth: .infinity)
                    .buttonStyle(GameButtonStyle())
                    Spacer()
                    
                    Image("AbacaxiOpacity")
                    
                }
                .padding(.horizontal)
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationTitle(Text("Mealy"))
//            .font(.custom("ElmsSans-SemiBold", size: 15))
            .toolbarTitleDisplayMode(.inline)
            
            
        }
    }
}

#Preview {
    YourNameView()
}
