//
//  HomeView.swift
//  CloneInstagram
//
//  Created by FX on 2021/09/14.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack {
            Text("Home View")
            Button(action: session.logout) {
                Text("Log Out").font(.title).modifier(ButtonModifiers())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
