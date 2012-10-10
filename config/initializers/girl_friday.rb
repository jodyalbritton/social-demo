TAG_PROCESSOR = GirlFriday::WorkQueue.new(:activity_process, :size => 2) do |msg|
  Tag.process_tags(msg[:activity_id])
end