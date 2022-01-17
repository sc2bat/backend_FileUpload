function loginCheck(){
	if(document.frm.userid.value.length == 0){
		alert("ID none");
		document.frm.userid.focus();
		return false;
	}
	if(document.frm.pwd.value.length == 0){
		alert("Password none");
		document.frm.pwd.focus();
		return false;
	}
	return true;
}

function idChk(){
	if(document.frm.userid.value==""){
		alert("input Id");
		document.frm.userid.focus();
		return;
	}
	var inputid = document.frm.userid.value;
	var opt = "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=200";
	window.open("board.do?cmd=idCheck&userid=" + inputid, "chk", opt);
}

function dupli(userid){
	opener.frm.userid.value = userid;
	opener.frm.reid.value = userid;
	self.close();
}

function joinChk(){
	if(document.frm.userid.value.length == ""){
		alert("join ID none");
		document.frm.userid.focus();
		return false;
	}
	if(document.frm.userid.value.length < 4){
		alert("id < 4");
		document.frm.userid.focus();
		return false;
	}
	if(document.frm.userid.value != document.frm.reid.value){
		alert("Check duplicate");
		document.frm.userid.focus();
		return false;
	}
	if(document.frm.name.value.length ==""){
		alert("join name none");
		document.frm.name.focus();
		return false;
	}
	if(document.frm.pwd.value == ""){
		alert("join pwd none");
		document.frm.pwd.focus();
		return false;
	}
	if(document.frm.pwd.value != document.frm.pwd_chk.value){
		alert("pwd != pwd_chk");
		document.frm.pwd_chk.focus();
		return false;
	}
	return true;
}

function editCheck(){
	if(document.frm.name.value.length == 0){
		alert("edit Name none");
		document.frm.name.focus();
		return false;
	}
	if(document.frm.pwd.value.length == 0){
		alert("edit pwd none");
		document.frm.pwd.focus();
		return false;
	}
	if(document.frm.pwd.value !=document.frm.pwd_chk.value){
		alert("edit pwd != pwd_chk");
		document.frm.pwd_chk.focus();
		return false;
	}
	return true;
}

function boardCheck(){
	if(document.frm.pass.value == ""){
		alert("pass none");
		document.frm.pass.focus();
		return false;
	}
	if(document.frm.title.value == ""){
		alert("Title none");
		document.frm.title.focus();
		return false;
	}
	if(document.frm.content.value == ""){
		alert("content none");
		document.frm.content.focus();
		return false;
	}
	return true;
}

function passChk(){
	if(document.frm.pass.value.length == 0){
		alert("Pass none");
		document.frm.pass.focus();
		return false;
	}
	return true;
}

function open_win(num, name){
	var url = "board.do?cmd=boardPassForm&num=" + num;
	var opt = "toolbar = no, menubar = no, scrollbars=no, resizable=no, width=500, height=300";
	window.open(url, name, opt);
}

function reply_check(){
	if(document.frm_reply.reply.value == ""){
		alert("reply none");
		document.frm_reply.reply.focus();
		return false;
	}
	return true;
}
