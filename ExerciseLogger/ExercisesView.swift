//
//  ExercisesView.swift
//  ExerciseLogger
//
//  Created by Philipp Hemkemeyer on 9/20/22.
//

import SwiftUI

struct ExercisesView: View {
    
    @ObservedObject var myExercises = MyExercises()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(myExercises.exercises) { exercise in
                    ExercisesListView(exercise: exercise)
                }
            }
            .navigationTitle("Exercise Logger")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: AddExerciseView(myExercise: myExercises), label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
