//
//  HomeView.swift
//  Resume
//
//  Created by lukailun on 2023/1/17.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel(dataManager: DataManager(fileName: "Bio"))

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .red, .pink],
                               startPoint: .leading,
                               endPoint: .bottom)
                    .ignoresSafeArea()
                BackgroundImage()
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
                        ToolbarButton(imageName: "toolbar/arrow_clockwise") {
                            viewModel.reset()
                        }
                        Spacer().frame(width: 20)
                        ToolbarButton(imageName: "toolbar/caret_left", enabled: viewModel.isPreviousEnabled) {
                            viewModel.previous()
                        }
                        Spacer().frame(width: 20)
                        ToolbarButton(imageName: "toolbar/caret_right", enabled: viewModel.isNextEnabled) {
                            viewModel.next()
                        }
                        Spacer().frame(width: 20)
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
    
    private func BackgroundImage() -> some View {
        VStack {
            if !viewModel.isBackgroundImageChanging, !viewModel.backgroundImage.isEmpty {
                Image(viewModel.backgroundImage)
                    .resizable()
                    .scaleEffect(1.2, anchor: .top)
                    .aspectRatio(nil, contentMode: .fit)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.2)))
            } else {
                EmptyView()
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
