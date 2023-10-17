//
//  ContentView.swift
//  SwiftUIWithFirestore
//
//  Created by changhoji on 2023/10/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var diariesViewModel = DiariesViewModel()
    
    @State var content: String = ""
    @State var color: Color = .black
    
    var body: some View {
        VStack {
            HStack {
                TextField("내용 입력", text: $content)
                ColorPicker("색상 선택", selection: $color)
                Button("확인") {
                    print("content: ", content, ", color: ", color)
                }
                Button("저장") {
                    FirestoreManager().addDiary(diary: Diary(color: color, content: content))
                }
            }
            .padding()
            List(diariesViewModel.diaries, id: \.id) { diary in
                Text(diary.content)
                Rectangle().fill(diary.color)
            }.onAppear() {
                self.diariesViewModel.fetchData()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
