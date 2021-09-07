class GuideStatus < ApplicationRecord
  belongs_to :health_interview, optional: true
  belongs_to :staff, optional: true

  validates :status,              presence: true

  enum status: { initial: 0, calling: 1, done: 2, pending: 3, noshow: 4 }

  # 辞書で対応
  # def translate_status
  #   if self.status == "initial"
  #     "未選択"
  #   elsif self.status == "calling"
  #     "呼出中"
  #   elsif  self.status == "done"
  #     "案内済み"
  #   elsif self.status == "pending"
  #     "保留"
  #   elsif self.status == "noshow"
  #     "無断キャンセル"
  #   end
  # end
end
