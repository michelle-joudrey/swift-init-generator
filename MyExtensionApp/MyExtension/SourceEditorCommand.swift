import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    enum Errors: Error {
        case TooManySelections
        case NoSelections
    }

    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        let buffer = invocation.buffer.completeBuffer
        let selections = invocation.buffer.selections.map { $0 as! XCSourceTextRange }
        guard let selection = selections.first, selections.count == 1 else {
            if selections.count == 0 {
                completionHandler(Errors.NoSelections)
            }
            else {
                completionHandler(Errors.TooManySelections)
            }
            return
        }
        let selectedCode = buffer[buffer.range(for: TextRange(position: selection))!]
        let selectedVars = vars(inCode: selectedCode)
        let initParams = selectedVars.map { "\($0.name): \($0.type)" }.joined(separator: ", ")        
        let indent: String = {
            if invocation.buffer.usesTabsForIndentation {
                return "\t"
            }
            return String(repeating: " ", count: invocation.buffer.tabWidth)
        }()
        let initBody = selectedVars.map { "\(indent)self.\($0.name) = \($0.name)" }.joined(separator: "\n")
        let generatedInit = "init(\(initParams)) {\n\(initBody)\n}".components(separatedBy: "\n").map { indent + $0 }.joined(separator: "\n")
        if selection.end.line == invocation.buffer.lines.count - 1 {
            invocation.buffer.lines.add(generatedInit)
        }
        else {
            invocation.buffer.lines.insert(generatedInit, at: selection.end.line + 1)
        }
        completionHandler(nil)
    }
    
}
