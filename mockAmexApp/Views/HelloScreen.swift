//
//  HelloScreen.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 11/4/25.
//

import SwiftUI

struct HelloScreen: View {
    @StateObject var viewModel = CardViewModel()

    var body: some View {
        TabView {
            ZStack {
                LinearGradient(colors: [
                    Color(red: 0/255, green: 50/255, blue: 100/255),
                    Color(red: 0/255, green: 15/255, blue: 20/255)
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                ScrollView {
                    VStack {
                        HStack {
                            VStack (alignment: .leading){
                                Text("\(Date.now.formatted(.dateTime.month().day().year()))")
                                    .font(.subheadline)
                                Text("Welcome")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 40)
                            }
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text("Accounts")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        ForEach(viewModel.card) { Card in
                            cardMiniView(name: Card.name, image: Card.picture)
                                .padding(2)
                        }
                        Spacer()
                        HStack {
                            Text("Rewards")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.top, 40)
                            Spacer()
                        }
                        RewardsView()
                            
                        HStack {
                            Text("Financial Insights")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.vertical, 40)
                        VStack {
                            Text("Weekly Spending")
                            ChartView()

                        }
                        
                        Text("Member Since")
                            .padding(.top, 50)
                        Text("\(Date.now.formatted(.dateTime.year()))")
                    }
                    .padding()
                }

            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
        CardsScreen()
            .tabItem {
                Label("Cards", systemImage: "creditcard")
            }
            MembershipScreen()
                .tabItem {
                    Label("Membership", systemImage: "star.hexagon")
                }

        }
        .onAppear{
            viewModel.fetchCard()
        }
        .tint(.white)
        .foregroundColor(.white)
    }
}
//MARK: - CARD MINIVIEW

struct cardMiniView: View {
    var name: String
    var image: String
    
    var body: some View {
        let randomNum = Int.random(in: 1...29)
        HStack {
            Image(image)
                .resizable()
                .frame(width: 100, height: 50)
            Spacer()
            VStack{
                Text("$\(Int.random(in: 1000...5000)) - Statement Due \((Calendar.current.date(byAdding: .day, value: +randomNum, to: Date.now)!.formatted(.dateTime.month().day())))")
                    .font(.footnote)
                    .padding(.vertical, 5)
                Text("\(name) (****1\(Int.random(in: 100...999)))")
                    .font(.footnote)
            }
        }
        .padding(10)
        .background(Color(red: 0.0, green: 0.0, blue: 0.2))
        .cornerRadius(10)
    }
}
//MARK: - REWARDS SUB VIEW

struct RewardsView: View {
    var body: some View {
        VStack() {
            HStack{
                Image(systemName: "star.hexagon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                Text("\(Int.random(in: 100...50000)) Points")
                    .font(.largeTitle)
                Spacer()
            }
            Button{
                
            } label: {
                Text("Redeem Rewards")
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
            }
            .padding(.trailing, 100)
        }
    }
}

//MARK: - CHART SUBVIEW
import Charts

struct PetData: Identifiable {
    let id = UUID()
    let week: String
    let amount: Int
}

struct ChartView: View {
    @State private var selectedDate: String?
    let weeks = [
        PetData(week: "\(Calendar.current.date(byAdding: .day, value: -28, to: Date.now)!.formatted(.dateTime.month().day()))", amount: Int.random(in: 200...800)),
        PetData(week: "\(Calendar.current.date(byAdding: .day, value: -21, to: Date.now)!.formatted(.dateTime.month().day()))", amount: Int.random(in: 200...800)),
        PetData(week: "\(Calendar.current.date(byAdding: .day, value: -14, to: Date.now)!.formatted(.dateTime.month().day()))", amount: Int.random(in: 200...800)),
        PetData(week: "\(Calendar.current.date(byAdding: .day, value: -7, to: Date.now)!.formatted(.dateTime.month().day()))", amount: Int.random(in: 200...800)),
        PetData(week: "\(Calendar.current.date(byAdding: .day, value: -0, to: Date.now)!.formatted(.dateTime.month().day()))", amount: Int.random(in: 200...800)),
    ]
    var body: some View {
        VStack(spacing: 20) {
            Chart(weeks) { week in
                BarMark(
                    x: .value("Week", week.week),
                    y: .value("Amount", week.amount)
                )
                .foregroundStyle(selectedDate == week.week ? .blue : Color(red: 0.0, green: 0.196, blue: 0.392))
                .opacity(selectedDate == nil || selectedDate == week.week ? 1.0 : 0.3)
                
                if selectedDate == week.week {
                    PointMark(
                        x: .value("Week", week.week),
                        y: .value("Amount", week.amount)
                    )
                    .symbolSize(200)
                    .foregroundStyle(.blue)
                    .annotation(position: .top, spacing: 10) {
                        VStack(spacing: 4) {
                            Text("Week of: \(week.week)")
                                .font(.headline)
                            Text("$\(week.amount)")
                                .font(.subheadline)
                        }
                        .padding(8)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.0, green: 0.196, blue: 0.392))
                                .shadow(radius: 4)
                        )
                    }
                }
                
            }
            .chartXSelection(value: $selectedDate)
            .frame(height: 300)
            .padding()
            .chartYScale(domain: 0...1000)
        }
        
    }
}



#Preview {
    HelloScreen()
}
