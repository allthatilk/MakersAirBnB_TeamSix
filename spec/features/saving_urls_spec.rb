feature "saving pictures to database" do
  let!(:user) do
    User.create(email: 'test@test.com',
    password: 'password')
  end
  scenario "can save pictures via url to site" do
    visit '/'
    create_joy_room_listing
    expect(page).to have_xpath("//img[contains(@src, 'http://img.clipartall.com/pokemon-clipart-image-poke-clipart005.jpg')]")
  end
end

#include
#to have content
#to contain
