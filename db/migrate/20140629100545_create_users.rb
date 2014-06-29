class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :request_token
      t.string :request_token_secret
      t.string :access_token
      t.string :access_token_secret
    end
  end
end
