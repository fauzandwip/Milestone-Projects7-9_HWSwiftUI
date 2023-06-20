//
//  ContentView.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var habits = Habits()
    @State private var showAddHabitView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                
                if !habits.items.isEmpty {
                    List {
                        ForEach(habits.items) { habit in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(habit.habitName)
                                        .font(.headline)
                                    Text(habit.description)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                                
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                
                                VStack {
                                    Text("\(habit.completedTime)")
                                        .font(.title3.bold())
                                        .foregroundColor(habit.completedTime > 0 ? .green : .red)
                                    Text(habit.completedTime > 1 ? "Times" : "Time")
                                        .font(.caption)
                                }
                            }
                            .padding()
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.gray)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Habits Track")
            .background(.gray)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showAddHabitView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddHabitView) {
                AddHabitView(habits: habits)
            }
        }
        .accentColor(Color.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
