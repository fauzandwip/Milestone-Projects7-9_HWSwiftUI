//
//  Habit.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 14/06/23.
//

import Foundation

struct Habit: Identifiable {
    var id = UUID()
    let habitName: String
    let description: String
    let completedTime: Int
}
