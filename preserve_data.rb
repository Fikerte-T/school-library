require 'json'
class PreserveData
    attr_accessor :json_data
    def initialize
        @json_data = []
    end
    def write_to_file(file_name, data)
        file_data = File.read(file_name)
        if  file_data.empty?
            @json_data.push(data)
            File.open(file_name,"w"){ |f| f.puts data.to_json}
        else 
            parsed_data = JSON.parse(file_data)
            parsed_data.push(data)
            puts "parse_data"
            @json_data.clear
            parsed_data.each { |d| @json_data.push(d)}
            File.open(file_name,"w"){ |f| f.puts @json_data.to_json}
           
        end
    end

    def read_from_file(file_name)
        file_data = File.read(file_name)
        if file_data.empty?
            1
        else
            parsed_data = JSON.parse(file_data)
            parsed_data
        end
    end
end

