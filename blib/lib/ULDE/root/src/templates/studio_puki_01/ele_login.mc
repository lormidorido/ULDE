<%class>
    CLASS->no_wrap;
</%class>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8" />
	</head>
	<frameset frameborder="0" rows="100%,0%">
		<frame src="/" frameborder="0"></frame>
		<frame src="<% $c->uri_for($c->controller('DocumentProduction')->action_for('assembler_login_frame')) %>" frameborder="0"></frame>
% #		<frame src="<% $c->uri_for($c->controller('DocumentProduction')->action_for('assembler_login')) %>" frameborder="0"></frame>
	</frameset>
</html>