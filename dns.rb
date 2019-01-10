#!/usr/bin/env ruby
puts "[*] Searching with SHODAN"
begin
      api = Shodan::WebAPI.new(shodan_api_key)
      query = domain # Something like example.com
      result = api.search(query)
      result['matches'].each do |host|
            print "IP #{host['ip']} #{host['country']} #{host['os']} => "
            result = ptrpetition(host['ip'])
            if result.size == 0
                  puts "DNS not found"
            else
                  puts result
            end
      end
rescue
      puts " Error searching with SHODAN"
end
