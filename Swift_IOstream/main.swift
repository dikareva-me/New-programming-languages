import Foundation

func readInput(fromFile: Bool) -> String? {
    if fromFile {
        print("Укажите путь к файлу:")
        guard let filePath = readLine() else {
            return nil
        }
        
        let fileURL = URL(fileURLWithPath: filePath)
        let fileData = try? String(contentsOf: fileURL, encoding: .utf8)
        
        return fileData?.trimmingCharacters(in: .newlines)
    } else {
        print("Введите имя пользователя и фамилию:")
        return readLine()?.trimmingCharacters(in: .newlines)
    }
}

func writeOutput(_ text: String) {
    let fileURL = URL(fileURLWithPath: "out.txt")
    
    if FileManager.default.fileExists(atPath: fileURL.path) {
        try? FileManager.default.removeItem(at: fileURL)
    }
    
    FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
    
    let fileHandle = try? FileHandle(forWritingTo: fileURL)
    fileHandle?.seekToEndOfFile()
    fileHandle?.write(text.data(using: .utf8) ?? Data())
    fileHandle?.closeFile()
}

print("Выберите источник данных:")
print("1. Чтение из файла")
print("2. Чтение из консоли")

if let inputChoice = readLine(), let choice = Int(inputChoice) {
    var inputFromConsole = true
    
    switch choice {
    case 1:
        inputFromConsole = false
    case 2:
        inputFromConsole = true
    default:
        print("Неверный выбор.")
        exit(0)
    }
    
    if let inputData = readInput(fromFile: !inputFromConsole) {
        let formattedData = inputData.capitalized
        print("Форматированные данные: \(formattedData)")
        writeOutput(formattedData)
    } else {
        print("Ошибка при чтении входных данных.")
    }
} else {
    print("Ошибка при чтении выбора источника данных.")
}