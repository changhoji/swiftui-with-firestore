//
//  DiariesView.swift
//  SwiftUIWithFirestore
//
//  Created by changhoji on 2023/10/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var diaryViewModel = DiaryRepository()
    
    @State var content: String = ""
    @State var color: Color = .black
    
    var body: some View {
        VStack {
            // input field
            HStack {
                TextField("내용 입력", text: $content)
                ColorPicker("색상 선택", selection: $color)
                Button("저장") {
                    diaryViewModel.addDiary(diary: Diary(color: color, content: content))
                }
            }
            .padding()
            
            // showing datas with List
            List(diaryViewModel.diaries, id: \.id) { diary in
                Text(diary.content)
                Rectangle().fill(diary.color)
                HStack {
                    Button("remove") {
                        diaryViewModel.removeDiary(id: diary.id)
                    }
                }
                
            }.onAppear() {
                self.diaryViewModel.getDiaries()
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    
    
}
