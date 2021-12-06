module Validation
  def validate(name, options = {})
    define_method(:validate!) do
      attribut = instance_variable_get("@#{name}".to_sym)
      if options[:presence] && (attribut.nil? || attribut == '')
        raise 'Set the value of variable!'
      elsif options[:format] && attribut.to_s !~ options[:format]
        raise 'Incorrect format!'
      elsif options[:type] && !attribut.instance_of?(options[:type])
        raise 'Incorrect type!'
      end
    end
  end

  define_method(:valid?) { validate! rescue false }
end
