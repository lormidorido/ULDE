<%class>
    CLASS->no_wrap;
</%class>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	</head>
 	<body>
		<div id="assembler_login" class="<% $c->user_in_realm('reviewer') ? 'reviewer' : 'customer' %>">
			<iframe src="<% $c->uri_for($c->controller('DocumentProduction')->action_for('assembler_login')) %>" frameborder="0"></iframe>
		</div>
		<script type="text/javascript">

			function session() {

				var data = {};

				data.assembler_logon = 1;

				jQuery.ajax({
					type				: "PUT",
					url 				: '/api/rest/session/',
					data 				: '{"assembler_logon":1}',
					contentType : "application/json; charset=utf-8",
					dataType 		: 'json',
					success 		: function(data, status, jqXHR) {
					},
					error: function (jqXHR, status, error) {            
			    }
				});
			}

			$(document).ready(function(){

				var load_counter_login = 0;
				$('#assembler_login iframe').load(function() {
					if (++load_counter_login > 1) {
						session();
					};
				});

			});
		</script>
	</body>
</html>
