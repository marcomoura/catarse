# coding: utf-8
require 'sexy_pg_constraints'
class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name, :null => false
      t.string :acronym, :null => false
      t.timestamps
    end
    constrain :states do |t|
      t.name :not_blank => true, :unique => true
      t.acronym :not_blank => true, :unique => true
    end
  end

  def self.down
    drop_table :states
  end
end
