import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var totalEmptyCokes = n
    var numberOfCokesCanGet = 0
    
    while totalEmptyCokes >= a {
        let numberOfBottleBundleReturnedThisTime = totalEmptyCokes / a
        totalEmptyCokes -= numberOfBottleBundleReturnedThisTime * a
        
        let numberOfCokesGetThisTime = numberOfBottleBundleReturnedThisTime * b
        numberOfCokesCanGet += numberOfCokesGetThisTime
        totalEmptyCokes += numberOfCokesGetThisTime
    }
    
    return numberOfCokesCanGet
}
