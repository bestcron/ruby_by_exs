require 'httparty'
require 'json'

response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=askubuntu')

walk_by_reps(JSON.parse(response.body)["items"]).each(&:join)

BEGIN {
	def will_deleted?
		false
	end

	def sec_will_deleted?
		false
	end

	def outp(title, body)
		puts "-" * 30
		puts "---#{title}---"
		puts "#{body}"
		puts "-" * 30
	end

	def do_desc(option, value)
		puts "#{option}:  #{value}"
	end

	def walk_by_reps(items)
		threads = []
		items.each_with_index do |item, i|
			threads << Thread.new(item, i) do |item, i|
				puts "--#{i}---\n---"

				walker = Walker.new(item)
				walker.short_info
			end
		end
		threads
	end

	class Walker
		attr_reader :item

		def initialize(item)
			@item = item
		end

		def outp
			short_info
		end

		def short_info
			do_desc 'reput', item["owner"]["reputation"]
			do_desc 'd_name', item["owner"]["display_name"]
		end

		def firs
			puts "firs"
		end

		def insp
			puts item.class
		end

		def stashed
			puts "Git strash"
		end
	end
}