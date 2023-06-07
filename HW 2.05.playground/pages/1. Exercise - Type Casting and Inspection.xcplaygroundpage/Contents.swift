/*:
 ## Упражнение - приведение типов и их контроль
 
 1.1 Создайте коллекцию типа [Any], включающую несколько дробных чисел, целых, строк и значений логического типа. Выведите содержимое коллекции на консоль.
 */

let items: [Any] = [3.14, "23", "car", 5, 1, false, 0.22, true, "home", "-18"]

for item in items {
    print(item)
}

/*:
 1.2 Переберите коллекцию и для каждого целого числа выведите на консоль "Целое число " и его значение. Повторите то же самое для дробных чисел, строк и булевых значений.
 */

for item in items {
    if let integerItem = item as? Int {
        print("Целое число: \(integerItem)")
    }
}

for item in items {
    if let doubleItem = item as? Double {
        print("Дробное число: \(doubleItem)")
    }
}

for item in items {
    if let stringItem = item as? String {
        print("Строка: \(stringItem)")
    }
}

for item in items {
    if let booleanItem = item as? Bool {
        print("Логическое значение: \(booleanItem)")
    }
}


//ещё один способ сделать то же самое проще
for item in items {
    if item is Int {
        print("Целое число: \(item)")
    } else if item is Double {
        print("Дробное число: \(item)")
    } else if item is String {
        print("Строка: \(item)")
    } else if item is Bool {
        print("Логическое значение: \(item)")
    }
}


//и ещё один способ сделать тоже самое тоже проще
for item in items {
    switch item {
    case is Int:
        print("Целое число: \(item)")
    case is Double:
        print("Дробное число: \(item)")
    case is String:
        print("Строка: \(item)")
    case is Bool:
        print("Логическое значение: \(item)")
    default:
        print("Иной тип данных: \(item)")
    }
}



/*:
 1.3 Создайте словарь [String : Any], где все значения — это смесь дробных и целых чисел, строк и булевых значений. Переберите словарь и выведете на консоль пары ключ/значения для всех элементов коллекции.
 */

let stringsWithAnyItems: [String: Any] = [
    "one": 3.14,
    "two": "23",
    "three": "car",
    "four": 5,
    "fifth": 1,
    "six": false,
    "seven": 0.22,
    "eight": true,
    "nine": "home",
    "ten": "-18"
]

for (stringKey, anyValue) in stringsWithAnyItems {
  print("ключ: \(stringKey), значение: \(anyValue)")
}

//ещё один способ сделать то же самое
for item in stringsWithAnyItems {
    print("ключ: \(item.key), значение: \(item.self)")
}


/*:
 1.4 Создайте переменную `total` типа `Double`, равную 0. Переберите все значения словаря, и добавьте значение каждого целого и дробного числа к значению вашей переменной. Для каждой строки добавьте 1. Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`. Выведите на консоль значение `total`.
 */

var total: Double = 0

for (stringKey, anyValue) in stringsWithAnyItems {
    if let integerValue = anyValue as? Int {
        total += Double(integerValue)
    } else if let doubleValue = anyValue as? Double {
        total += doubleValue
    } else if let stringValue = anyValue as? String {
        total += 1
    } else if let booleanValue = anyValue as? Bool {
        if booleanValue {
            total += 2
        } else {
            total -= 3
        }
    }
}

print(total)

//ещё один способ сделать то же самое
 
var sum = 0.0

for (_, anyValue) in stringsWithAnyItems {
    if let anyValue = anyValue as? Int {
        sum += Double(anyValue)
    } else if let anyValue = anyValue as? Double {
        sum += anyValue
    } else if anyValue is String {
        sum += 1
    } else if let anyValue = anyValue as? Bool {
        sum += anyValue ? 2 : -3
    }
}

print(sum)

//и еще один способ сделать то же самое
var result = 0.0

for value in stringsWithAnyItems.values {
    switch value {
    case let value as Int:
        result += Double(value)
    case let value as Double:
        result += value
    case is String:
        result += 1
    case let value as Bool:
        result += value ? 2 : -3
    default:
        break
    }
}

print(result)

/*:
 1.5 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему. Игнорируйте булевы значения.  Распечатайте итог.
 */

total = 0

for (stringKey, anyValue) in stringsWithAnyItems {
    if let integerValue = anyValue as? Int {
        total += Double(integerValue)
    } else if let doubleValue = anyValue as? Double {
        total += doubleValue
    } else if let stringValue = anyValue as? String {
        total += Double(stringValue) ?? 0
    }
}

print(total)

    
//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
