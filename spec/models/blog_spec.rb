RSpec.describe Blog, :type => :model do
  it "creates blog" do
    comment = Blog.create(body: 'test')
    expect(comment.body).to eq('test')
  end
end
