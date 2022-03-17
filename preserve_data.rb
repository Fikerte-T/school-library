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
        if @json_data.empty?
            data_to_write = data.to_json
            # puts data_to_write
            @json_data.push(data_to_write)
            # puts @json_data
            File.open(file_name,"w"){ |f| f.puts @json_data}
        else 
            file_data = File.read(file_name)
            parsed_data = JSON.parse(@json_data)
            parse_data.push(data)
            @json_data << parsed_data
            File.open(file_name,"w"){ |f| f.puts @json_data.to_json}
           
        end
    end

    def read_from_file(file_name)
        file_data = File.read(file_name)
        parsed_data = JSON.parse(file_data)
    end
end

