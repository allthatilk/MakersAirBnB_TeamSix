feature 'adding a space' do
  scenario 'i can add a space' do
    visit "/"
    create_joy_room_listing
    expect(page).to have_content("The Joy Room")
  end
end
