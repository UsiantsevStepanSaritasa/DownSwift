//
//  NSMutableAttributedString+Attributes.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import UIKit

extension NSMutableAttributedString {
    /// A function that adds attributes to attributed string depending on given parameters.
    ///
    /// - parameters:
    ///     - configFont: A font that will be given to current attributed string.
    ///     - configColor: A font color that will be given to current attributed string.
    ///     - strikethroughStyle: The NSUnderlineStyle value that will be given to current attributed string.
    ///     - strikethroughColor: A strikethrough line color that will be given to current attributed string.
    func addConfigAttributes(
        configFont: UIFont,
        configColor: UIColor,
        strikethroughStyle: (NSUnderlineStyle, UIColor)? = nil
    ) {
        if let strikethroughStyle = strikethroughStyle {
            self.addAttributes(
                [
                    NSAttributedString.Key.font: configFont,
                    NSAttributedString.Key.foregroundColor: configColor,
                    NSAttributedString.Key.strikethroughStyle: strikethroughStyle.0.rawValue,
                    NSAttributedString.Key.strikethroughColor: strikethroughStyle.1
                ],
                range: NSMakeRange(0, self.length))
        } else {
            self.addAttributes(
                [
                    NSAttributedString.Key.font: configFont,
                    NSAttributedString.Key.foregroundColor: configColor
                ],
                range: NSMakeRange(0, self.length))
        }
    }
}
