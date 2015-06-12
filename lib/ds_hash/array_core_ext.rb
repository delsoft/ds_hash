class Array
  unless self.method_defined? 'clean'
  
    def clean!
      swoop = Proc.new { |v| 
        if v.respond_to? 'clean!'
          v.clean!
          v.empty?
        elsif v.respond_to? 'compact!'
          v.compact!
          v.empty?
        else
           v.to_s.empty? 
        end        
      }
      delete_if &swoop
    end
    
    def clean
      arr = self.deep_dup
      arr.clean!
    end
    
    alias_method :compact, :clean unless self.method_defined? 'compact'
    alias_method :compact!, :clean! unless self.method_defined? 'compact!'
  end

end