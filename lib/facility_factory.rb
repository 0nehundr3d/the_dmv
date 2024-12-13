class FacilityFactory
    def create_facilities(dataset)
        facilities = []

        dataset.each do |facility|
            case dataset[0][:state]
            when "CO"
                facility_address = facility[:address_li]
                facility_address << " #{facility[:address__1]}" if facility.include?(:address__1)

                facility_name = facility[:dmv_office]

                facility_phone = facility[:phone]

                services = facility[:services_p].split(/[,;]/)
                services = services.map {|e| e.strip.split.map(&:capitalize).join(" ")}
            when "NY"
                facility_address = facility[:street_address_line_1]
                facility_address << " #{facility[:street_address_line_2]}" if facility.include?(:street_address_line_2)

                facility_name = "#{facility[:office_name]} #{facility[:office_type]}"

                facility_phone = facility[:public_phone_number]

                services = []
            when "MO"
                facility_address = facility[:address1]

                facility_name = facility[:name]

                facility_phone = facility[:phone]

                services = []
            end

            new_facility = Facility.new({
                :name=>facility_name,
                :address=>facility_address,
                :phone=>facility_phone
            })
            
            services.each {|service| new_facility.add_service(service)}
            facilities << new_facility
        end

        facilities
    end
end