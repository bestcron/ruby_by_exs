require "net/http"
require "uri"

# Token used to terminate the file in the post body. Make sure it is not
# present in the file you're uploading.
BOUNDARY = "AaB03x"

uri = URI.parse("http://something.com/uploads")
file = "/path/to/your/testfile.txt"

post_body = []
post_body < < "--#{BOUNDARY}rn"
post_body < < "Content-Disposition: form-data; name="datafile"; filename="#{File.basename(file)}"rn"
post_body < < "Content-Type: text/plainrn"
post_body < < "rn"
post_body < < File.read(file)
post_body < < "rn--#{BOUNDARY}--rn"

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri)
request.body = post_body.join
request["Content-Type"] = "multipart/form-data, boundary=#{BOUNDARY}"

http.request(request)