//
//  Diary.swift
//  SwiftUIWithFirestore
//
//  Created by changhoji on 2023/10/17.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Song: Codable {
    @DocumentID var id: String?
    var title: String
    var artist: String
}
