//
//  WODInputResultsView.swift
//  WOD Math
//
//  Created by Turner Eison on 4/10/20.
//  Copyright © 2020 Charles Eison. All rights reserved.
//

import SwiftUI

struct WODInputResultsView: View {
    var movementReps: [Double]
    @State var roundsCompleted = 0
    @State var additionalReps = [Double](repeating: 0, count: 20)
    var body: some View {
        VStack {
            VStack {
                Text("Enter the number of rounds fully completed")
                Stepper("\(roundsCompleted)", value: $roundsCompleted, in: 0...50)
            }
            .padding()
            .background(Color.gray)
            .cornerRadius(12)
            .padding()
            
            Text("Enter number of additional reps completed for each movement below")
            
            List(0..<movementReps.count, id: \.hashValue) { i in
                VStack {
                    Text("Movement \(i + 1)")
                    Stepper("\(Int(self.additionalReps[i])) additional \(Int(self.additionalReps[i]) == 1 ? "rep" : "reps") completed", value: self.$additionalReps[i], in: 0...self.movementReps[i])
                    Slider(value: self.$additionalReps[i], in: 0...self.movementReps[i])
                }
            }
            
            Spacer()
            if roundsCompleted > 0 {
                NavigationLink(destination: WODScoreView(movementReps: movementReps.filter{$0>0}.map{Int($0)}, fullRoundsCompleted: roundsCompleted, additionalRepsCompleted: additionalReps.filter{$0>0}.map{Int($0)})) {
                    Text("Calculate").font(.title)
                }
            }
        }.navigationBarTitle("Enter Results")
    }
}

struct WODInputResultsView_Previews: PreviewProvider {
    static var previews: some View {
        WODInputResultsView(movementReps: [Double](repeating: 1000, count: 100))
    }
}
