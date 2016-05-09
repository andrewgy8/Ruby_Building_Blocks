require 'socket'

server = TCPServer.open(2000)
puts "Starting up web server..."
loop {
	puts "Running..."
	client = server.accept
	header = ""
	while line = client.gets
		header << line
	end

	method = header.split[0]
	path = header.split[1][1..-1]
	if method == "GETS" 
		response = File.open(path, 'r').read
		response_header = "HTTP/1.0 200 OK\nContent-Length: #{response_body.length}\r\n\r\n" 

	else
		response_header = "HTTP/1.0 404 Not Found\n"

	end

	client.puts(response_header)
	client.puts(response)
	client.puts "Congratulations for connecting. Now closing..."
	response.close
	client.close
}

