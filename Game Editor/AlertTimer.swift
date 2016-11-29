//
//  AlertTimer.swift
//  Game Editor
//
//  Created by Dude Guy  on 11/28/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import UIKit

public final class Toast {
  
  private let viewController: UIViewController
  
  private var alertController: UIAlertController?
  
  // For timer:
  private var alertTimer:   Timer?,
              baseMessage:  String?,
              remainingTime = 0
  
  private let title:        String,
              message:      String,
              duration:     Int
  
  init(inViewController vc: UIViewController, title: String, message: String, duration: Int) {
    self.viewController = vc
    self.title          = title
    self.message        = message
    self.duration       = duration
  }
  
  func showAlertMsg() {
    
    guard (alertController == nil) else {
      print("Alert already displayed")
      return
    }
    
    // alertTimer:
    remainingTime   = duration
    alertTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(countDown),
                                      userInfo: nil, repeats: true)
    
    // alertController
    baseMessage     = message
    alertController = UIAlertController(title: title, message: baseMessage, preferredStyle: .alert)
    viewController.present(alertController!, animated: true, completion: nil)
  }
  
  @objc private func countDown() {
    
    self.remainingTime -= 1
    if (self.remainingTime < 0) {
      self.alertTimer?.invalidate()
      self.alertTimer = nil
      self.alertController!.dismiss(animated: true, completion: {
        self.alertController = nil
      })
    } else {
      self.alertController!.message = self.alertMessage()
    }
    
  }
  
  private func alertMessage() -> String {
    var message=""
    if let baseMessage=self.baseMessage {
      message=baseMessage+" "
    }
    return(message)
  }
  
  static func make(title: String = "Toast",
                   message: String,
                   duration: Int = 1,
                   viewController vc: UIViewController) {
    Toast(inViewController: vc, title: title, message: message, duration: duration).showAlertMsg()
  }
}

public final class Alert {
  
  private let viewController: UIViewController
  
  private var alertController: UIAlertController?
  
  // For timer:
  private var alertTimer:   Timer?,
              baseMessage:  String?,
              remainingTime = 0
  
  private let title:        String,
              message:      String,
              duration:     Int
  
  init(inViewController vc: UIViewController, title: String, message: String, duration: Int) {
    self.viewController = vc
    self.title          = title
    self.message        = message
    self.duration       = duration
  }
  
  func showAlertMsg() {
    
    guard (alertController == nil) else {
      print("Alert already displayed")
      return
    }
    
    // alertTimer:
    remainingTime   = duration
    alertTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown),
                                      userInfo: nil, repeats: true)
    
    // alertController
    baseMessage     = message
    alertController = UIAlertController(title: title, message: baseMessage, preferredStyle: .alert)
    
    // Cancel action:
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
      print("Alert was cancelled")
      self.alertController=nil
      self.alertTimer?.invalidate()
      self.alertTimer=nil
    }
    
    alertController!.addAction(cancelAction)
    viewController.present(alertController!, animated: true, completion: nil)
  }
  
  @objc private func countDown() {
    
    self.remainingTime -= 1
    if (self.remainingTime < 0) {
      self.alertTimer?.invalidate()
      self.alertTimer = nil
      self.alertController!.dismiss(animated: true, completion: {
        self.alertController = nil
      })
    } else {
      self.alertController!.message = self.alertMessage()
    }
    
  }
  
  private func alertMessage() -> String {
    var message=""
    if let baseMessage=self.baseMessage {
      message=baseMessage+" "
    }
    return(message+"\(self.remainingTime)")
  }
  
  static func make(title: String = "Toast",
                   message: String,
                   duration: Int = 2,
                   viewController vc: UIViewController) {
    Toast(inViewController: vc, title: title, message: message, duration: duration).showAlertMsg()
  }
}

