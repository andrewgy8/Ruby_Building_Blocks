require 'csv'
require 'sunlight/congress'
require 'erb'


Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zip)
	zip.to_s.rjust(5, "0")[0..4]	
end

def legislator_name(zip)
	Sunlight::Congress::Legislator.by_zipcode(zip)
end

def save_thank_you_letter(id, form_letter)
	Dir.mkdir("output") unless Dir.exists? ("output")
	filename = "output/thanks_#{id}.html"

	File.open(filename, 'w') do |file|
		file.puts form_letter
	end
end

lines = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read "form_letter.erb"
erb_letter = ERB.new template_letter

lines.each do |row|
	id = row[0]
	name = row[:first_name]
	zip = clean_zipcode(row[:zipcode]) 
	legislators = legislator_name(zip)
	form_letter = erb_letter.result(binding)
	save_thank_you_letter(id, form_letter)
end

