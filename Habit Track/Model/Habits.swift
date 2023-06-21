//
//  Habits.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 20/06/23.
//

import Foundation

class Habits: ObservableObject {
    private static let habitsKey = "habits"
    
//    @Published var items = [Habit]()
    // custom data
//    Habit(habitName: "Morning Wake Up", description: "Wake up at 3 am, then salat tahajud, pray, study and salat subuh", completedTime: 0),
//    Habit(habitName: "Morning Wake", description: "Wake up at 3 am, then salat tahajud, pray, study and salat subuh", completedTime: 2)
    
    @Published var habitsActivity = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habitsActivity) {
                UserDefaults.standard.set(encoded, forKey: Self.habitsKey)
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.habitsKey) {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
                self.habitsActivity = decoded
                return
            }
        }
        
        self.habitsActivity = []
    }
    
    func add(habit: Habit) {
        habitsActivity.append(habit)
        sortHabits()
    }
    
    
    func getIndex(habitID: UUID) -> Int {
        if let index = habitsActivity.firstIndex(where: { $0.id == habitID }) {
            return index
        } else {
            return 0
        }
    }
    
    func sortHabits() {
        habitsActivity.sort(by: { $0.date > $1.date })
    }
}
