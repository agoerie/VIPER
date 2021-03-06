//
//  HomeViewController.swift
//  DependencyInjection
//
//  Created by Bherly Novrandy on 8/3/17.
//  Copyright © 2017 Bherly. All rights reserved.
//

import UIKit

protocol IDetailsView: class {
    func showData(data: String)
    func showAlert(message: String)
}

class DetailsViewController: UIViewController {

    var presenter: IDetailsPresenter!
    
    @IBOutlet weak var labelData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
        prepareNavigationItem()
    }
    
    func prepareNavigationItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Click", style: .plain, target: self, action: #selector(rightBarTapped))
    }
    
    func rightBarTapped() {
        showAlert(message: "Tapped")
    }
    
    @IBAction func buttonGetData(_ sender: UIButton) {
        presenter.getData()
    }
    
    @IBAction func buttonDismiss(_ sender: UIButton) {
        presenter.dismiss()
    }
    
}

extension DetailsViewController: IDetailsView {
    func showData(data: String) {
        labelData.text = data
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
