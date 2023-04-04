FactoryBot.define do
  factory :post do
    title { "Post title" }
    description { "Post description" }
    content { "www.youtube.com/watch?v=lf_kiH_NPvM" }
    user { create(:user) }
  end
end
