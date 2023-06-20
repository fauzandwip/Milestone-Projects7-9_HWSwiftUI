//
//  AddHabitView.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 20/06/23.
//

import SwiftUI

struct AddHabitView: View {
    @State private var title = ""
    @State private var description = ""
    @State private var completedTimes = 1
    
    var body: some View {
//        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("title", text: $title)
                        
                        TextField("description", text: $description)
                    }
                    .listRowSeparatorTint(.white)
                    .foregroundColor(.white)
                    
                    Stepper(completedTimes > 1 ?
                            "Completed \(completedTimes) Times" : "Completed \(completedTimes) Time"
                            , value: $completedTimes, in: 0...100)
                }
                .scrollContentBackground(.hidden)
                
                Spacer()
            }
            .navigationTitle("Add Habit")
            .background(.gray)
            .toolbar {
                Button("SAVE") {
                    
                }
            }
//        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
                    .preferredColorScheme(.dark)
    }
}
