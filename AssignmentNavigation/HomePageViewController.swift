//
//  HomePageViewController.swift
//  AssignmentNavigation
//
//  Created by Saba Gogrichiani on 27.10.23.
//

//
//  HomePageViewController.swift
//  AssignmentNavigation
//
//  Created by Saba Gogrichiani on 27.10.23.
//

//  HomePageViewController.swift
//  AssignmentNavigation
//
//  Created by Saba Gogrichiani on 27.10.23.
//

import UIKit

class HomePageViewController: UIViewController {

    var presentButton = UIButton()
    var pushButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    func setupButtons() {
        presentButton.setTitle("Present Color Palette Page", for: .normal)
        presentButton.backgroundColor = .systemBlue
        presentButton.addTarget(self, action: #selector(presentColorPalettePage), for: .touchUpInside)

        pushButton.setTitle("Push Color Palette Page", for: .normal)
        pushButton.backgroundColor = .systemBlue
        pushButton.addTarget(self, action: #selector(pushColorPalettePage), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [presentButton, pushButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            stackView.heightAnchor.constraint(equalToConstant: 120)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    @objc func presentColorPalettePage() {
        let colorPaletteVC = ColorPaletteViewController()
        colorPaletteVC.homePageVC = self
        self.present(colorPaletteVC, animated: true, completion: nil)
    }

    @objc func pushColorPalettePage() {
        let colorPaletteVC = ColorPaletteViewController()
        colorPaletteVC.homePageVC = self
        self.navigationController?.pushViewController(colorPaletteVC, animated: true)
    }

    func changeButtonsColor(_ color: UIColor) {
        presentButton.backgroundColor = color
        pushButton.backgroundColor = color
    }

    func changeBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
