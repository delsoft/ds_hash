require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DsHash" do

let(:hash_clean_values){
   { a: { b: 1, c: { d: 2 } }, g: 3 , j: [1,2]}
}


let(:hash_with_empty_values) { 
	 { a: { b: 1, c: { d: 2, e: nil}, f: nil }, g: 3, h: nil, j: [nil, 1, 2] }
}


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
  let(:hash_deep_dup) { hash_clean_values.deep_dup }
  it { hash_deep_dup.should eq hash_clean_values }
  it { hash_deep_dup.object_id.should_not eq hash_clean_values.object_id }
end

context "#deep_key?" do 
  it { hash_clean_values.deep_key?(:a, :c, :d).should be_true }
  it { hash_clean_values.deep_key?(:d).should be_false }
  pending "deep key with hash with indifferent access"
end

context "#deep_fetch" do 
  
  let(:hash_with_false_values){
     { a: { b: false}}
    }

  it { hash_clean_values.deep_fetch(:a, :c, :d).should eq 2 }
  it { hash_clean_values.deep_fetch(:a, :b).should eq 1 }
  it { hash_clean_values.deep_fetch(:g).should eq 3 }
  it { hash_clean_values.deep_fetch(:d).should eq nil }
  it { hash_clean_values.deep_fetch(:d, :a, :j).should eq nil }
  it { hash_clean_values.deep_fetch(:d, []).should eq [] }
  it { hash_clean_values.deep_fetch(:d, :a, :j, []).should eq [] }
  it { hash_clean_values.deep_fetch(:d, 'a').should eq 'a' }
  it { hash_clean_values.deep_fetch(:d, :a, :j, 'b').should eq 'b' }

  it { hash_with_false_values.deep_fetch(:a, :b).should === false }
  it { hash_with_false_values.deep_fetch(:a, :b, nil).should === false }


end

context "#to_struct" do
  let(:struct_from_hash) {
     {a: {b: 1, c: {d: 2, e: nil}}, 'k' => 1, 'l' => { 'm' => 2}}.to_struct    
  }

  it { struct_from_hash.a.b.should == 1 }
  it { struct_from_hash.a.c.d.should == 2 }
  it { struct_from_hash.a.c.e.should == nil }

  it { struct_from_hash.k.should eq 1 }
  it { struct_from_hash.l.m.should eq 2 }
end

end
