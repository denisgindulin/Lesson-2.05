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
