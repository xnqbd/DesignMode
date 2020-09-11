//
//  CKJAVCaptureTool.swift
//  Demo
//
//  Created by admin2 on 2020/6/5.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit
import AVFoundation

class CKJAVCaptureTool: NSObject {
    
    
    // 摄像头采集内容预览视图
    var preview: UIView? {
        willSet {
            if newValue == nil {
                self.previewLayer.removeFromSuperlayer()
            } else {
                self.previewLayer.frame = newValue!.bounds
                newValue!.layer.addSublayer(self.previewLayer)
            }
        }
    }
    lazy fileprivate var previewLayer: AVCaptureVideoPreviewLayer = {
        let _pre = AVCaptureVideoPreviewLayer(session: self.session)
        _pre.videoGravity = .resizeAspect
        return _pre
    }()
    
    fileprivate var session = AVCaptureSession()
    fileprivate var postion = AVCaptureDevice.Position.front
    fileprivate var device: AVCaptureDevice?
    fileprivate var videoInput: AVCaptureDeviceInput?
    
    override init() {
        super.init()
        
        guard let device = getCameraDevice(position: self.postion) else { return }
        
        // 输入
        guard case videoInput = try? AVCaptureDeviceInput(device: device) else { return }
        
        
//        if session.canAddInput(videoInput) {
//            session.addInput(videoInput)
//        } else {
//            print("加入输入流 input 失败")
//        }
    }
    
    
    func startRunning() {
        
        if !session.isRunning {
           
            session.startRunning()
        }
    }
    
    
    func switchCamera(postion: AVCaptureDevice.Position) {
        if self.postion == postion { return }
        
        session.beginConfiguration()
        
        
        
//        session.removeInput(<#T##input: AVCaptureInput##AVCaptureInput#>)
        
    }
}

extension CKJAVCaptureTool: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
    }
}



extension CKJAVCaptureTool {
    
    func getCameraDevice(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        if #available(iOS 10.0, *) {
            let dissession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera, .builtInTelephotoCamera, .builtInWideAngleCamera], mediaType: .video, position: position)
            for device in dissession.devices {
                if device.position == position {
                    return device
                }
            }
        }
        var des = ""
        switch position {
        case .back:
            des = "后置摄像头"
        case .front:
            des = "前置摄像头"
        default:
            des = "未指定摄像头"
        }
        print("\(des)失败")
        return nil
    }
}
