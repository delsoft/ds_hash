
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
	
	##
	# self remove all empty values and/or keys
	def compact! compact_key=true
	  deep_swap_proc = Proc.new { |k, v| v.delete_if(&deep_swap_proc) if v.kind_of?(Hash);  v.to_s.empty? || (compact_key && k.to_s.empty? ) }
      delete_if &deep_swap_proc
	end

  ##
	# remove all empty values and/or keys of hash
	def compact compact_key=true
     hsh = self.deep_dup
     hsh.compact! compact_key
	end

end