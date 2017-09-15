import App
import Meow

let config = try Config()
try config.setup()

let mongoUrl = config["mongodb", "server"]?.string
try Meow.init(mongoUrl!)

let drop = try Droplet(config)
try drop.setup()

try drop.run()
