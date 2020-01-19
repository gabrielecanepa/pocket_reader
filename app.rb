require_relative "repository"
require_relative "controller"
require_relative "router"

repository = Repository.new("posts.csv")
controller = Controller.new(repository)
router     = Router.new(controller)

router.run
