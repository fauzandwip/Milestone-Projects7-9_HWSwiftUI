//
//  Habit.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 14/06/23.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    let habitName: String
    let description: String
    var completedTime: Int
}
