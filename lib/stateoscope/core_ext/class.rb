class Class
  def inherits_from?(superclass_name)
    return false unless const_defined?(superclass_name)
    ancestors.include?(const_get(superclass_name))
  end
end
