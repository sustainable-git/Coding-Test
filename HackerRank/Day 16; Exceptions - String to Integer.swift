import Foundation

/*
 * Define an ErrorType
 */
enum StringToIntTypecastingError: Error {
    case BadString
}
func stringToInt(inputString: String) throws -> Int {
    guard let success = Int(inputString) else {
        throw StringToIntTypecastingError.BadString
    }
    return success
}
/*
 * Read the input
 */
let inputString = readLine()!

do {
    try print(stringToInt(inputString: inputString))
} catch StringToIntTypecastingError.BadString {
    print("Bad String")
}
