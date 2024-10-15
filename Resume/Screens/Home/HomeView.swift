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
                    }
                }
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack {
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
                        ToolbarButton(imageName: "toolbar/clockwise") {
                            viewModel.reset()
                        }
                        Spacer().frame(width: 20)
                        ToolbarButton(imageName: "toolbar/left", enabled: viewModel.isPreviousEnabled) {
                            viewModel.previous()
                        }
                        Spacer().frame(width: 20)
                        ToolbarButton(imageName: "toolbar/right", enabled: viewModel.isNextEnabled) {
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
            if !viewModel.backgroundImageName.isEmpty {
                Image(viewModel.backgroundImageName)
                    .resizable()
                    .scaleEffect(1.25, anchor: .top)
                    .scaledToFit()
                    .overlay {
                        if !viewModel.isNextEnabled {
                            Text(getYear())
                                .foregroundColor(.white)
                                .font(Font.system(size: 80).bold())
                        }
                    }
            }
            Spacer()
        }
    }

    private func getYear() -> String {
        let currentDate = Date()
        let currentYear = Calendar.current.component(.year, from: currentDate)
        return String(currentYear).map { String($0) }.joined(separator: "\n")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
