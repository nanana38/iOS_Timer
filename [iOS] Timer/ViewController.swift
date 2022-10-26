//
//  ViewController.swift
//  [iOS] Timer
//
//  Created by 유현이 on 2022/10/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(dosomethingAfterSecond), userInfo: nil, repeats: true)
    }
    
    @objc func  dosomethingAfterSecond() {
        if number > 0 {
            number -= 1
            slider.value = Float(number)/Float(60)
            mainLabel.text = "\(number) 초"
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            AudioServicesPlayAlertSound(SystemSoundID(1300))
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        configureUI()
        number = 0
        timer?.invalidate()
    }
}

