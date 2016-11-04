import Foundation

func stringifyPtr(_ pointer: UnsafePointer<Int8>) -> String {
    let data = Data(bytes: pointer, count: Int(strlen(pointer)))
    return String(data: data, encoding: String.Encoding.utf8)!
}

struct VarDecl {
    let name: String
    let type: String
}

func vars(inCode code: String) -> [VarDecl] {
    let numVarsPtr = UnsafeMutablePointer<Int32>.allocate(capacity: 1)
    var vars = getVars(code, numVarsPtr)
    let numVars = numVarsPtr.pointee
    var decls = [VarDecl]()
    for _ in 0 ..< numVars {
        guard let unwrappedVars = vars else {
            break
        }
        let v = unwrappedVars.pointee
        let name = stringifyPtr(v.name)
        let type = stringifyPtr(v.type)
        decls.append(VarDecl(name: name, type: type))
        vars = unwrappedVars.advanced(by: 1)
    }
    return decls
}
