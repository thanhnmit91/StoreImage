//
//  ViewController.swift
//  StoresImage
//
//  Created by administrator on 11/15/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import ImagePicker

class ViewController: UIViewController{

    var imagePicker = UIImagePickerController()
    let model = VCViewModel()
    @IBOutlet weak var collectionV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.collectionV.delegate = model
        self.collectionV.dataSource = model
    }
    
    @IBAction func actSelectImage(_ sender: Any) {
        let imagePickerController = ImagePickerController()
        imagePickerController.imageLimit = 50
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
}

extension ViewController: ImagePickerDelegate{
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]){
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]){
        let storage = Storage.storage()
        var totalSize: Double = 0
        let nameChild = "NewsTest-NewsTest"
        for (ind, image) in images.enumerated() {
            let imageName = NSUUID().uuidString // Unique string to reference image

            //Create storage reference for image
            let storageRef = storage.reference().child(nameChild).child("\(imageName)-\(ind).png")

            guard let uplodaData = image.pngData() else{
                return
            }
            totalSize += Double(uplodaData.count)/1000.0

            // Upload image to firebase
            let _ = storageRef.putData(uplodaData, metadata: nil, completion: { (metadata, error) in
                print("totalSize \(totalSize) - \(ind) - \(images.count)")
                if error != nil{
                    print(error)
                    return
                }

            })
        }

        self.dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController){
        self.dismiss(animated: true, completion: nil)
    }
}
