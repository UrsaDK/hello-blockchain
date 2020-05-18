#!/usr/bin/env ruby

require 'digest'

module Blockchain
  Block = Struct.new(:data, :timestamp, :previous_hash) do
    def hash
      Digest::SHA256.hexdigest(
        data: data,
        timestamp: timestamp,
        previous_hash: previous_hash
      )
    end
  end

  module_function

  def add_after(block, data)
  end

  def get(hash)
  end
end
