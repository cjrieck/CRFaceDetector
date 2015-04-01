//
//  ViewController.swift
//  CRFaceDetector
//
//  Created by Clayton Rieck on 4/1/15.
//  Copyright (c) 2015 Clayton Rieck. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    private weak var takePhotoButton: UIButton!
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        self.view.backgroundColor = UIColor.whiteColor()
        
        var takePhotoButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 35.0))
        takePhotoButton.center = self.view.center
        takePhotoButton.layer.cornerRadius = 15.0
        takePhotoButton.layer.borderColor = UIColor.blueColor().CGColor
        takePhotoButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        takePhotoButton.setTitle("Take Photo", forState: .Normal)
        takePhotoButton.addTarget(self, action: "displayImagePicker", forControlEvents: .TouchUpInside)
        self.view.addSubview(takePhotoButton)
        self.takePhotoButton = takePhotoButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func displayImagePicker()
    {
        var imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .Camera
        presentViewController(imagePickerController, animated: true, completion: {})
    }

    // MARK: Image Picker Controller Delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: {})
        var imageTaken = info[UIImagePickerControllerOriginalImage] as? UIImage
        var imageTakenView = UIImageView(image: imageTaken)
        imageTakenView.frame = self.view.frame
        imageTakenView.contentMode = .ScaleToFill
        self.view.addSubview(imageTakenView)
    }
}

