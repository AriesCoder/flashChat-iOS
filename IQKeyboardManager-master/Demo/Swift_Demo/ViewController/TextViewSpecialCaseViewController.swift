//
//  TextViewSpecialCaseViewController.swift
//  IQKeyboard
//
//  Created by Iftekhar on 23/09/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

import UIKit

class TextViewSpecialCaseViewController: UIViewController, UITextViewDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet var buttonPush: UIButton!
    @IBOutlet var buttonPresent: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.navigationController == nil {
            buttonPush.isHidden = true
            buttonPresent.setTitle("Dismiss", for: .normal)
        }
    }

    override func viewWillAppear (_ animated: Bool) {

        super.viewWillAppear(animated)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        if text == "\n" {
            textView.resignFirstResponder()
        }

        return true
    }

    @IBAction func presentClicked (_ barButton: UIButton!) {

        if (navigationController) != nil {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TextViewSpecialCaseViewController") {
                present(controller, animated: true, completion: nil)
            }
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let identifier = segue.identifier else {
            return
        }

        if identifier == "SettingsNavigationController" {

            let controller = segue.destination

            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem

            let heightWidth = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
            controller.preferredContentSize = CGSize(width: heightWidth, height: heightWidth)
            controller.popoverPresentationController?.delegate = self
        }
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        self.view.endEditing(true)
    }

    override var shouldAutorotate: Bool {
        return true
    }
}
