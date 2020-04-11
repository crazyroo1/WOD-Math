//
//  HomeView.swift
//  WOD Math
//
//  Created by Turner Eison on 4/10/20.
//  Copyright © 2020 Charles Eison. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var isActive = false
    var body: some View {
        VStack {
            Spacer()
            
            NavigationLink(destination: WODInputDetailsView()) {
                Text("WOD Score Calculator")
            }
            
            Spacer()
            
            Text("Barbell Loader")
            
            Spacer()
            
            Text("Conversions")
            
            Spacer()
        }
        .font(.headline)
        .navigationBarTitle("WOD Math")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView().previewDevice("iPhone 11 Pro Max")
            HomeView().previewDevice("iPhone SE")
        }
        
    }
}
