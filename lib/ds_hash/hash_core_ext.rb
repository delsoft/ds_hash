class Hash
  
  ##
  # :method: deep_dup
  # 	Returns a deep copy of hash. like rails active support

  
  define_method 'deep_dup' do
		duplicate = self.dup
			duplicate.each_pair do |k,v|
				tv = duplicate[k]
				duplicate[k] = tv.is_a?(Hash) && v.is_a?(Hash) ? tv.deep_dup : v
			end
			duplicate
	end unless self.method_defined? 'deep_dup'
	

  unless self.method_defined? 'clean'
  
    def clean!
      swoop = Proc.new { |k, v| 
        if v.respond_to? 'clean!'
          v.clean!
          false
        elsif v.respond_to? 'compact!'
          v.compact!
          false
        else
          v.to_s.empty? 
        end
      }
      delete_if &swoop
    end
    
    def clean
      hsh = self.deep_dup
      hsh.clean!
    end
    
    alias_method :compact, :clean unless self.method_defined? 'compact'
    alias_method :compact!, :clean! unless self.method_defined? 'compact!'
  end


  unless self.method_defined? 'deep_key?' 
    def deep_key? *keys
      key = keys.shift
      return key?(key) if keys.empty?
      return self[key].deep_key?(*keys) if self[key].is_a? Hash
      false
    end
  end

  unless self.method_defined? 'deep_fetch' 
    def deep_fetch *keys
      def_value = keys.pop unless keys[keys.size-1].is_a? Symbol
      key = keys.shift
      if !key.is_a? Symbol
        return nil
      elsif keys.empty? 
        if block_given?
          ret = yield self[key] || {}
        else
          ret = self[key] 
        end
      elsif self[key].is_a? Hash      
        ret = self[key].deep_fetch(*keys)  
      end
      ret == nil ? def_value : ret
    end
  end

  unless self.method_defined? 'to_struct' 
    def to_struct
      hash = self
      klass = Struct.new(*hash.keys.map(&:to_sym) )
      struct = klass.new(*hash.values)
      hash.each do |key, value|
        if value.is_a?(Hash)
          v = value.to_struct
          struct[key] = v
        end
      end
      return struct
    end
  end

end