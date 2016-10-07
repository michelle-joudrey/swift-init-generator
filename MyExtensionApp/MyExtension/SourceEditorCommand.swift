//
//  SourceEditorCommand.swift
//  MyExtension
//
//  Created by Michelle Joudrey on 10/7/16.
//  Copyright © 2016 Michelle Joudrey. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        guard let selection = invocation.buffer.selections.firstObject as? XCSourceTextRange else {
            return
        }
        let allLines = invocation.buffer.lines.flatMap { $0 as? String }
        // trim lines
        var selectedLines = Array(allLines[selection.start.line ... selection.end.line])
        // trim columns
        if let firstLine = selectedLines.first {
            let chars = Array(firstLine.characters)
            selectedLines[0] = String(chars.suffix(from: selection.start.column))
        }
        if let lastLine = selectedLines.last {
            let chars = Array(lastLine.characters)
            selectedLines[selectedLines.count - 1] = String(chars.prefix(through: selection.end.column))
        }
        let selectedCode = selectedLines.joined(separator: "\n")
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
