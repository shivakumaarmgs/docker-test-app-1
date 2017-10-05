describe "the blog page", type: :feature, js: true  do

  it "can create new blog" do
    visit blogs_path
    click_link 'New Blog'
    fill_in('Title', with: 'New Title')
    fill_in('Body', with: 'This is a long body text')
    click_on('Create Blog')
    expect(page).to have_content('Blog was successfully created')
  end
  
  it "can create new blog 2" do
    visit blogs_path
    click_link 'New Blog'
    fill_in('Title', with: 'New Title 2')
    fill_in('Body', with: 'This is a long body text')
    click_on('Create Blog')
    expect(page).to have_content('Blog was successfully created')
  end

  it "can create new blog 3" do
    visit blogs_path
    click_link 'New Blog'
    fill_in('Title', with: 'New Title 3')
    fill_in('Body', with: 'This is a long body text')
    click_on('Create Blog')
    expect(page).to have_content('Blog was successfully created')
  end

end
