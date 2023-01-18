
require 'rails_helper'

RSpec.describe Youtube do 
  it 'exists and has attributes' do 
    titile = 'A Super Quick History of Mexico'
    youtube_video_id = ZgrdcffPDDA
    country = "Mexico"

    videos = Youtube.new(title, video, country)
    
    expect(videos).to be_an_instance_of(Youtube)
    expect(videos.title).to eq("A Super Quick History of Mexico")
    expect(videos.youtube_video_id).to eq('ZgrdcffPDDA')
    expect(videos.country).to eq('Mexico')
  end 
end 