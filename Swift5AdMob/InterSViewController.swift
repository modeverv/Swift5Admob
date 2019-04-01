//
//  InterSViewController.swift
//  Swift5AdMob
//
//  Created by seijiro on 2019/03/29.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import GoogleMobileAds

class InterSViewController: UIViewController,GADInterstitialDelegate {

  let adMobId = "ca-app-pub-4094455141085255/6541259137"
  let SIMULATOR_ID = kGADSimulatorID
  let DEVICE_TEST_ID = "5e1c394b3baa0778f285d6455e9add20"
  let simulatrTest = false
  let delay = 3.5

    override func viewDidLoad() {
        super.viewDidLoad()
      let interstitial = GADInterstitial(adUnitID: adMobId)
      let request = GADRequest()
      request.testDevices = [SIMULATOR_ID]
      request.testDevices = [DEVICE_TEST_ID]
      interstitial.load(request)
      DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        print("dequeue")
        self.showAdMb(interstitial: interstitial)
      }

        // Do any additional setup after loading the view.
    }
    
  func showAdMb(interstitial:GADInterstitial) {
    if interstitial.isReady {
      interstitial.present(fromRootViewController: self)
    } else {
      print("3.5秒後ダメだった")
    }
  }

   @IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)
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
