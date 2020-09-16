//
//  Petition.swift
//  WhitehousePettitions-UIKit
//
//  Created by Alejandro Terrazas on 15/09/20.
//  Copyright © 2020 Alejandro Terrazas. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
