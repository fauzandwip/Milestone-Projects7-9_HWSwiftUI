//
//  ContentView.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    private var activities = [
        Activity(activityName: "Morning Wake Up", description: "Wake up at 3 am, then salat tahajud, pray, study and salat subuh", countTime: 0),
        Activity(activityName: "Morning Wake", description: "Wake up at 3 am, then salat tahajud, pray, study and salat subuh", countTime: 2)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities, id: \.activityName) { activity in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(activity.activityName)
                                .font(.headline)
                            Text(activity.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        VStack {
                            Text("\(activity.countTime)")
                                .font(.title3.bold())
                                .foregroundColor(activity.countTime > 0 ? .green : .orange)
                            Text(activity.countTime > 1 ? "Times" : "Time")
                                .font(.caption)
                        }
                    }
                    .padding()
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.gray)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Habits Track")
            .background(.gray)
            //            .preferredColorScheme(.dark)
            .toolbar {
                Image(systemName: "plus")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
