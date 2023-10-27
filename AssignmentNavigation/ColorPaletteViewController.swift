//
//  ColorPaletteViewController.swift
//  AssignmentNavigation
//
//  Created by Saba Gogrichiani on 27.10.23.
//

import UIKit

//  ColorPaletteViewController.swift
//  AssignmentNavigation
//
//  Created by Saba Gogrichiani on 27.10.23.
//

import UIKit

class ColorPaletteViewController: UIViewController {

    var homePageVC: HomePageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        // Create the labels
        let label1 = UILabel()
        label1.text = "Change Home Buttons Background Colors"
        label1.textAlignment = .center

        let label2 = UILabel()
        label2.text = "Change Home Background Color"
        label2.textAlignment = .center

        // Create the buttons
        let buttonColors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
        
        let buttonStack1 = UIStackView()
        buttonStack1.axis = .horizontal
        buttonStack1.distribution = .fillEqually
        buttonStack1.spacing = 10

        let buttonStack2 = UIStackView()
        buttonStack2.axis = .horizontal
        buttonStack2.distribution = .fillEqually
        buttonStack2.spacing = 10

        for color in buttonColors {
            let button1 = UIButton()
            button1.backgroundColor = color
            button1.addTarget(self, action: #selector(changeHomeButtonsColor(_:)), for: .touchUpInside)
            buttonStack1.addArrangedSubview(button1)

            let button2 = UIButton()
            button2.backgroundColor = color
            button2.addTarget(self, action: #selector(changeHomeBackgroundColor(_:)), for: .touchUpInside)
            buttonStack2.addArrangedSubview(button2)
        }

         // Create the stack view
         let stackView = UIStackView(arrangedSubviews: [label1, buttonStack1, label2, buttonStack2])
         stackView.axis = .vertical
         stackView.distribution = .fillEqually
         stackView.spacing = 20

         // Add the stack view to the view
         view.addSubview(stackView)

         // Disable autoresizing masks
         stackView.translatesAutoresizingMaskIntoConstraints = false

         // Define the constraints
         let constraints = [
             stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             stackView.widthAnchor.constraint(equalToConstant: 250),
             stackView.heightAnchor.constraint(equalToConstant: 240)
         ]

         // Activate the constraints
         NSLayoutConstraint.activate(constraints)
     }

     @objc func changeHomeButtonsColor(_ sender: UIButton) {
         homePageVC?.changeButtonsColor(sender.backgroundColor ?? .white)
         self.navigationController?.popViewController(animated: true)
         self.dismiss(animated: true)
     }

     @objc func changeHomeBackgroundColor(_ sender: UIButton) {
         homePageVC?.changeBackgroundColor(sender.backgroundColor ?? .white)
         self.navigationController?.popViewController(animated: true)
         self.dismiss(animated: true)
     }
}
