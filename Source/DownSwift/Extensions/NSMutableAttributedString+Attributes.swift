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
        with configFont: UIFont,
        and configColor: UIColor,
        and strikethroughStyle: NSUnderlineStyle? = nil,
        and strikethroughColor: UIColor? = nil
    ) {
        if let strikethroughStyle = strikethroughStyle, let strikethroughColor = strikethroughColor {
            self.addAttributes(
                [
                    NSAttributedString.Key.font: configFont,
                    NSAttributedString.Key.foregroundColor: configColor,
                    NSAttributedString.Key.strikethroughStyle: strikethroughStyle.rawValue,
                    NSAttributedString.Key.strikethroughColor: strikethroughColor
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
