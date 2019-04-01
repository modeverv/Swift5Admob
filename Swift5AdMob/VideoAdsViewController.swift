//
//  VideoAdsViewController.swift
//  Swift5AdMob
//
//  Created by seijiro on 2019/03/29.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import GoogleMobileAds

class VideoAdsViewController: UIViewController,GADRewardBasedVideoAdDelegate {

   let adMbID = "ca-app-pub-4094455141085255/9905789072"
  let TEST_ID = "ca-app-pub-3940256099942544/1712485313"
  var adUnitID:String? = nil
  let simulation = true
  var adRequestInProgress = false
  var adReady = false
  @IBOutlet var statusLabel: UILabel!
  var rewardBaseVideo:GADRewardBasedVideoAd?

    override func viewDidLoad() {
        super.viewDidLoad()
      if simulation {
        adUnitID = TEST_ID
      } else {
        adUnitID = adMbID
      }
      rewardBaseVideo = GADRewardBasedVideoAd.sharedInstance()
      rewardBaseVideo?.delegate = self

      setUp()
        // Do any additional setup after loading the view.
    }

  @IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }

  func setUp(){
    statusLabel.text = "準備中"
    if !adRequestInProgress && rewardBaseVideo?.isReady == false {
      let req = GADRequest()
      req.testDevices = [kGADSimulatorID,"5e1c394b3baa0778f285d6455e9add20"]
      req.testDevices = ["5e1c394b3baa0778f285d6455e9add20"]
      rewardBaseVideo?.load(req, withAdUnitID: adUnitID!)
       adRequestInProgress = true
      print("junbi")
    }else {
      print("error")
    }
  }
    
  @IBAction func play(_ sender: Any) {
    if GADRewardBasedVideoAd.sharedInstance().isReady && adReady {
      GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
      adReady = false
    } else {
      print("eee")
    }
  }

  func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
    
  }

  func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
    adRequestInProgress = false
    statusLabel.text = "失敗"
    print(error)
  }
  func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    adRequestInProgress = false
    adReady = true
    statusLabel.text = "準備完了"
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
