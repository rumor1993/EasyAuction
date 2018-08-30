<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/custom2.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<style>
		body{
			display:inline-block;
			margin:0 auto;
			margin-left:30px;
			width:350px;
		}
		#messageinput{margin-top:10px;}
		.sendbtn{width:120px;}
		.direct-chat-text{height:20px;}
</style>
</head>
<div class="row bootstrap snippets">
    <div class="col-md-3">
      <!-- DIRECT CHAT PRIMARY -->
      <div class="box box-danger direct-chat direct-chat-danger">
        <div class="box-header with-border">
          <h3 class="box-title">Direct Chat</h3>
    
          <div class="box-tools pull-right">
          	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" onClick="window.close();"><i class="fa fa-times"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <!-- Conversations are loaded here -->
          <div class="direct-chat-messages" id="messageList">
          </div>
          <!--/.direct-chat-messages-->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <input type="hidden" name="sender" id="sender" class="form-control" value="${sessionScope.id}" readonly>
            <div class="input-group">
              <input type="text" name="messageinput" id="messageinput" class="form-control">
                  <span class="input-group-btn">
                    <button type="submit" class="btn btn-danger btn-flat sendbtn" onClick="send();">전송</button>
                  </span>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- /.box-footer-->
      </div>
      <!--/.direct-chat -->
    </div>
</div>
<script src="./resources/js/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		openSocket();
		
		$(".sendbtn").click(function(){
			$("#messageinput").val("");
		})
	})
</script>
	<!-- websocket javascript -->
<script type="text/javascript">
	var ws;
	var messages=document.getElementById("messageList");
	var messageinput = document.getElementById("messageinput").value;
	
	function openSocket(){
		
		if(ws !== undefined && ws.readyState !== WebSocket.CLOSED){
			writeResponse("WebSocket is already opened.");
			return;
		}
		//웹소켓 객체 만드는 코드
		ws = new WebSocket("ws://192.168.60.18:8088/auction/main_echo.nhn");
		
		ws.onopen = function(event){
			if(event.data === undefined){
				return;
			}
			
			writeResponse(event.data);
		}
		
		ws.onmessage = function(event){
			if(messageinput != null || messageinput != ""){
				writeResponse(event.data);
			}
			
		}
		
		ws.onclose = function(event){
			writeResponse("Connection closed");
		}
	}
	
	function send(){
		if(messageinput != "" || messageinput != null){
			var text = document.getElementById("messageinput").value + "," + document.getElementById("sender").value;
			ws.send(text);
			text="";
		}
		
		$('#messageList').scrollTop($('#messageList')[0].scrollHeight);
	}
	
	function closeSocket(){
		ws.close();
	}
	
	function writeResponse(text){
		messages.innerHTML += "<br/>" + text;
	}

</script>
</body>
</html>