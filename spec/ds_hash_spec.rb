require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DsHash" do

let(:hash_clean_values){
	 { a: { b: 1, c: { d: 2 } }, g: 3 }
}

let(:hash_with_empty_values) { 
	 { a: { b: 1, c: { d: 2, e: nil}, f: nil }, g: 3, h: nil }
}

let(:hash_deep_dup) { hash_clean_values.deep_dup }

it "#compact" do 
	hash_with_empty_values.compact.should eq hash_clean_values 
end

it "#compact!" do 
	hash_with_empty_values.compact!.should eq hash_clean_values 
end

context "#deep_dup" do 
	it { hash_deep_dup.should eq hash_clean_values }
	it { hash_deep_dup.object_id.should_not eq hash_clean_values.object_id }
end

end
