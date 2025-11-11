//
//  SwiftUIView.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 10/30/25.
//

import SwiftUI

//MARK: - VIEW
struct CardsScreen: View {
    @StateObject var viewModel = CardViewModel()
    
    var body: some View {
            ZStack {
                LinearGradient(colors: [
                    Color(red: 0/255, green: 50/255, blue: 100/255),
                    Color(red: 0/255, green: 15/255, blue: 20/255)
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                ScrollView(.horizontal){
                    
                    HStack{
                        
                        ForEach(viewModel.card) { Card in
                            ContentView(name: Card.name, picture: Card.picture, primaryColor: Card.primaryColor, secondaryColor: Card.secondaryColor)
                                .frame(width: 300)
                                .scrollTransition(.animated) { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0.5)
                                        .offset(y: phase.isIdentity ? 0 : -50)
                                        .scaleEffect(phase.isIdentity ? 1 : 0.9)
                                    
                                }
                        }
                    }
                    .padding(.horizontal, (UIScreen.main.bounds.width - 300) / 2)
                }
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
            }
            
        .onAppear {
            viewModel.fetchCard()
        }
    }
}



#Preview {
    CardsScreen()
}
