describe "the root page", type: :feature, js: true  do

  it "loads without error" do
    visit root_path
    expect(page).to have_content('Welcome')
  end
end
