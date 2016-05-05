require 'socket'

server = TCPServer.open(2000)
puts "Starting up web server..."
loop {
	puts "Running..."
	client = server.accept
	#client.puts(Time.now.ctime)
	client.puts "Congratulations for connecting. Now closing..."
	client.close
}

