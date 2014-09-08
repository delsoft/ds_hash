require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DsHash" do

let(:hash_clean_values){
	 { a: { b: 1, c: { d: 2 } }, g: 3 , j: [1,2]}
}

let(:hash_with_empty_values) { 
	 { a: { b: 1, c: { d: 2, e: nil}, f: nil }, g: 3, h: nil, j: [nil, 1, 2] }
}

let(:hash_deep_dup) { hash_clean_values.deep_dup }

it "#compact" do 
  hash_with_empty_values.compact.should eq hash_clean_values 
end

it "#compact!" do 
  hash_with_empty_values.compact!.should eq hash_clean_values 
end

it "#clean" do 
  hash_with_empty_values.compact.should eq hash_clean_values 
end

it "#clean!" do
  hash_with_empty_values.compact!.should eq hash_clean_values 
end

context "#deep_dup" do 
  it { hash_deep_dup.should eq hash_clean_values }
  it { hash_deep_dup.object_id.should_not eq hash_clean_values.object_id }
end

context "#deep_key?" do 
  it { hash_clean_values.deep_key?(:a, :c, :d).should be_true }
  it { hash_clean_values.deep_key?(:d).should be_false }
end

context "#deep_fetch" do 
  it { hash_clean_values.deep_fetch(:a, :c, :d).should eq 2 }
  it { hash_clean_values.deep_fetch(:a, :b).should eq 1 }
  it { hash_clean_values.deep_fetch(:g).should eq 3 }
  it { hash_clean_values.deep_fetch(:d).should eq nil }
  it { hash_clean_values.deep_fetch(:d, :a, :j).should eq nil }
end

end
