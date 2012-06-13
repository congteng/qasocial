module ApplicationHelper

	# 用以管理整个网站的信息
	def site_name
		info = SiteInfo.first
		return info.name if info
		return "Q&A" unless info
	end

end
