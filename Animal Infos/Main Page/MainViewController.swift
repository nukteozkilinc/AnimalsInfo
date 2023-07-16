//
//  ViewController.swift
//  Animal Infos
//
//  Created by Nukte Ozkilinc on 16.07.2023.
//

import UIKit
import AVKit
import AVFoundation

class MainViewController: UIViewController {

    
    @IBOutlet weak var hippoView: AnimalCards!
    @IBOutlet weak var gorilla: AnimalCards!
    @IBOutlet weak var giraffe: AnimalCards!
    @IBOutlet weak var elephant: AnimalCards!
    @IBOutlet weak var cheetah: AnimalCards!
    @IBOutlet weak var lion: AnimalCards!
    @IBOutlet weak var zebra: AnimalCards!
    @IBOutlet weak var ostrich: AnimalCards!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMyViews()
    }
    
    private func setupMyViews() {
        hippoView.title = "Hippo"
        hippoView.imageName = "hippo"
        hippoView.webUrl = WebPageUrl.hippo
        hippoView.videoName = "hippo"
        hippoView.goToWebPage = goToWebVC()
        hippoView.goToVideo = watchVideo()
        
        gorilla.title = "Gorilla"
        gorilla.imageName = "gorilla"
        gorilla.webUrl = WebPageUrl.gorilla
        gorilla.videoName = "gorilla"
        gorilla.goToWebPage = goToWebVC()
        gorilla.goToVideo = watchVideo()
        
        giraffe.title =  "Giraffe"
        giraffe.imageName = "giraffe"
        giraffe.webUrl = WebPageUrl.giraffe
        giraffe.videoName = "giraffe"
        giraffe.goToWebPage = goToWebVC()
        giraffe.goToVideo = watchVideo()
        
        elephant.title =  "Elephant"
        elephant.imageName = "elephant"
        elephant.webUrl = WebPageUrl.elephant
        elephant.videoName = "elephant"
        elephant.goToWebPage = goToWebVC()
        elephant.goToVideo = watchVideo()
        
        cheetah.title =  "Cheetah"
        cheetah.imageName = "cheetah"
        cheetah.webUrl = WebPageUrl.cheetah
        cheetah.videoName = "cheetah"
        cheetah.goToWebPage = goToWebVC()
        cheetah.goToVideo = watchVideo()
        
        lion.title = "Lion"
        lion.imageName = "lion"
        lion.webUrl = WebPageUrl.lion
        lion.videoName = "lion"
        lion.goToWebPage = goToWebVC()
        lion.goToVideo = watchVideo()
        
        zebra.title = "Zebra"
        zebra.imageName = "zebra"
        zebra.webUrl = WebPageUrl.zebra
        zebra.videoName = "zebra"
        zebra.goToWebPage = goToWebVC()
        zebra.goToVideo = watchVideo()
        
        ostrich.title = "Ostrich"
        ostrich.imageName = "ostrich"
        ostrich.webUrl = WebPageUrl.ostrich
        ostrich.videoName = "ostrich"
        ostrich.goToWebPage = goToWebVC()
        ostrich.goToVideo = watchVideo()
    }


    func goToWebVC() -> (String) -> () {
        return {
            urlString in
            let storyboard = UIStoryboard(name: "WebView", bundle: nil)
            
            if let webViewController = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                
                webViewController.url = urlString
                self.navigationController?.pushViewController(webViewController, animated: true)
            }
        }
    }
    
    func watchVideo() -> (String) -> (){
        return {
            videoName in
            if let path = Bundle.main.path(forResource: videoName, ofType: "mp4"){
                let player = AVPlayer(url: URL(filePath: path))
                let playerController = AVPlayerViewController()
                playerController.player = player
                self.present(playerController, animated: true){
                    player.play()
                }
            }
        }
    }
}

