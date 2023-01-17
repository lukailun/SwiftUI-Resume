//
//  HomeView.swift
//  Resume
//
//  Created by lukailun on 2023/1/17.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .red, .pink],
                               startPoint: .leading,
                               endPoint: .bottom)
                VStack {
                    Spacer()
                    HStack {
                      Image("me")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
//                        Spacer()
                        Image("arrow_clockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
