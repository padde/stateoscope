RSpec::Matchers.define :have_abstract_method do |method_name|
  match do |object|
    begin
      arity = [0, object.method(method_name.to_sym).arity].max
      args = [nil] * arity
      object.public_send(method_name, *args)
      false
    rescue Stateoscope::AbstractMethodError
      true
    rescue StandardError
      false
    end
  end
end
