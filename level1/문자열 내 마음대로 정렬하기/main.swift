func solution(_ strings:[String], _ n:Int) -> [String] {
    var strCpy = strings
    strCpy.sort{
        if Array($0)[n-1] > Array($1)[n-1] {
            return false
        } else if Array($0)[n-1] < Array($1)[n-1] {
            return true
        } else {
            return true
        }
    }
    return strCpy
}
