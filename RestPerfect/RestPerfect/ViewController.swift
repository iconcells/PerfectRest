//
//  ViewController.swift
//  RestPerfect
//
//  Created by kng on 7/30/15.
//  Copyright (c) 2015 kng. All rights reserved.
//

import SpriteKit
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let pics: [String] = ["winter.jpg", "indoor.png"]
    let musics: [String] = ["xmas", "xmas2"]
    var picPointer: Int = 0
    var counter: Int = 0
    var player : AVAudioPlayer! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer: NSTimer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target:self, selector: Selector("updatePics"), userInfo: nil, repeats: true)
        updatePics()
    }
    
    func updatePics() {
        
        // Update Pointer, loop through the array
        if picPointer < (pics.count - 1) {
            picPointer++
        } else {
            picPointer = 0
        }
        
        // Show Pic
        let imageName = pics[picPointer]
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image:image!)
        imageView.frame = CGRect(x:0, y:0, width:600, height:670)
        view.addSubview(imageView)
        //imageView.
        
        // Play music
        play(musics[picPointer], fileType: "mp3")
        
        counter++
    }
    
    func getImagesfromPicker()->[String]{
        let imagePicker = UIImagePickerController()
        
//        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        imagePicker.mediaTypes = [kUTTypeImage as NSString]
        imagePicker.allowsEditing = false
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        return []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func play(filename:String, fileType:String){
        let path = NSBundle.mainBundle().pathForResource(filename, ofType:fileType)
        let fileURL = NSURL(fileURLWithPath: path!)
        player = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        player.prepareToPlay()
        player.play()
    }


}

