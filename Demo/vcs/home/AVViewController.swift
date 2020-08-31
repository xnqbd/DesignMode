//
//  AVViewController.swift
//  Demo
//
//  Created by admin2 on 2020/6/3.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit
import AVFoundation

class AVViewController: UIViewController {

    var avCaptureTool = CKJAVCaptureTool()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
     
        
        avCaptureTool.preview = self.view
        
        avCaptureTool.startRunning()
        
        
        
        
        
//        AVCaptureDevice.devices()
        
//        AVCaptureDeviceInput
//        AVCaptureMovieFileOutput
        
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
