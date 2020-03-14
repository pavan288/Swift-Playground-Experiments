import UIKit

enum Braces: Character {
    case left = "("
    case right = ")"
    case leftCurly = "{"
    case rightCurly = "}"
    case leftSquare = "["
    case rightSquare = "]"

    var matchingOpen: Braces? {
        switch self {
        case .right:        return .left
        case .rightCurly:   return .leftCurly
        case .rightSquare:  return .leftSquare
        default:            return nil
        }
    }
}

func isBalanced(string: String) -> Bool {
    let sequence = Array(string)
    var stack = [Braces]()
    for char in sequence {
        if let Braces = Braces(rawValue: char) {
            if let open = Braces.matchingOpen {
                guard let last = stack.last, last == open  else {
                    return false
                }
                stack.removeLast()
            } else {
                stack.append(Braces)
            }
        } else {
            fatalError("unknown Braces found")
        }
    }
    return stack.isEmpty
}

isBalanced(string: "()[[]]")

