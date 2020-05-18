#!/usr/bin/env ruby

require 'digest'
require 'pp'

class Block
  attr_reader :index, :timestamp, :data, :previous_hash, :hash

  def initialize(data, previous_block)
    @index = previous_block ? previous_block.index + 1 : 0
    @timestamp = Time.now
    @data = data
    @previous_hash = previous_block ? previous_block.hash : ''
    @hash = Digest::SHA256.hexdigest(block_id.to_s)
  end

  private

  def block_id
    {
      index: index,
      timestamp: timestamp,
      data: data,
      previous_hash: previous_hash
    }
  end
end

b0 = Block.new('Genesis', nil)
b1 = Block.new('First block', b0)
b2 = Block.new('Second block', b1)

# Display: Blockchain
[b0, b1, b2].each { |block| pp block }
