require 'rails_helper'

RSpec.describe Upsplash do 
  it 'exists and has attributes' do 
    alt_tag = 'people standing on corner road near concrete buildings during daytime'
    url = "https://images.unsplash.com/photo-1518105779142-d975f22f1b0a?ixid=MnwzOTk4MzB8MHwxfHNlYXJjaHwxfHxNZXhpY298ZW58MHx8fHwxNjczOTA4MTcx&ixlib=rb-4.0.3"
    country = 'Mexico'

    image = Upsplash.new(alt_tag, url, country)
    
    expect(image).to be_an_instance_of(Upsplash)
    expect(image.url).to eq("https://images.unsplash.com/photo-1518105779142-d975f22f1b0a?ixid=MnwzOTk4MzB8MHwxfHNlYXJjaHwxfHxNZXhpY298ZW58MHx8fHwxNjczOTA4MTcx&ixlib=rb-4.0.3")
    expect(image.alt_tag).to eq('people standing on corner road near concrete buildings during daytime')
    expect(image.country).to eq('Mexico')
  end 
end