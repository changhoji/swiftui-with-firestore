//
//  Diary.swift
//  SwiftUIWithFirestore
//
//  Created by changhoji on 2023/10/17.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Diary: Codable, Identifiable {
    @DocumentID var id: String?
    var color: Color
    var content: String
}
