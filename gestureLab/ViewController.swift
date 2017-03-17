//
//  ViewController.swift
//  gestureLab
//
//  Created by Wenn Huang on 3/16/17.
//  Copyright © 2017 Wenn Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tray: UIView!
    var originalCenter : CGPoint!
    var trayWhenOpen : CGPoint!
    var trayWhenClose : CGPoint!
    var isOpened = true
    var faces : [UIImageView]!
    var face : UIImageView!
    var gesture : UIPanGestureRecognizer!
    
    @IBOutlet weak var smile: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayWhenOpen = tray.center
        
        trayWhenClose = CGPoint(x:trayWhenOpen.x, y: 740)
        
        faces = []
        gesture = UIPanGestureRecognizer()
        
        /*for faceImage in faces {
            faceImage.addGestureRecognizer(gesture)
            faceImage.isUserInteractionEnabled = true
        }*/
        
        
        
    }
    
    /*func onCopySmile(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: self.view)
        let imageView = sender.view as! UIImageView
        
        if sender.state == .began {
            originalCenter = imageView.center
            
        }else if sender.state == .changed {
            
            imageView.center = location
        }else if sender.state == .ended {
            
        }
        
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTappingTray(_ sender: UITapGestureRecognizer) {
        
        if isOpened {
            tray.center = trayWhenClose
            isOpened = false
        } else {
            tray.center = trayWhenOpen
            isOpened = true
            
        }
        
            }

    @IBAction func onPanSmile(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: self.view)
       
        
        if sender.state == .began {
            
            let imageView = sender.view as! UIImageView
            let copyImage = UIImageView(image: imageView.image)
            face = copyImage
            
           // face.addGestureRecognizer(gesture)
            face.isUserInteractionEnabled = true
            faces.append(face)
            

            view.addSubview(copyImage)
            
            copyImage.center = imageView.center
            face.center = imageView.center
          
            
        }else if sender.state == .changed {
            
            face.center = location
           
            
        } else if sender.state == .ended {
           
        }
        
        
    }
   
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translation(in: self.view)
        let velocity = sender.velocity(in: self.view)
        
        if sender.state == UIGestureRecognizerState.began{
            
            originalCenter = tray.center
            
        }else if sender.state == UIGestureRecognizerState.changed{
            var center = originalCenter
            //center?.x += translation.x
            center?.y += translation.y
            
            tray.center = center!
            
        }else if sender.state == UIGestureRecognizerState.ended {
            if velocity.y > 0 {
                 tray.center = trayWhenClose
               
            } else if velocity.y <= 0 {
                  tray.center = trayWhenOpen
            }
            
        }
    }

}

