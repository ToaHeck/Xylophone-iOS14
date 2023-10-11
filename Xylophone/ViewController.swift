
//  ViewController.swift
//  Xylophone



import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    @IBAction func keyPressed(_ sender: UIButton) {
        //Debug statements
        print("START")
        print(sender.currentTitle)
        print(sender.alpha)
        
        //call playsound() and change alpha channel
        playSound(soundName: sender.currentTitle!)
        sender.alpha = 0.5
        
        //delay by 0.2 seconds then reset the alpha to 100%
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            sender.alpha = 1
        }
        print("END")
    }//end keyPressed
    
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }//end playSound()
    
}

