//
//  ViewController.swift
//  Swift5AdMob
//
//  Created by seijiro on 2019/03/29.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,GADBannerViewDelegate {

  let TestID = "ca-app-pub-3940256099942544/2934735716"
  let DEVICE_ID = "5e1c394b3baa0778f285d6455e9add20"
  let simulatorTest = true

  override func viewDidLoad() {
    super.viewDidLoad()
    var adMobView = GADBannerView()
    adMobView = GADBannerView(adSize:  kGADAdSizeBanner)
    adMobView.frame.origin = CGPoint(x: 0, y: self.view.frame.height - adMobView.frame.height)
    adMobView.frame.size = CGSize(width: self.view.frame.width, height: adMobView.frame.height)
    adMobView.adUnitID = TestID
    adMobView.delegate = self
    adMobView.rootViewController = self

    let adMobRequest = GADRequest()
    if simulatorTest {
      adMobRequest.testDevices = [kGADSimulatorID]
    } else {
      adMobRequest.testDevices = [DEVICE_ID]
    }
    adMobView.load(adMobRequest)
    self.view.addSubview(adMobView)

  }

  @IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }

}

