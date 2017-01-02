//
//  MusicListVC.swift
//  SwappingScreens
//
//  Created by Jeffrey Eng on 12/30/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func loadThirdScreenPressed(_ sender: Any) {
        let songTitle = "Just The Way You Are"
        performSegue(withIdentifier: "PlaySongVC", sender: songTitle)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongVC {
            
            if let song = sender as? String {
                destination.selectedSong = song
            }
        }
    }
 

}
