//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by Brian Bugieda on 11/4/19.
//  Copyright © 2019 Brian Bugieda. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        DispatchQueue.main.async {
            MPMediaLibrary.requestAuthorization { (status) in
                if(status == .authorized) {
                    self.playGenre(genre: sender.currentTitle!)
                }
            }
        }
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
        musicPlayer.stop();
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
