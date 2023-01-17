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
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack {
                      Image("me")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                        Spacer()
                    }
                }
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            print("arrow_clockwise")
                        } label: {
                            Image("arrow_clockwise")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                        }
                        Spacer().frame(width: 12)
                        Button {
                            print("caret_left")
                        } label: {
                            Image("caret_left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                        }
                        .disabled(false)
                        Spacer().frame(width: 12)
                        Button {
                            print("caret_right")
                        } label: {
                            Image("caret_right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                        }
                        .disabled(false)
                        Spacer().frame(width: 12)
                    }
                    Spacer().frame(height: 10)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
