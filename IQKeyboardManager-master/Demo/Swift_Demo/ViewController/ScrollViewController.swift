//
//  ScrollViewController.swift
//  IQKeyboard
//
//  Created by Iftekhar on 23/09/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet var scrollViewDemo: UIScrollView!
    @IBOutlet var simpleTableView: UITableView!
    @IBOutlet var scrollViewOfTableViews: UIScrollView!
    @IBOutlet var tableViewInsideScrollView: UITableView!
    @IBOutlet var scrollViewInsideScrollView: UIScrollView!

    @IBOutlet var topTextField: UITextField!
    @IBOutlet var bottomTextField: UITextField!

    @IBOutlet var topTextView: UITextView!
    @IBOutlet var bottomTextView: UITextView!

    deinit {
        topTextField = nil
        bottomTextField = nil
        topTextView = nil
        bottomTextView = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier = "\(indexPath.section) \(indexPath.row)"

        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)

        if cell == nil {

            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
            cell?.selectionStyle = .none
            cell?.backgroundColor = UIColor.clear

            let textField = UITextField(frame: cell!.contentView.bounds.insetBy(dx: 5, dy: 5))
            textField.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin, .flexibleWidth]
            textField.placeholder = identifier
            textField.borderStyle = .roundedRect
            cell?.contentView.addSubview(textField)
        }

        return cell!
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
