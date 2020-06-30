//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Turki Obaid ALarjan on 28/06/2020.
//  Copyright © 2020 Turki Obaid ALarjan. All rights reserved.
//
//here we will store all of the configuration details
//so that we can update them form one place if we need to

import Foundation

struct Constants {
    
    static var API_KEY = ""
    
    static var PLAYLIST_ID = "PLo9LPKFt_qQS67bBKcgn07edGId5Cb-Ii"
    
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
