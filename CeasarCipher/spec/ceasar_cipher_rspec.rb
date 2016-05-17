require_relative '../ceasar_cipher'

describe 'Ceasar Cipher' do
	it "returns a cipher string" do 
		expect(cipher("hello", 0)).to eql("hello")
	end

	it "Returns a one shifted string" do
		expect(cipher("hi", 1)).to eql("ij")
	end

	it "Returns a shifted sentence" do 
		expect(cipher("hi hello", 1)).to eql("ij ifmmp")
	end

	it "Can input a symbol" do 
		expect(cipher("hi!", 1)).to eql("ij!")
	end

	it "Can return a capitalized z while being cipherd" do
		expect(cipher("HIZ!", 1)).to eql("IJA!")
	end
end