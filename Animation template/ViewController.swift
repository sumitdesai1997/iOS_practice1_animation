//
//  ViewController.swift
//  Animation template
//
//  Created by Mohammad Kiani on 2021-01-17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var isPlaying = false
    
    @IBAction func clickPlay(_ sender: UIButton) {
        
        // providing other images which will be part of animation
        img.animationImages = [
            UIImage(named: "frame_0_delay-0.1s.gif")!,
            UIImage(named: "frame_1_delay-0.1s.gif")!,
            UIImage(named: "frame_2_delay-0.1s.gif")!,
            UIImage(named: "frame_3_delay-0.1s.gif")!,
            UIImage(named: "frame_4_delay-0.1s.gif")!,
            UIImage(named: "frame_5_delay-0.1s.gif")!]
        
        img.animationDuration = 1 // animation time for image changes
        img.animationRepeatCount = 0 // for infinite time animation
        
        if(isPlaying){
            img.stopAnimating()
            isPlaying = false
            btnPlay.setTitle("play", for: [])
        } else{
            img.startAnimating()
            isPlaying = true
            btnPlay.setTitle("pause", for: [])
        }
    }
    
    @IBAction func clickFadeIn() {
        img.alpha = 0 // making image invisible by making alpha = 0
        UIView.animate(withDuration: 2) {
            self.img.alpha = 1 // this will be done after 2 second
        }
    }
    
    @IBAction func clickSlideIn() {
        // for center we need CGPoint because center is point
        
        img.center = CGPoint(x: img.center.x-500, y: img.center.y) // shifting center
        UIView.animate(withDuration: 2) {
            self.img.center = CGPoint(x: self.img.center.x+500, y: self.img.center.y)
        }
    }
    
    @IBAction func clickGrow() {
        let width = img.frame.size.width
        let height = img.frame.size.height
        
        let x = img.frame.origin.x
        let y = img.frame.origin.y
        
        // for grow (which is related to size), we need frame of view
        // view has origin, width and height, so its kind of rectangle. so we need CGRect
        // origin of view is in top left corner
        
        img.frame = CGRect(x: x, y: y, width: 0, height: 0)
        UIView.animate(withDuration: 2) {
            self.img.frame = CGRect(x: x, y: y, width: width, height: height)
        }
        
        // growing image from center
        /*
         img.frame = CGRect(x: x+width/2, y: y+height/2, width: 0, height: 0)
        UIView.animate(withDuration: 2) {
            self.img.frame = CGRect(x: x, y: y, width: width, height: height)
        }
         */
    }
    
    


}

