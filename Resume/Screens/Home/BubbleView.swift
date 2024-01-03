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
                Image("single")
                    .resizable()
            case .double:
                Image("double")
                    .resizable()
            }
        }
        .aspectRatio(contentMode: .fit)
        .overlay {
            Text(viewModel.content)
                .font(Font.muyaoFont())
        }
        .frame(width: 200)
        .offset(x: -30, y: -120)
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView()
    }
}
