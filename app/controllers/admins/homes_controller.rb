class Admins::HomesController < ApplicationController
	def top
    # 今日の注文件数をカウント
    start_date = Time.current.beginning_of_day
    end_date = Time.current.end_of_day
    @counts = Order.where(created_at: start_date..end_date).count
	end
end
