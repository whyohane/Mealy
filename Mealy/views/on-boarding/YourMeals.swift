//
//  YourMeals.swift
//  Mealy
//
//  Created by Yohane Cavalcante on 28/06/26.
//

import SwiftUI

struct YourMeals: View {
    
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
                    Text("How many meals do you eat every day?")
                        .font(.custom("ElmsSans-SemiBold", size: 20))
                        .foregroundStyle(.primary)
                    BasicTextField(placeholder: "Select the number...", text: $userName)
                        .padding(.bottom, 15)
                    
                    Button("Continue") {
                        
                    }
                    .font(.custom("ElmsSans-Bold", size: 20))
                    .disabled(userName.isEmpty)
                    .frame(maxWidth: .infinity)
                    .buttonStyle(GameButtonStyle())
                    Spacer()
                    
                    Image("UvaOpacity")
                    
                }
                .padding(.horizontal)
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationTitle("Mealy") // Simplificado (apenas a String)
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                // 1. Corrigido para .topBarLeading
                ToolbarItem(placement: .topBarLeading) {
                    Button {
//                        dismiss()
                    } label: {
                        // 2. Corrigido de traço para ponto
                        Image(systemName: "chevron.backward")
                            .fontWeight(.semibold) // Se quiser engrossar o ícone
                    }
                }
            }
            // NOTA: Lembre-se de adicionar isso para o botão nativo sumir:
            .navigationBarBackButtonHidden(true)
                
            }
        }
    }
    
    #Preview {
        YourMeals()
    }
