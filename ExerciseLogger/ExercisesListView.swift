//
//  ExercisesListView.swift
//  ExerciseLogger
//
//  Created by Philipp Hemkemeyer on 9/20/22.
//

import SwiftUI

struct ExercisesListView: View {
    
    var exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Exercise: \(exercise.name)")
            
            Text("Reps: \(exercise.reps)")
            
            Text("Weight: \(exercise.weight)")
        }
    }
}

struct ExercisesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesListView(exercise: Exercise(name: "Push-Ups", reps: 12, weight: 0))
    }
}
