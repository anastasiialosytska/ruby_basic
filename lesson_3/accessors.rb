module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      history = []
      define_method("#{name}=".to_sym) do |value|
        history.push(instance_variable_set(var_name, value))
      end
      define_method("#{name}_history") { puts history }
    end
  end

  def strong_attr_accessor(name, value_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      if value.instance_of?(value_class)
        instance_variable_set(var_name, value)
      else
        raise TypeError
      end
    end
  end
end
