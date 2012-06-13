# coding: utf-8

module BoardsHelper


	def recursion_board_with_button boards
		raw recurse(boards, "", true, false)
	end

	def recursion_board_without_button boards
		raw recurse(boards, "", false, false)
	end

	def recursion_board_foos_with_bars boards
		raw recurse(boards, "", false, true)

	end

	def foo_color f
		case f.status
		when 0 
			"important"
		when 1
			"info"
		when 2
			"success"
		end
	end

	private 

	def recurse boards, html, with_button, with_bars
		html << "<ul>"
			boards.each do |board|
				html << "<li><span class='label label-warning'>\
				<a href='/boards/#{board.id}'>#{board.name}</a></span>"
				if with_button
					html << "<button class='addf' data-name='#{board.name}' data-id='#{board.id}'>增加功能列表</button>\
					<button class='addb' data-name='#{board.name}'	data-id='#{board.id}'>增加子模块</button>\
					<button class='delb' data-id='#{board.id}'>删除</button>"
				end
				unless board.functionalities.empty?
					html << "<ul>"
						board.functionalities.each do |foo|
							html << "<li><span id='label-#{foo.id}' class='label label-#{foo_color foo}'>\
							<a href='/functionalities/#{foo.id}'>#{foo.say}</a></span>"
							
							html << "<button class='delf' data-id='#{foo.id}'>删除</button></li>" if with_button

							html << "<div class='foo'>
							<div class='progress progress-info progress-striped active'>\
								<div class='bar' style='width: #{foo.progress}%;'></div>\
							</div>\
							<span class='progress_chooser'>\
								<a data-val='0' data-id='#{foo.id}'>0%</a> | \
								<a data-val='20' data-id='#{foo.id}'>20%</a> | \
								<a data-val='40' data-id='#{foo.id}'>40%</a> |\
								<a data-val='60' data-id='#{foo.id}'>60%</a> | \
								<a data-val='80' data-id='#{foo.id}'>80%</a> | \
								<a data-val='100' data-id='#{foo.id}'>100%</a>\ 
							</span>\
						</div>" if with_bars
						end
					html << "</ul>"
				end			
				html <<	"</li>"
				unless board.boards.empty?
					recurse(board.boards, html, with_button, with_bars)
				end
			end

		html << "</ul>"
	end

end
