//
//  DemoURL.swift
//  Texas
//
//  Created by Xuezhu on 1/2/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import Foundation

struct DemoURL {
    
    static let Cloud = "https://upload.wikimedia.org/wikipedia/commons/a/a3/Cumulus_clouds_panorama.jpg"
    static let Texas = [
        "Austin" : "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Austin_Evening.jpg/1280px-Austin_Evening.jpg",
        "Houston" : "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Houston_from_Sabine_Park.jpg/1000px-Houston_from_Sabine_Park.jpg",
        "Dallas" : "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Dallas_Collage_Montage.png/800px-Dallas_Collage_Montage.png"
    ]
    
    static func TexasImageNamed(imageName: String?) -> NSURL? {
        if let urlstring = Texas[imageName ?? ""] {
            return NSURL(string: urlstring)
        } else {
            return nil
        }
    }
}
