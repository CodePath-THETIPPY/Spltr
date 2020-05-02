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
import GPUImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, G8TesseractDelegate {
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var textLabel2: UILabel!
    
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
        
        let image = cameraImageView.image!
        
        receipt["image"] = file
        
        let scaledImage = image.scaledImage(1000) ?? image
        
        let preprocessedImage = scaledImage.preprocessedImage() ?? scaledImage
        // photo recognize receipt
        // 1
        if let tesseract = G8Tesseract(language: "eng") {
          // 2
          tesseract.engineMode = .tesseractCubeCombined
          // 3
          tesseract.pageSegmentationMode = .auto
          // 4
          tesseract.image = preprocessedImage
          // 5
          tesseract.recognize()
          // 6
          textLabel.text = tesseract.recognizedText
    
        
            
        
         
            
        }
        
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

extension UIImage {
  // 2
  func scaledImage(_ maxDimension: CGFloat) -> UIImage? {
    // 3
    var scaledSize = CGSize(width: maxDimension, height: maxDimension)
    // 4
    if size.width > size.height {
      scaledSize.height = size.height / size.width * scaledSize.width
    } else {
      scaledSize.width = size.width / size.height * scaledSize.height
    }
    // 5
    UIGraphicsBeginImageContext(scaledSize)
    draw(in: CGRect(origin: .zero, size: scaledSize))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    // 6
    return scaledImage
  }
    
  func preprocessedImage() -> UIImage? {
      // 1
      let stillImageFilter = GPUImageAdaptiveThresholdFilter()
      // 2
      stillImageFilter.blurRadiusInPixels = 15.0
      // 3
      let filteredImage = stillImageFilter.image(byFilteringImage: self)
      // 4
      return filteredImage
  }
}
