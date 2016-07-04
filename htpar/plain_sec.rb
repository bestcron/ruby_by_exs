require 'httparty'
require 'json'

response = HTTParty.get('https://golang.org/doc/install.json')
body = response.body
outp 'code', response.code
outp 'msg', response.message
outp 'headers', response.headers.inspect
outp 'body', body[0..89]
# waller = Walker.new(body[0])
# puts waller&.kl&.instance_methods&.join(',')
# walk_by_reps(body).each(&:join)

BEGIN {
	def will_deleted?
		false
	end

	def sec_will_deleted?
		false
	end

	def htpa_will_deleted?
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
		attr_reader :item, :kl

		def initialize(item)
			@item = item
			@kl = klass_or_nil
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

		def klass_or_nil
			nil
		end

		def stashed
			puts "Git strash"
		end
	end
}