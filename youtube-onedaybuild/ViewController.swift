//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Turki Obaid ALarjan on 26/05/2020.
//  Copyright © 2020 Turki Obaid ALarjan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    ///Model instance
    var model = Model()
    
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the datasource and the delegate
        tableView.delegate = self
        
        model.getVideos()
    }
    
    // MARK: - Model Delegate Mehods
    
    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our vide property
        self.videos = videos
        
        
        // Refresh the tableview
        tableView.reloadData()
    }
    
    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //how many row you wanna the table view to display
        
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView asking every row :
        //what data do i display ? what does that row look like ?
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // Configure the cell with the data
        // Get the title for the video in qustion
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // Return the cell
        //give the cell back to the tableView for displaying
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

