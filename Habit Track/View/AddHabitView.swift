//
//  AddHabitView.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 20/06/23.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var habitName = ""
    @State private var description = ""
    @State private var completedTime = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("habitName", text: $habitName)
                        
                        TextField("description", text: $description)
                    }
                    .listRowSeparatorTint(.white)
                    .foregroundColor(.white)
                }
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                .frame(height: 150)
                
                Button("SAVE") {
                    let habit = Habit(habitName: habitName, description: description, completedTime: completedTime)
                    habits.habitsActivity.insert(habit, at: 0)
                    dismiss()
                }
                .saveButton()
                
                Spacer()
            }
            .navigationTitle("Add Habit")
            .background(.gray)
            .preferredColorScheme(.dark)
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
