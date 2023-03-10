require 'socket' # Provides TCPServer and TCPSocket classes

def add a, b
  a + b
end

def add_numbers a, b
  if !a.is_a?(Numeric) || !b.is_a?(Numeric)
    raise ArgumentError.new("Expected a value of numbers")
  end
  return a + b
end

def start
  # Initialize a TCPServer object that will listen
  # on localhost:2345 for incoming connections.
  server = TCPServer.new('localhost', 2345)

  puts "Hello World app running on Port:#{2345}"
  # loop infinitely, processing one incoming
  # connection at a time.
  loop do

    # Wait until a client connects, then return a TCPSocket
    # that can be used in a similar fashion to other Ruby
    # I/O objects. (In fact, TCPSocket is a subclass of IO.)
    socket = server.accept

    # Read the first line of the request (the Request-Line)
    request = socket.gets

    # Log the request to the console for debugging
    STDERR.puts request

    response = "<h1>Hello World! On Device: #{Socket.gethostname}</h1>"

    # We need to include the Content-Type and Content-Length headers
    # to let the client know the size and type of data
    # contained in the response. Note that HTTP is whitespace
    # sensitive, and expects each header line to end with CRLF (i.e. "\r\n")
    socket.print "HTTP/1.1 200 OK\r\n" +
                "Content-Type: text/plain\r\n" +
                "Content-Length: #{response.bytesize}\r\n" +
                "Connection: close\r\n"

    # Print a blank line to separate the header from the response body,
    # as required by the protocol.
    socket.print "\r\n"

    # Print the actual response body, which is just "Hello World!\n"
    socket.print response

    # Close the socket, terminating the connection
    socket.close
  end

end

