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
                        ToolbarButton(imageName: "arrow_clockwise") {
                            print("arrow_clockwise")
                        }
                        Spacer().frame(width: 12)
                        ToolbarButton(imageName: "caret_left", disabled: false) {
                            print("caret_left")
                        }
                        Spacer().frame(width: 12)
                        ToolbarButton(imageName: "caret_right", disabled: false) {
                            print("caret_right")
                        }
                        Spacer().frame(width: 12)
                    }
                    Spacer().frame(height: 10)
                }
            }
        }
    }
}

extension HomeView {
    private func ToolbarButton(imageName: String, disabled: Bool? = nil, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
        }
        .disabled(disabled ?? false)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
