//
//  Habits.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 20/06/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [
        Habit(habitName: "Morning Wake Up", description: "Wake up at 3 am, then salat tahajud, pray, study and salat subuh", completedTime: 0),
        Habit(habitName: "Morning Wake", description: "Wake up at 3 am, then salat tahajud, pray, study and salat subuh", completedTime: 2)
    ]
//    @Published var items = [Habit]()
}
