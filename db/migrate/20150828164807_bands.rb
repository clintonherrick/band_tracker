class Band < ActiveRecord::Migration
  def change
    create_table(:bands) do |i|
    i.column(:name, :string)

    i.timestamps()
  end

  end
end
