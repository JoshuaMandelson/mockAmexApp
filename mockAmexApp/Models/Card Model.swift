//
//  Card Model.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 10/31/25.
//
import SwiftUI
import Foundation

struct Card: Identifiable {
    var id = NSUUID().uuidString

    let name: String
    let picture: String
    let primaryColor: Color
    let secondaryColor: Color
    
    
}
