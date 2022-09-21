//
//  Exercise.swift
//  ExerciseLogger
//
//  Created by Philipp Hemkemeyer on 9/20/22.
//

import Foundation

struct Exercise: Identifiable, Codable {
    var id = UUID()
    var name: String
    var reps: Int
    var weight: Int
}

// UserDefaults

class MyExercises: Identifiable, ObservableObject {
    
    // Notify for changes
    @Published var exercises: [Exercise]
    
    // Initialize exercise variable every start - when nothing saved create new file
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedExercises") {
            if let decoded = try? JSONDecoder().decode([Exercise].self, from: data){
                self.exercises = decoded
                return
            }
        }
        // if nothing in UserDefaults create empty array
        self.exercises = []
    }
    
    // Save data onto device - needs to be used every time something changes
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self.exercises) {
            UserDefaults.standard.set(encoded, forKey: "SavedExercises")
        }
    }
    
    func addExercise(exercise: Exercise) {
        // add new exercise at the beginning - so the newest is at the topmost
        self.exercises.insert(exercise, at: 0)
        
        // Save new exercise onto device
        self.save()
    }
}

