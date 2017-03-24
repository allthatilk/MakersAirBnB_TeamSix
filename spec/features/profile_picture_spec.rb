feature "profile pictures" do
  let!(:user) do
    User.create(email: 'test@test.com',
    password: 'password')
  end

  scenario "user can save profile picture on dashboard" do
    assign_profile_picture
    expect(page).to have_xpath("//img[contains(@src, 'https://s-media-cache-ak0.pinimg.com/originals/12/de/a5/12dea53a49fcc68dfc64cfb6f0de9df8.jpg')]")
  end

  scenario "profile picture displays on index" do
    assign_profile_picture
    visit '/'
    expect(page).to have_xpath("//img[contains(@src, 'https://s-media-cache-ak0.pinimg.com/originals/12/de/a5/12dea53a49fcc68dfc64cfb6f0de9df8.jpg')]")
  end
  
end
