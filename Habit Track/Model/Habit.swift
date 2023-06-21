//
//  Habit.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 14/06/23.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var habitName: String {
        didSet { date = Date() }
    }
    
    var description: String {
        didSet { date = Date() }
    }
    
    var completedTime: Int {
        didSet { date = Date() }
    }
    
    var date = Date()
}
