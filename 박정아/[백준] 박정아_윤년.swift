func solution() {
    let year = Int(readLine() ?? "") ?? 0
    if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) {
        print(1)
        return
    }
    print(0)
}

solution()
