import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multipled, range
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    var definition: String {
        
        switch self {
        case .dog:
            return "You are incredibly outgoing.You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoydoing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
        
    }
}

var questions: [Question] = [
    
    Question(text: "Qué comida te gusta más?", type: .single, answers: [
        Answer(text: "Steak", type: .dog),
        Answer(text: "Fish", type: .cat),
        Answer(text: "Carrot", type: .rabbit),
        Answer(text: "Corn", type: .turtle)
        ]),
    
    Question(text: "Qué actividades disfrutas?", type: .multipled, answers: [
        Answer(text: "Swinning", type: .turtle),
        Answer(text: "Sleeping", type: .cat),
        Answer(text: "Cuddling", type: .rabbit),
        Answer(text: "Eating", type: .dog)
        ]),
    
    Question(text: "Qué tanto disfrutas paseos en coche?", type: .range, answers: [
    Answer(text: "No me gustan", type: .cat),
    Answer(text: "Me ponen un poco nervioso", type: .rabbit),
    Answer(text: "Apenas lo noto", type: .turtle),
    Answer(text: "Me gustan", type: .dog)
    ])
    
]


