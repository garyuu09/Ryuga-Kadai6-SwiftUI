//
//  ContentView.swift
//  Kadai6-SwiftUI
//
//  Created by Ryuga on 2023/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var correctValue = Int.random(in: 1..<100)
    @State private var sliderValue = 50.0  // 初期値50
    @State private var isEditing = false
    @State private var alertMessage: String?
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Text("\(Int(correctValue))")
                .foregroundColor(.blue)
                .font(.title)

            //スライダーを配置(1-100)
            Slider(value: $sliderValue,
                   in: 1 ... 100,
                   step: 1,
                   onEditingChanged: { editing in
                isEditing = editing
            })

            HStack {
                // スライダーの最小値(1)表示
                Text("1")

                Spacer()
                // スライダーの最大値(100)を表示
                Text("100")
            }

            // 判定ボタン
            Button( action: {
                if correctValue == Int(sliderValue) {
                    showingAlert = true
                    alertMessage = """
                    あたり
                    あなたの値: \(Int(sliderValue))
                    """

                } else {
                    showingAlert = true
                    alertMessage = """
                    はずれ
                    あなたの値: \(Int(sliderValue))
                    """

                }
            }) {
                Text("判定!")
            }
        }
        .alert(
            "結果",
            isPresented: $showingAlert,
            presenting: alertMessage,
            actions: { _ in Button("再挑戦"){
                correctValue = Int.random(in: 1..<100)
                sliderValue = 50.0
            } },
            message: { message in
                Text(message)
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
