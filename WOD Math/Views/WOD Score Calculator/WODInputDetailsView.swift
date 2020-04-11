//
//  WODInputDetailsView.swift
//  WOD Math
//
//  Created by Turner Eison on 4/10/20.
//  Copyright © 2020 Charles Eison. All rights reserved.
//

import SwiftUI

struct WODInputDetailsView: View {
    @State var movementCount = 0
    @State var movementReps: [Double] = [Double](repeating: 0, count: 300)
    
    var body: some View {
        VStack {
            VStack {
                Text("Enter the number of movements per round")
                Stepper("\(movementCount)", value: $movementCount, in: 0...20)
            }
            .padding()
            .background(Color.gray)
            .cornerRadius(12)
            .padding()
            
            if movementCount > 0 {
                List(0..<movementCount, id: \.hashValue) { i in
                    VStack {
                        Text("Movement \(i + 1)")
                        Stepper("\(Int(self.movementReps[i])) \(Int(self.movementReps[i]) == 1 ? "rep" : "reps") prescribed", value: self.$movementReps[i], in: 0...300)
                        Slider(value: self.$movementReps[i], in: 0...300)
                    }.animation(nil)
                }
                .animation(.default)
            }
            
            Spacer()
            
            if movementCount > 0 && movementReps.filter{$0>0}.count == movementCount {
                NavigationLink(destination: WODInputResultsView(movementReps: movementReps.filter{ $0 > 0 } )) {
                    Text("Enter Results").font(.title)
                }
            }
        }
        .padding()
        .navigationBarTitle("WOD Details")
    }
}

struct WODInputDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WODInputDetailsView().previewDevice(.init(rawValue: "iPhone 11 Pro Max")).previewDisplayName("iPhone 11 Pro Max")
            WODInputDetailsView().previewDevice(.init(rawValue: "iPhone SE")).previewDisplayName("iPhone SE")
        }
    }
}
