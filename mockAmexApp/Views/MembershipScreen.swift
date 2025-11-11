//
//  MembershipScreen.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 11/5/25.
//

import SwiftUI

struct MembershipScreen: View {
    @StateObject var viewModel = MembershipViewModel()
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [
                Color(red: 0/255, green: 50/255, blue: 100/255),
                Color(red: 0/255, green: 15/255, blue: 20/255)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            VStack {
                Text("Membership")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                ScrollView {
                    VStack{
                        VStack(alignment: .leading) {
                            Text("Membership Rewards Points:")
                            Text("\(Int.random(in: 0...50000))")
                        }
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 300)
                        .padding()
                        .background(Color(red: 0.0, green: 0.0, blue: 0.2))
                        .cornerRadius(15)
                        HStack {
                            Button{
                                
                            } label: {
                                Text("Redeem Rewards")
                                    .padding()
                                    .background(Color(red: 0.0, green: 0.0, blue: 0.2))
                                    .cornerRadius(10)
                            }
                            
                            Button{
                                
                            } label: {
                                Text("Rewards Summary")
                                    .padding()
                                    .background(Color(red: 0.0, green: 0.0, blue: 0.2))
                                    .cornerRadius(10)
                            }
                        }
                        
                        VStack{
                            HStack{
                                Image(systemName: "clock")
                                Text("Exclusive Offer!")
                            }
                            .foregroundColor(.white)
                            .padding()
                            
                            Text("Get rewards for referrals")
                                .foregroundColor(.white)
                                .padding()

                            Button{
                                
                            } label: {
                                HStack {
                                    Image(systemName: "person")
                                    Text("Refer a Business")
                                        .padding()
                                }
                            }
                        }
                        .frame(width: 300)
                        .padding()
                        .background(Color(red: 0.0, green: 0.0, blue: 0.2))
                        .cornerRadius(15)
                        VStack {
                            Text("Explore Benefits")
                                .font(.title)
                                .fontWeight(.bold)
                            ScrollView(.horizontal) {
                                HStack{
                                    ForEach(viewModel.membership) { membershipCard in
                                        VStack{
                                            Image(membershipCard.picture)
                                                .resizable()
                                                .frame(height: 150)
                                            Text(membershipCard.title)
                                            
                                        }
                                        .padding()
                                        .background(Color(red: 0.0, green: 0.196, blue: 0.392))
                                        .cornerRadius(15)
                                        .padding()
                                        .frame(width: 300, height: 300)
                                    }
                                    
                                }
                                .scrollTargetLayout()
                                .padding(.horizontal, (UIScreen.main.bounds.width - 300) / 2)
                            }
                            .scrollTargetBehavior(.viewAligned)
                            .scrollIndicators(.hidden)
                        }
                        .padding(.vertical)
                        .foregroundColor(.white)
                        .background(Color(red: 0.0, green: 0.0, blue: 0.2))
                        
                        HStack{
                            ZStack(alignment: .bottom) {
                                Image("florida")
                                    .resizable()
                                    .frame(width: 175, height: 150)
                                Text("Book Travel")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .cornerRadius(15)
                            ZStack(alignment: .bottom) {
                                Image("game")
                                    .resizable()
                                    .frame(width: 175, height: 150)
                                Text("Access Amex \nExperiences")
                                    .font(.callout)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .cornerRadius(15)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchCard()
        }
    }
}

#Preview {
    MembershipScreen()
}
