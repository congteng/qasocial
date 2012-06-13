# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$(".addb").live "click", ->
		
		$(".addboard input[name='b_id']").val($(@).attr("data-id"))
		$(".addboard span").text($(@).attr("data-name"))
		$(".addboard").show "slow"

	$('.addf').live "click", ->
		$(".addfoos input[name='b_id']").val($(@).attr("data-id"))
		$(".addfoos span").text($(@).attr("data-name"))
		$(".addfoos").show "slow"

	$('.close').live "click", ->
		$(@).parent("div").hide "slow"

	$('.delb').live "click",  ->
		id = $(@).attr("data-id")
		userid = $(@).attr("data-userid")
		self = @
		if confirm("确认删除模块?")
			$.ajax({
				url: "/users/" + userid + "/boards/" + id,
				type: "DELETE"
			}).done ->

	$('.delf').live "click", ->
		id = $(@).attr("data-id")
		self = @
		if confirm("确认删除功能?")
			$.ajax({
				url: "/functionalities/" + id,
				type: "DELETE"
			}).done -> 

	$(".progress_chooser a").click ->
		val = $(@).attr("data-val")
		id = $(@).attr("data-id")
		self = @
		$.ajax({
			url: "/functionalities/" + id,
			data: "progress=" + val,
			type: "PUT"
		}).done -> 
			$(self).parent(".progress_chooser").parent(".foo").children(".progress").children(".bar").attr("style", "width: " + val + "%")