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
            switch viewModel.style {
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
            Text(viewModel.content)
                .font(Font.muyaoFont())
                .padding(.horizontal, 20)
        }
        .offset(y: -120)
        .frame(width: 300, height: 300)
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView()
    }
}
