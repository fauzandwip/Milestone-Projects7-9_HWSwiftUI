//
//  Modifier.swift
//  Habit Track
//
//  Created by Fauzan Dwi Prasetyo on 21/06/23.
//

import SwiftUI

struct SaveButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline.bold())
            .foregroundColor(.gray)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(.yellow)
            .clipShape(Capsule())
    }
}

extension Button {
    func saveButton() -> some View {
        modifier(SaveButton())
    }
}
