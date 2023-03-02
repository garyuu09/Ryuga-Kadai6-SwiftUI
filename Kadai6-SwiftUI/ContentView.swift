//
//  ContentView.swift
//  Kadai6-SwiftUI
//
//  Created by Ryuga on 2023/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var correctValue = Int.random(in: Self.range)
    @State private var sliderValue = 50.0  // 初期値50
    @State private var alertMessage: String?
    @State private var showingAlert = false

    private static let range = 1...100
    private static var floatRange: ClosedRange<Double> {
        Double(Self.range.lowerBound)...Double(Self.range.upperBound)
    }

    var body: some View {
        VStack {
            Text("\(correctValue)")
                .foregroundColor(.blue)
                .font(.title)

            //スライダーを配置(1-100)
            Slider(value: $sliderValue,
                   in: Self.floatRange,
                   step: 1)

            HStack {
                // スライダーの最小値(1)表示
                Text("\(Self.range.lowerBound)")

                Spacer()
                // スライダーの最大値(100)を表示
                Text("\(Self.range.upperBound)")
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
                correctValue = Int.random(in: Self.range)
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
