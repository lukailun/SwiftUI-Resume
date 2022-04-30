//
//  ContentView.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/4/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .font(.muyaoFont(size: 16, relativeTo: .title))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
