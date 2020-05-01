//
//  CameraViewController.swift
//  KAT
//
//  Created by Tu Anh Nguyen on 4/16/20.
//  Copyright © 2020 KAT. All rights reserved.
//

import UIKit
import AlamofireImage
import TesseractOCR
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, G8TesseractDelegate {
    
    @IBOutlet weak var cameraImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            }
        else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        
        cameraImageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func onSplitBillButton(_ sender: Any) {
        let receipt = PFObject(className: "receipt")
        
        receipt["user"] = PFUser.current()
        let imageData = cameraImageView.image!.pngData()
        
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        receipt["image"] = file
        
        // photo recognize receipt
        
        receipt.saveInBackground { (success, error) in
            if success {
                //add command to move to next screen
                print("saved")
            } else {
                print("failed")
            }
        }
        
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
