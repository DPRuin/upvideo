//
//  ViewController.swift
//  upvideo
//
//  Created by mac126 on 2018/5/16.
//  Copyright © 2018年 mac126. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uploadButtonClick(_ sender: UIButton) {
        print("uploadButtonClick")
        uploadVideo()
        
    }
    
    //上传视频到服务器
    private func uploadImage(){
        let urlString = "http://192.168.1.149/upvideo/upload.php"
        let request = AFHTTPRequestSerializer().multipartFormRequest(withMethod: "POST", urlString: urlString, parameters: nil, constructingBodyWith: { (formdata) in
            let fileURL = Bundle.main.url(forResource: "hh", withExtension: "MP4")!
            do {
                try formdata.appendPart(withFileURL: fileURL, name: "file", fileName: "yy.mp4", mimeType: "video/mp4")
            } catch {
                print("formdataError")
            }
        }, error: nil)
        
        let manager = AFHTTPSessionManager(sessionConfiguration: URLSessionConfiguration.default)
        manager.responseSerializer = AFHTTPResponseSerializer()
        let uploadTask = manager.uploadTask(withStreamedRequest: request as URLRequest, progress: { (uploadProgress) in
            print("-progress-\(uploadProgress.fractionCompleted)")
            
        }) { (response, responseObject, error) in
            if let error = error {
                print("-error-\(error)")
                self.alert(withMessage: "上传失败")
            } else {
                print("-response-\(response)-responseObject-\(String(describing: responseObject))")
                self.alert(withMessage: "上传成功")
            }
        }
        
        uploadTask.resume()
    }
    
    //上传视频到服务器
    private func uploadVideo(){
        let urlString = "http://192.168.1.149/upvideo/upload.php"
        let request = AFHTTPRequestSerializer().multipartFormRequest(withMethod: "POST", urlString: urlString, parameters: nil, constructingBodyWith: { (formdata) in
            let fileURL = Bundle.main.url(forResource: "hh", withExtension: "MP4")!
            do {
                try formdata.appendPart(withFileURL: fileURL, name: "file", fileName: "yy.mp4", mimeType: "video/mp4")
            } catch {
                print("formdataError")
            }
        }, error: nil)
        
        let manager = AFHTTPSessionManager(sessionConfiguration: URLSessionConfiguration.default)
        manager.responseSerializer = AFHTTPResponseSerializer()
        let uploadTask = manager.uploadTask(withStreamedRequest: request as URLRequest, progress: { (uploadProgress) in
            print("-progress-\(uploadProgress.fractionCompleted)")
            
        }) { (response, responseObject, error) in
            if let error = error {
                print("-error-\(error)")
                self.alert(withMessage: "上传失败")
            } else {
                print("-response-\(response)-responseObject-\(String(describing: responseObject))")
                self.alert(withMessage: "上传成功")
            }
        }
        
        uploadTask.resume()
    }
    
    private func alert(withMessage message: String) {
        let alert = UIAlertController(title:"提示",message:message, preferredStyle: .alert)
        let action2 = UIAlertAction(title: "关闭", style: .default, handler: nil)
        alert.addAction(action2)
        self.present(alert , animated: true , completion: nil)
    }


}

