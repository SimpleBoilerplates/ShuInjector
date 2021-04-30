
//  Created by sadman samee on 29/4/21.
//

import Foundation

final class ShuInjectorAssembler {
    private static var shared = ShuInjectorAssembler()

    private init() {}

    static func assemble(assembler: ShuiAssembler) {
        shared.assemble(assemblers: [assembler])
    }

    static func assemble(assemblers: [ShuiAssembler]) {
        shared.assemble(assemblers: assemblers)
    }

    static func disassemble(assemblers: [ShuiAssembler]) {
        shared.disassemble(assemblers: assemblers)
    }

    static func disassemble(assembler: ShuiAssembler) {
        shared.disassemble(assemblers: [assembler])
    }

    private func assemble(assemblers: [ShuiAssembler]) {
        for assembler in assemblers {
            assembler.assemble()
        }
    }

    private func disassemble(assemblers: [ShuiAssembler]) {
        for assembler in assemblers {
            assembler.disassemble()
        }
    }
}
