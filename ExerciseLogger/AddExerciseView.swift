//
//  AddExerciseView.swift
//  ExerciseLogger
//
//  Created by Philipp Hemkemeyer on 9/20/22.
//

import SwiftUI

struct AddExerciseView: View {
    
    @State var exerciseName: String = ""
    @State var exerciseReps: String = ""
    @State var exerciseWeight: String = ""
    
    @ObservedObject var myExercise: MyExercises
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            TextField("Exercise name", text: $exerciseName)
            TextField("Exercise reps", text: $exerciseReps)
                .keyboardType(.numberPad)
            TextField("Exercise weight", text: $exerciseWeight)
                .keyboardType(.numberPad)
            
            Button {
                let exercise = Exercise(name: exerciseName, reps: Int(exerciseReps) ?? 0, weight: Int(exerciseWeight) ?? 0)
                myExercise.addExercise(exercise: exercise)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Add set")
            }

        }
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(myExercise: MyExercises())
    }
}
