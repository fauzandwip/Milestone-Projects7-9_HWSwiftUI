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
                    
                    Stepper(completedTime > 1 ?
                            "Completed \(completedTime) Times" : "Completed \(completedTime) Time"
                            , value: $completedTime, in: 0...100)
                }
                .scrollContentBackground(.hidden)
                .frame(height: 250)
                
                Button("SAVE") {
                    let habit = Habit(habitName: habitName, description: description, completedTime: completedTime)
                    habits.items.insert(habit, at: 0)
                    dismiss()
                }
                .foregroundColor(.primary)
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .background(.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke()
                        .scale(1)
                }
                
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
            .preferredColorScheme(.dark)
    }
}
