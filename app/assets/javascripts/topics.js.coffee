# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#topic_content').autocomplete
    source: $('#topic_content').data('autocomplete-source')

jQuery -> $(".show").click -> 
	$(".hide").show()
	$(".topicdescriptiontext").show()
	$(this).hide()
	
jQuery -> $(".hide").click -> 
	$(".show").show()
	$(this).hide()
	$(".topicdescriptiontext").hide()

jQuery -> $(".shownewdesc").click -> 
	$(".hidenewdesc").show()
	$(".newtopicdescription").show()
	$(this).hide()

jQuery -> $(".hidenewdesc").click -> 
	$(".newtopicdescription").hide()
	location.reload();

jQuery -> $(".showtopiceditform").click -> 
	$(".topiceditformcontainer").show()
	$(".hidetopiceditform").show()
	$(".titletext").hide()
	$(this).hide()
	
jQuery -> $(".canceltopicedit").click ->
	$(".topiceditformcontainer").hide()
	$(".showmaintopicauthor").hide()
	location.reload();
	
jQuery -> $(".showsuggesttopiceditform").click -> 
	$(".topicsuggesteditformcontainer").show()
	$(".hidetopiceditform").show()
	$(".titletext").hide()
	$(this).hide()
	
jQuery -> $(".showdescedit").click -> 
	$(".edittopicdescription").show()
	$(".hide").hide()
	$(".topicdescriptiontext").hide()
	$(this).hide()

jQuery -> $(".canceltopicdescedit").click -> 
	$(".edittopicdescription").hide()
	location.reload();

jQuery -> $(".hidetopiceditform").click -> 
	$(".topicsuggesteditformcontainer").hide()
	$(".showsuggesttopiceditform").show()
	$(".showtopictitle").show()
	$(this).hide()

jQuery -> $(".editprofieldnamecontainer").click -> 
	$(".editprofieldnameform").show()
	$(".canceltopicedit").show()
	$(".topicprofieldname").hide()
	$(this).hide()

jQuery -> $(".editconfieldnamecontainer").click -> 
	$(".editconfieldnameform").show()
	$(".canceltopicedit").show()
	$(".topicconfieldname").hide()
	$(this).hide()
	
jQuery -> $(".showlowrankproargs").click -> 
	$(".lowrankproargs").show()
	$(".hidelowrankproargs").show()
	$(this).hide()
	
jQuery -> $(".hidelowrankproargs").click -> 
	$(".lowrankproargs").hide()
	$(".showlowrankproargs").show()
	$(this).hide()

jQuery -> $(".showlowrankconargs").click -> 
	$(".lowrankconargs").show()
	$(".hidelowrankconargs").show()
	$(this).hide()

jQuery -> $(".hidelowrankconargs").click -> 
	$(".lowrankconargs").hide()
	$(".showlowrankconargs").show()
	$(this).hide()
	
jQuery -> $(".postnewproarg").click -> 
	$(".newproarg").show()
	$(".hidenewproarg").show()
	$(this).hide()
	
jQuery -> $(".hidenewproarg").click -> 
	$(".newproarg").hide()
	$(this).hide()
	location.reload();

jQuery -> $(".postnewconarg").click -> 
	$(".newconarg").show()
	$(".hidenewconarg").show()
	$(this).hide()

jQuery -> $(".hidenewconarg").click -> 
	$(".newconarg").hide()
	$(this).hide()
	location.reload();

jQuery -> $(".postnewprocomment").click -> 
	$(".newprocomment").show()
	$(".hidenewprocomment").show()
	$(this).hide()

jQuery -> $(".hidenewprocomment").click -> 
	$(".newprocommentform").hide()
	$(this).hide()
	location.reload();
	
jQuery -> $(".postnewconcomment").click -> 
	$(".newconcomment").show()
	$(".hidenewconcomment").show()
	$(this).hide()

jQuery -> $(".hidenewconcomment").click -> 
	$(".newconcommentform").hide()
	$(this).hide()
	location.reload();
	
jQuery -> $(".showlowrankprocomments").click -> 
	$(".lowrankprocomments").show()
	$(".hidelowrankprocomments").show()
	$(this).hide()

jQuery -> $(".hidelowrankprocomments").click -> 
	$(".lowrankprocomments").hide()
	$(".showlowrankprocomments").show()
	$(this).hide()
	
jQuery -> $(".showlowrankconcomments").click -> 
	$(".lowrankconcomments").show()
	$(".hidelowrankconcomments").show()
	$(this).hide()

jQuery -> $(".hidelowrankconcomments").click -> 
	$(".lowrankconcomments").hide()
	$(".showlowrankconcomments").show()
	$(this).hide()