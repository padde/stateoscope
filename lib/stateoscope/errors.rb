module Stateoscope
  Error = Class.new(StandardError)

  AbstractMethodError = Class.new(Error)
  MissingIntegrationError = Class.new(Error)
end
