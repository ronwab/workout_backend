class ChangePhoneNumberType < ActiveRecord::Migration[6.0]
  def up
    change_table :people do |t|
      t.change :phone, :string
    end
  end

  def down
    change_table :people do |t|
      t.change :phone, :integer
    end
  end
end
