module Helpers
  def init_tags
    tag_names = ['work', 'break', 'holiday', 'disease']
    tag_names.each do |tn|
      create :tag, name: tn
    end
  end
end
