class AddImgToCatsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cats, :img, :string
  end
end
