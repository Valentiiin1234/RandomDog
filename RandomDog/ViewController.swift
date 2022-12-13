//
//  ViewController.swift
//  RandomDog
//
//  Created by Mac on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    
    
    private func fetchImage() {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let dog = try JSONDecoder().decode(Dog.self, from: data)
                print(dog)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

