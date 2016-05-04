require 'jumpstart_auth'

class TwitterBot

	attr_reader :client
	def initialize
		puts "Initializing TwitterBot"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			puts "Sorry, your message is too long try again."
			tweet
		end
	end

	def dm(target, message)
		puts "Trying to send #{target} a message."
		message = "d @#{target} #{message}"
		screen_names = @client.followers.collect {|follower| @client.user(follower).screen_name}
		puts screen_names
		if screen_names.include? (target) then tweet(message)
		else puts "Sorry, this screen name is not in valid. /nPlease enter a valid screen name."
		end
		
	end

	def last_tweets
	# for somereason the methods that are to be used in this method do not function properly    	
	end

	def followers_list
		followers_list = @client.followers.collect {|follower| @client.user(follower).screen_name}
		return followers_list
	end

	def spam_my_followers(message)
		followers = followers_list
		followers.each {|follower| dm(follower, message)}
	end
	def run
		puts "Welcome to the AGY Twitter client!"
		command = ''
		puts "Please type your command: 
		\nq(uit), \nt(weet)- followed by your message, 
		\ndm(direct message)-followed by the user name and message, \nf(ollower), \nspam- followed by the message"
		printf "enter command: "
		input = gets.chomp
		parts = input.split(" ")
		command = parts[0]
		case command
		when 'q' then puts 'Goodbye!'
		when 't' then tweet(parts[1..-1].join(' '))
		when 'dm' then dm(parts[1], parts[2..-1].join(' '))
		when 'f' then follower
		when 'spam' then spam_my_followers(parts[1..-1].join(' '))
		else
			puts "Sorry, I dont know how to #{command}"
		end
	end
end

blogger = TwitterBot.new
blogger.last_tweets
#blogger.run

