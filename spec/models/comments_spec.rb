RSpec.describe Comment, :type => :model do
  it "creates comment" do
    comment = Comment.create(body: 'test')
    expect(comment.body).to eq('test')
  end
end
