//
//  BubbleView.swift
//  Resume
//
//  Created by lukailun on 2023/1/17.
//

import SwiftUI

struct BubbleView: View {
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        Group {
            switch viewModel.bubbleStyle {
            case .none:
                Spacer()
            case .single:
                Image("bubble/single")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: viewModel.bubbleWidth)
            case .double:
                Image("bubble/double")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(width: viewModel.bubbleWidth)
        .overlay {
            Content()
        }
        .offset(y: -120)
        .frame(width: 300, height: 300)
    }
}

extension BubbleView {
    func Content() -> some View {
        Group {
            switch viewModel.bubbleStyle {
            case .none:
                Spacer()
            case .single:
                Text(viewModel.content)
                    .font(Font.muyaoFont())
                    .padding(.horizontal, 20)
            case .double:
                VStack {
                    Text(addTextLimit(index: 0))
                        .font(Font.muyaoFont())
                        .multilineTextAlignment(.center)
                        .offset(x: -30, y: -40)
                        .rotationEffect(Angle(degrees: -4))
                    Text(addTextLimit(index: 1))
                        .font(Font.muyaoFont())
                        .offset(x: 30, y: 40)
                        .rotationEffect(Angle(degrees: 4))
                }
            }
        }
    }

    private func addTextLimit(index: Int) -> String {
        let content = String(viewModel.content.split(separator: "，")[index])
        guard content.count > 8 else {
            return content
        }
        var value = content
        let index = value.index(value.startIndex, offsetBy: 8)
        value.insert("\r", at: index)
        return value
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView()
    }
}
