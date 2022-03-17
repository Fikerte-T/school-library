require 'json'

class PreserveData
    # def initialize(file_name, data) 
    #     @file_name = file_name
    #     @data = data
    # end
    attr_accessor :json_data
    def initialize
        @json_data = []
    end
    def write_to_file(file_name, data)
        file_data = File.read(file_name)
        if  file_data.empty?
            File.open(file_name,"w"){ |f| f.puts data.to_json}
        else 
            parsed_data = JSON.parse(file_data)
            puts "parse_data"
            @json_data.push(parsed_data)
            @json_data.push(data)
            File.truncate(file_name, 0)
            File.open(file_name,"w"){ |f| f.puts json_data.to_json}
           
        end
    end

    def read_from_file(file_name)
        file_data = File.read(file_name)
        if file_data.empty?
            1
        else
            parsed_data = JSON.parse(file_data)
        end
    end
end

