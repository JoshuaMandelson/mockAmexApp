//
//  CardSubview.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 11/4/25.
//

import SwiftUI

struct ContentView: View {
    var name: String
    var picture: String
    var primaryColor: Color
    var secondaryColor: Color
    
    var body: some View {
        
        VStack {
            Text(name)
                .font(.headline)
                .padding(.bottom, 5)
                .foregroundColor(.white)

            VStack {
                
                Image(picture)
                    .resizable()
                    .frame(width: 200, height: 120)
                
            }
            .padding(50)
            .cornerRadius(20)
            
            VStack (alignment: .leading){
                Text("Total balance is:")
                Text("$\(Int.random(in: 1000..<5000))")
                    .font(.title)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(25)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.white)
            .background(Color.init(primaryColor))
            .cornerRadius(20)
            
            
            Button {
                
            } label: {
                HStack{
                    Image(systemName: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("MAKE PAYMENT")
                        .font(.title)
                        .fontWeight(.light)
                }
            }
            .padding()
            .frame(width: 300)
            .foregroundColor(.white)
            .background(Color.init(primaryColor))
            .cornerRadius(20)

            
        List {
            ForEach(0..<5, id: \.self) { index in
                Section {
                    HStack{
                        Text("Burger King")
                        Spacer()
                        Text("$\(Double.random(in: 5..<25).formatted(.number.precision(.fractionLength(2))))")
                    } .listRowBackground(Color(secondaryColor))

                    HStack{
                        Text("Burger King")
                        Spacer()
                        Text("$\(Double.random(in: 5..<25).formatted(.number.precision(.fractionLength(2))))")
                    } .listRowBackground(Color(secondaryColor))

                    HStack{
                        Text("Burger King")
                        Spacer()
                        Text("$\(Double.random(in: 5..<25).formatted(.number.precision(.fractionLength(2))))")
                    } .listRowBackground(Color(secondaryColor))
                    HStack{
                        Text("Burger King")
                        Spacer()
                        Text("$\(Double.random(in: 5..<25).formatted(.number.precision(.fractionLength(2))))")
                    } .listRowBackground(Color(secondaryColor))
                } header: {
                    Text("\(Calendar.current.date(byAdding: .day, value: -index * 7, to: Date.now)!.formatted(.dateTime.month().day()))")
                }
            }

        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .background(Color.init(primaryColor))
        .font(.title2)
        .fontWeight(.bold)
        .cornerRadius(25)
            
        Spacer()
        }
        

        
    }
    
}


