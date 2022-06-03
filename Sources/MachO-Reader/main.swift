import Foundation
import ArgumentParser

struct Reader: ParsableCommand {

    // TODO: figure out what to do with these
    // @Flag(name: [.customShort("f"), .customLong("fat")], help: "Only print the fat header.")
    // var onlyFatHeader: Bool = false

    // @Flag(name: [.customShort("h"), .customLong("header")], help: "Only print the mach-o header.")
    // var onlyHeader: Bool = false

    @Option(help: "The arch of the mach-o header to read.")
    var arch: String?

    @Argument(help: "The binary to inspect.")
    var pathToBinary: String

    func run() throws {
        guard let url = URL(string: "file://\(pathToBinary)") else {
            print("Could not create url for \(pathToBinary)")
            return
        }
        let file = try MachOFile(from: url, arch: arch)
        CLIFormatter.print(file)

        // CLIFormatter.output(file: try MachOFile(from: url))
    }
}

Reader.main()
