//
//  Keyboard.swift
//  WordOff
//
//  Created by Alexander Giger on 2/15/23.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var dm: WordOffDataModel
    
    var topRowArray = "QWERTYUIOP".map{String($0)}
    var middleRowArray = "ASDFGHJKL".map{String($0)}
    var bottomRowArray = "ZXCVBNM".map{String($0)}
    
    var body: some View {
        VStack{
            HStack(spacing: 2){
                ForEach(topRowArray, id: \.self){ letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
            }
            HStack(spacing: 2){
                ForEach(middleRowArray, id: \.self){ letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
            }
            HStack(spacing: 2){
                Button{
                    dm.enterWord()
                }label: {
                    Text("Enter")
                }.font(.system(size: 20))
                    .frame(width: 60, height: 50)
                    .foregroundColor(.primary)
                    .background(Color.unused)
                    .disabled(dm.currentWord.count < 5 || !dm.inPlay)
                    .opacity((dm.currentWord.count < 5 || !dm.inPlay) ? 0.6 : 1)
                ForEach(bottomRowArray, id: \.self){ letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
                Button{
                    dm.removeLetterFromCurrentWord()
                }label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 40, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }
                .disabled(dm.currentWord.count == 0 || !dm.inPlay)
                .opacity((dm.currentWord.count == 0 || !dm.inPlay) ? 0.6 : 1)
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(WordOffDataModel())
            .scaleEffect(Global.keyboardScale)
    }
}
