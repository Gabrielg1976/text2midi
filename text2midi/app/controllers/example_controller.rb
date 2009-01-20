class ExampleController < ApplicationController
  require 'super_midi'
  
  def write_text
  end
  
  def make_midi
    if params[:midi_text]
       temp = params[:midi_text].to_midi(params[:tempo].to_i)
      @filename = temp.split("/").last
    else
      render :text => "ERROR"
    end
  end
  
  def download_midi
    filename = params[:file]
    puts params.inspect
    send_file("#{RAILS_ROOT}/public/midifiles/#{filename}", "new_song.mid")
  end
  
end