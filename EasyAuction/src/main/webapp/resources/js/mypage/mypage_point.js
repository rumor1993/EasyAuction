function changeRecoin(){
	  var orgin = parseInt($('#eg_orgcoin').val());
	  var recoin = parseInt($('#eg_recoin').val());
      var total = orgin + recoin;
      $( '#total' ).val(total);
}
function fn_editFL(e)
{
	e.preventDefault();
	 var orgin = parseInt($('#eg_orgcoin').val());
	  var recoin = parseInt($('#eg_recoin').val());
	$.ajax(
	{
		url : 'mypage_point_ok.nhn',
		data : {"eg_orgcoin":orgin,"eg_recoin":recoin},
		success : function(xh)
				{	
					window.close();
				},
        complete : function(){
        	opener.document.location.href="mypage_pointlist.nhn"
        }				
});
	
	
	
}