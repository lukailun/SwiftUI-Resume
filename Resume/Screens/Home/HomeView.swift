//
//  HomeView.swift
//  Resume
//
//  Created by lukailun on 2023/1/17.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
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
                       BubbleView()
                            .environmentObject(viewModel)
                    }
                }
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ToolbarButton(imageName: "arrow_clockwise") {
                            viewModel.reset()
                        }
                        Spacer().frame(width: 12)
                        ToolbarButton(imageName: "caret_left", enabled: viewModel.isPreviousEnabled) {
                            viewModel.previous()
                        }
                        Spacer().frame(width: 12)
                        ToolbarButton(imageName: "caret_right", enabled: viewModel.isNextEnabled) {
                            viewModel.next()
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
    private func ToolbarButton(imageName: String, enabled: Bool = true, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .opacity(enabled ? 1 : 0.5)
        }
        .disabled(!enabled)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
