require 'zoom'
require 'marc'

class CataloguingController < ApplicationController

  def index
    # present form which accepts catkey
  end

  def create
    # harvest record using z39.50
    @catkey = params['record']['catkey']
    ZOOM::Connection.open('ualapp.library.ualberta.ca', 2200) do |conn|
      conn.database_name = 'Unicorn'
      conn.preferred_record_syntax = 'USMARC'
      rset = conn.search(@catkey)
      File.open("#{Rails.root}/tmp/records/#{@catkey}.mrc", 'wb'){|f|
        f.write rset[0].raw
      }
    end
    process_record(@catkey)
    #redirect_to "cataloguing/index"
  end

  private
  
  def process_record(catkey)
    reader = MARC::Reader.new("#{Rails.root}/tmp/records/#{catkey}.mrc", :external_encoding => "MARC-8")
    record = reader.first
    #record.fields('001')<<("tmp#{catkey}")
    record.fields.delete(MARC::ControlField.new('001',catkey))
    record.fields.push MARC::ControlField.new('001', "tmp#{catkey}")
    writer = MARC::Writer.new("#{Rails.root}/tmp/records/tmp#{catkey}.mrc")
    writer.write(record)
    writer.close
    # delete old marc file

  end

end
