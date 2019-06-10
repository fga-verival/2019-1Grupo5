class CreateFuncaoTransacionals < ActiveRecord::Migration
  def change
    create_table :funcao_transacionals do |t|
      t.string :nameFunc
      t.string :typeFunc
      t.integer :param1
      t.integer :param2
      t.integer :complexity
      t.integer :qntdPF
      t.string :nameCounter
      t.datetime :registry

      t.timestamps null: false
    end
  end
end
