//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Turki Obaid ALarjan on 14/07/2020.
//  Copyright © 2020 Turki Obaid ALarjan. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    // this is going to be the video that this cell displaying
    var video: Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // so the view controller when it gets an instance
    // of this cell , is going to pass in the video object
    // that it wants this cell to display
    func setCell(_ v:Video){
        
        // capture that video & Set it
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the title
        self.titleLabel.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        // So we have to use url session to download it
        guard self.video!.thumbnail != "" else {
            return
        }
        // Downoad the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL Session Object
        let session = URLSession.shared
        
        // Create a data task
        // handl the response after
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            ///this block handles the response after its downloaded the data
            
            // if there is no error and there is data
            if error == nil && data != nil {
                
                // Check that the downloaded url matches
                //the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video
                    // and nolonger match es the thumbnail that was downloaded
                    return
                }
                // if it pass's that:
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                // while all of this in background thread
                // and this job modifies the UI
                // we want throw it back to main thread
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        // Start data task
        dataTask.resume()
    }
}
