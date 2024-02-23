//
//  ContentView.swift
//  janken
//
//  Created by Bana on 2024/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var answerNumber = 0
    @State var winNumber = 0
    @State var myNumber = 0
    @State var count = 0
    @State var anwerText = "じゃんけんをする！"
    
    var body: some View {
        VStack{
            if answerNumber == 0 {
                Text("手をタップしよう")
                    .frame(width: 300, height: 300)
            } else if answerNumber == 1 {
                Image("gu")
                    .resizable()
                    .frame(width: 300, height: 300)
            } else if answerNumber == 2 {
                Image("choki")
                    .resizable()
                    .frame(width: 300, height: 300)
            } else {
                Image("pa")
                    .resizable()
                    .frame(width: 300, height: 300)
            }
            
            HStack{
                Button(action: {
                    myNumber = 1
                    count += 1
                    answer(aNum: answerNumber)
                }){
                    Image("gu")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                Button(action: {
                    myNumber = 2
                    count += 1
                    answer(aNum: answerNumber)
                }){
                    Image("choki")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                Button(action: {
                    myNumber = 3
                    count += 1
                    answer(aNum: answerNumber)
                }){
                    Image("pa")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }

            Text("\(anwerText)\n\(winNumber)／\(count)")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .font( .title)
                .background( .pink)
                .foregroundColor( .white)
            
            Button(action: {
                answerNumber = 0
                winNumber = 0
                count = 0
                anwerText = "じゃんけんをする！"
            }){
                Text("さいしょから")
                    .frame(height: 100)
            }
        }
    }
    
    func answer(aNum: Int) {
        var newAnswerNumber = 0
        
        // 同じ手を連続で出さないようにする
        repeat {
            newAnswerNumber = Int.random(in: 1...3)
        } while aNum == newAnswerNumber
        answerNumber = newAnswerNumber
        
        if (answerNumber == myNumber) {
            anwerText = "あいこ！"
        } else if (
            (answerNumber == 1 && myNumber == 3) ||
            (answerNumber == 2 && myNumber == 1) ||
            (answerNumber == 3 && myNumber == 2)
        ){
            winNumber += 1
            anwerText = "かち！"
        }else {
            anwerText = "まけ！"
        }
    }
}
#Preview {
    ContentView()
}
