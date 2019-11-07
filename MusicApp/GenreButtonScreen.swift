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
    @IBOutlet weak var currentSong: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentSong.isEditable = false
    }
    
    /**
     * genreButtonTapped
     * Requests authorization from the user to access their music library
     * If authorized, plays a song from the genre on the button the user tapped
     */
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        DispatchQueue.main.async {
            MPMediaLibrary.requestAuthorization { (status) in
                if(status == .authorized) {
                    self.playGenre(genre: sender.currentTitle!)
                }
            }
        }
    }
    
    /**
     * stopButtonTapped
     * Stops playing the music.
     */
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    /**
     * nextButtonTapped()
     * Stops the song that is currently playing and plays the next song in the queue
     * Updates the text view on screen to display the song's title
     */
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
        musicPlayer.skipToNextItem()
        musicPlayer.play()
        
        displaySongTitle()
    }
    
    /**
     * playGenre()
     * Stops the song that is currently playing and generates a queue of songs in the genre that the user reqeusted
     * Shuffles the songs in the queue and plays the first song
     * Updates the text view on screen to display the song's title
     */
    func playGenre(genre: String) {
        musicPlayer.stop();
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
        displaySongTitle()
    }
    
    /**
     * displaySongTitle()
     * Saves the title of the currently playing song
     * Clears the text view (if an old song title currently exists in there) and inserts the new song's title
     * Text view is set to prevent editing from the user (meaning they cannot click to bring up the keyboard)
     */
    func displaySongTitle() {
        if let mediaItem = musicPlayer.nowPlayingItem {
            let title: String = mediaItem.value(forProperty: MPMediaItemPropertyTitle) as! String

            print("\(title)")
            
            DispatchQueue.main.async {
                self.currentSong.text = ""
                self.currentSong.insertText("\(title)")
                self.currentSong.isEditable = false
            }
        }
    }
}
