//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Turki Obaid ALarjan on 30/06/2020.
//  Copyright © 2020 Turki Obaid ALarjan. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
