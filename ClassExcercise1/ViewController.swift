//
//  ViewController.swift
//  ClassExcercise1
//
//  Created by Anmol Sharma on 2020-01-10.
//  Copyright © 2020 anmol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var swipeRight = false
    var swipeLeft = false
    @IBOutlet weak var direction: UILabel!
    @IBOutlet weak var rect: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tap()
        leftGesture()
        RightGesture()
        
    
    }
    
    //Tap Function to start the motion
    func tap()
    {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGetsure)))
    }
    
    //Tap getsure Selector
    @objc func handleTapGetsure(){
        print("Animating")
        down()
    }
    
    /*Function for right and left gestures
    
    Right for clockwise
    left for anti-clockwise
    */
    
    //Left gesture
    func leftGesture()
    {
        
        swipeLeft = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeLeft)
    }
    //Right Gesture
    func RightGesture()
    {
        swipeRight = true
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)
    }
    
    //Swiped
    @objc func swiped(gesture : UISwipeGestureRecognizer)
    {
        let swipeGesture = gesture as UISwipeGestureRecognizer
        switch swipeGesture.direction {
        case UISwipeGestureRecognizer.Direction.left:
            direction.text = "Swiped left and now it will go Anti-Clockwise"
            moveRight()
        case UISwipeGestureRecognizer.Direction.right:
            direction.text = "Swiped Right and now it will go Clockwise"
            clockup()
        default:
            break
        }
    }
    
    
   //Functions for anti
    //Function to move the rect Down
    func down()
    {
//        var xPos = rect.frame.origin.x
//        var yPos = rect.frame.origin.y
        direction.text = "GOING Down"
        UIView.animate(withDuration: 4.0, delay: 0,options: .curveLinear, animations: {
            
            self.rect.frame.origin.y = self.view.frame.size.height - self.view.safeAreaInsets.bottom - self.rect.frame.size.height
        },completion: {finished in
            self.direction.text = "swipe right for Clockwise or left for anti-Clockwise"
//            if self.swipeLeft == true{
//                self.moveRight()
//            }
            }
        )
//        print("x=\(xPos)" + "y=\(yPos)")
    }
    
    //Function to move right
    func moveRight()
    {
        direction.text = "GOING Right"
        UIView.animate(withDuration: 4.0,delay: 0,options: .curveLinear, animations: {
            self.rect.frame.origin.x = self.view.frame.size.width - self.view.safeAreaInsets.right - self.rect.frame.size.width
        },completion: {
            finsihed in
            self.moveup()
        })
    }
    
    //func to move up
    func moveup()
    {
        direction.text = "GOING Up"
        UIView.animate(withDuration: 4.0,delay: 0,options: .curveLinear, animations: {
            self.rect.frame.origin.y = self.view.safeAreaInsets.bottom
        },completion: {
            finished in
            self.moveLeft()
        })
    }
    
    //Func to move Left
    func moveLeft()
    {
        direction.text = "GOING Left"
        UIView.animate(withDuration: 4.0,delay: 0,options: .curveLinear, animations: {
            self.rect.frame.origin.x = self.view.safeAreaInsets.left - self.rect.frame.size.width + self.rect.frame.size.height
        },completion: {
            finished in
            self.down()
        })
    }
    
    
//    Functions for clockwise
    //Func for clockup
    func clockup() {
        direction.text = "Moving Clockwise UP"
        UIView.animate(withDuration: 4.0, delay: 0,options: .curveLinear, animations: {
            self.rect.frame.origin.y = self.view.safeAreaInsets.top
        },completion: {
            finished in
            self.clockMoveRight()
        })
    }
    
    
    func clockMoveRight()
       {
           direction.text = "Moving Clockwise Right"
           UIView.animate(withDuration: 4.0,delay: 0,options: .curveLinear, animations: {
            self.rect.frame.origin.x = self.view.frame.size.width - self.view.safeAreaInsets.right - self.rect.frame.size.width
           },completion: {
               finsihed in
            self.clockMoveDown()
           })
       }
    
    func clockMoveDown() {
        direction.text = "Moving Clockwise Down"
        UIView.animate(withDuration: 4.0,delay: 0,options: .curveLinear ,animations: {
            self.rect.frame.origin.y = self.view.frame.size.height - self.view.safeAreaInsets.bottom - self.rect.frame.size.height
        },completion: {
            finshed in
            self.clockMoveLeft()
        })
    }
    
    func clockMoveLeft(){
        direction.text = "Moving clockwise Down"
        UIView.animate(withDuration: 4.0,delay: 0,options: .curveLinear, animations: {
            self.rect.frame.origin.x = self.view.safeAreaInsets.left - self.rect.frame.size.width + self.rect.frame.size.height
        })
    }

}

