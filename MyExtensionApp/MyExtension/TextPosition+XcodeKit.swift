import Foundation
import XcodeKit

extension TextPosition {
    init(position: XCSourceTextPosition) {
        self.init(line: UInt(position.line), column: UInt(position.column))
    }
}

extension TextRange {
    init(position: XCSourceTextRange) {
        self.init(start: TextPosition(position: position.start),
                  end: TextPosition(position: position.end))
    }
}

extension XCSourceTextPosition {
    init(position: TextPosition) {
        self.init()
        line = Int(position.line)
        column = Int(position.column)
    }
}

extension XCSourceTextRange {
    convenience init(range: TextRange) {
        self.init(start: XCSourceTextPosition(position: range.start),
                  end: XCSourceTextPosition(position: range.end))
    }
}
