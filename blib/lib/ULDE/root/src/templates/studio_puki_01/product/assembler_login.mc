<%class>
    CLASS->no_wrap;
</%class>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
  </head>
 	<body>
		<form id="<% $c->stash->{form_id} %>" action="<% $c->stash->{login_url} %>" method="post" autocomplete="off">
	    <input id="username" type="hidden" size="0" name="username" value="<% $c->stash->{login_details}->[0] %>" autocomplete="off">
	    <input id="password" type="hidden" size="0" name="password" value="<% $c->stash->{login_details}->[1] %>" autocomplete="off">
	    <input class="button" type="submit" value="Sign in">
		</form>
		<script>
			onload = function() {
			document.getElementById("<% $c->stash->{form_id} %>").submit();
		}
		</script>
	</body>
</html>
