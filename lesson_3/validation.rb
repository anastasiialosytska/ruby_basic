module Validation
  def validate(name, options = {})
    define_method(:validate!) do
      attribute = instance_variable_get("@#{name}".to_sym)
      if options[:presence] && (attribute.nil? || attribute == '')
        raise 'Set the value of variable!'
      elsif options[:format] && attribute.to_s !~ options[:format]
        raise 'Incorrect format!'
      elsif options[:type] && !attribute.instance_of?(options[:type])
        raise 'Incorrect type!'
      end
    end
  end

  define_method(:valid?) { validate! rescue false }
end
