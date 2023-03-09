//
//  LetterButtonView.swift
//  WordOff
//
//  Created by Alexander Giger on 2/12/23.
//

import SwiftUI

struct LetterButtonView: View {
    @EnvironmentObject var dm: WordOffDataModel
    var letter: String
    var body: some View{
        Button{
            dm.addToCurrentWord(letter)
        }label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dm.keyColors[letter])
                .foregroundColor(.primary)
        }
    }
}

struct LetterButtonView_Previews: PreviewProvider {
    static var previews: some View{
        LetterButtonView(letter: "L")
            .environmentObject(WordOffDataModel())
    }
}
