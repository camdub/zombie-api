import App
import Meow

let config = try Config()
try config.setup()

try Meow.init("mongodb://localhost:27017/zombie-dev")

let drop = try Droplet(config)
try drop.setup()

try drop.run()
