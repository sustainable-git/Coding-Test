func solution(_ phone_number:String) -> String {
    return phone_number.enumerated().map{ (index, value) -> String in 
                                            if phone_number.count - index <= 4 {
                                                return String(value)
                                            } else {
                                                return "*"
                                            }
                                        }.joined()
}