//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Turki Obaid ALarjan on 28/06/2020.
//  Copyright © 2020 Turki Obaid ALarjan. All rights reserved.
//

import Foundation

//this struct represent each of the Videos
//that we are going to get from the API
//and gonna display
struct Video : Decodable {
    
    var videoId = ""
    //video title
    var title = ""
    //video description
    var description = ""
    //thumbnail URL
    var thumbnail = ""
    //published Date
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        //here you start specifying the keys
        //that we're intersted in
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    /*
     so there's a class called json decoder
     and it takes the json data and you tell it
     what type to try to decode that json into
     ,in this case we've indicated that
     our video object is decodable
     so this json decoder is going to pass
     one API's json objects
     */
    //decoding instructions
    //how to map those json key value pairs
    //into thees properties
    //so will do it in this initializer
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        //it's going to try to decode the value wich is of a string type
        //for the key title
        ///same thing for the others
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse Video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
