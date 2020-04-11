//
//  WODScoreView.swift
//  WOD Math
//
//  Created by Turner Eison on 4/10/20.
//  Copyright © 2020 Charles Eison. All rights reserved.
//

import SwiftUI

struct WODScoreView: View {
    var movementReps: [Int]
    var fullRoundsCompleted: Int
    var additionalRepsCompleted: [Int]
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Stats").font(.title)
                Text("Reps Per Round").font(.headline)
                Text("\(movementReps.reduce(0, +))")
                Text("Full Rounds Completed").font(.headline)
                Text("\(fullRoundsCompleted)")
                Text("Additional Reps Completed").font(.headline)
                Text("\(additionalRepsCompleted.reduce(0, +))")
            }
            .padding()
            .padding([.leading, .trailing])
            .background(Color.gray)
            .cornerRadius(12)
            .padding()
            
            
            Spacer()
            
            VStack {
                Text("Score").font(.title)
                Text("\(calculateScore)")
            }
            .padding()
            .padding(.horizontal)
            .background(Color.green)
            .cornerRadius(12)
            .padding()
            
            Spacer()
        }.navigationBarTitle("Great Job!")
    }
    
    var calculateScore: Int {
        let totalReps = movementReps.reduce(0, +)
        let pointsFromFullRounds = totalReps * fullRoundsCompleted
        
        let pointsFromAdditionalReps = additionalRepsCompleted.reduce(0, +)
        
        let totalPoints = pointsFromFullRounds + pointsFromAdditionalReps
        
        return totalPoints
    }
}

struct WODScoreView_Previews: PreviewProvider {
    static var previews: some View {
        WODScoreView(movementReps: [5], fullRoundsCompleted: 5, additionalRepsCompleted: [5])//.previewDevice("iPhone SE")
    }
}
