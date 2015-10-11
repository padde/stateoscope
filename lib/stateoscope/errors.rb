module Stateoscope
  Error = Class.new(StandardError)

  AbstractMethodError = Class.new(Error)
  MissingAdapterError = Class.new(Error)
end
