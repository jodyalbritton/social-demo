TAG_PROCESSOR = GirlFriday::WorkQueue.new(:post_process, :size => 2) do |msg|
  Tag.process_tags(msg[:activity_id])
end