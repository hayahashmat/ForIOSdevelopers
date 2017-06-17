//
//  ViewController.swift
//  meme
//
//  Created by Nano Degree on 02/04/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var bottom: UITextField!
    @IBOutlet weak var top: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dic : [String:Any] = [NSForegroundColorAttributeName : UIColor.white , NSStrokeColorAttributeName : UIColor.black,NSStrokeWidthAttributeName : true,NSFontAttributeName :UIFont.systemFont(ofSize: 17)]
        
        self.top.defaultTextAttributes = dic
        self.bottom.defaultTextAttributes = dic
        self.top.textAlignment = .center
        self.bottom.textAlignment = .center
        self.top.delegate = self
        self.bottom.delegate = self
    
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardopen(notification:)), name: .UIKeyboardWillShow, object: nil)
    
    
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardClose(notification:), name: .UIKeyboardWillHide, object: nil)
    }
    func keyboardopen(notification:Notification){
        self.view.origin.y = -getheight(notification:notification)
        
        
        
        
    }
    func keyboardClose(notification:Notification){
        self.view.origin.y = 0
    }
    func getheight(notification:Notification)->CGFloat{
        let info = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue
        return info.cgRectValue.height
        
        
        
        
    }
    @IBAction func activity(_ sender: AnyObject) {
        
        
        
        
        
    }

    @IBAction func cancel(_ sender: AnyObject) {
        func memeimage()->UIImage{
            
            self.navbar.isHidden = true
            self.toolbar.isHidden= true
            
            
        }
        
        
        
        
    }
    func memeimage()->UIImage{
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let mimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return mimage!
        
    }
    
    @IBAction func camera(_ sender: AnyObject) {
        
        
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        imagepicker.sourceType = .camera
        self.present(imagepicker, animated: true, completion: nil)

        
        
        
        
    }
    
    @IBAction func album(_ sender: AnyObject) {
        
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        imagepicker.sourceType = .photoLibrary
        self.present(imagepicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
        self.imagePickerView.image = image
        picker.dismiss(animated: true, completion: nil)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.top.resignFirstResponder()
        self.bottom.resignFirstResponder()
        return true
    }
        
        
        
    
}

