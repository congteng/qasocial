# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$(".f_progress_chooser a").live "click", ->
		val = $(@).attr("data-val")
		id = $(@).attr("data-id")
		self = @
		$.ajax({
			url: "/functionalities/" + id,
			data: "progress=" + val,
			type: "PUT"
		}).done -> 
			$(self).parent(".f_progress_chooser").parent(".f_foo").children(".progress").children(".bar").attr("style", "width: " + val + "%")
