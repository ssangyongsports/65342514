# frozen_string_literal: true

require 'migration/column_dropper'

class DropOldBookmarkColumns < ActiveRecord::Migration[6.1]
  DROPPED_COLUMNS ||= {
    bookmarks: %i{
      topic_id
      reminder_type
    }
  }

  def up
    DROPPED_COLUMNS.each do |table, columns|
      Migration::ColumnDropper.execute_drop(table, columns)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
