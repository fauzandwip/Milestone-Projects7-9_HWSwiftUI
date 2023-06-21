//
//  EditHabitView.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 21/06/23.
//

import SwiftUI

struct EditHabitView: View {
    @ObservedObject var habits: Habits
    
    private var index: Int
    private var habit: Habit {
        habits.habitsActivity[index]
    }
    
    init(habits: Habits, habitID: UUID) {
        self.habits = habits
        self.index = habits.getIndex(habitID: habitID)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Text(habit.habitName)
                            .font(.title3.bold())
                            .foregroundColor(.yellow)
                        Text(habit.description)
                    }
                    .listRowSeparatorTint(.white)
                    .foregroundColor(.white)
                    
                    Stepper(habit.completedTime > 1 ?
                            "Completed \(habit.completedTime) Times" : "Completed \(habit.completedTime) Time",
                            value: $habits.habitsActivity[index].completedTime, in: 0...1000)
                }
                .scrollContentBackground(.hidden)
                .frame(height: 250)
                
                Spacer()
            }
            .navigationTitle("Edit Habit")
            .background(.gray)
            .preferredColorScheme(.dark)
            .onDisappear {
                habits.sortHabits()
            }
        }
    }
}

struct EditHabitView_Previews: PreviewProvider {
    static var previews: some View {
        EditHabitView(habits: Habits(), habitID: UUID())
    }
}
