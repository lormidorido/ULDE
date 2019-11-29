<%init>
    use utf8;
</%init>
<div class="row collapse">
	<div class="medium-16 columns">
		<div class="sp-one-column" id="assembler">
			<div class="header row collapse">
				<div class="medium-10 xlarge-10 columns">
					<h5><% $c->stash->{heading} %></h5>
					<p><% $c->stash->{sub_heading} %></p>
				</div>
				<div class="medium-6 xlarge-6 columns">
					<ul class="inline-list controls right">
%						my $i = 0;
%						foreach my $btn (grep { $_->{create} } @{$c->stash->{buttons}}) {
							<li class="<% ++$i > 2 && 'show-for-xlarge-up' %>"><a href="<% $btn->{href} %>" class="button tiny" <% join ' ', map { $_ . '="' . $btn->{attributes}->{$_} . '"' } keys %{$btn->{attributes}} %>><% $btn->{name} %></a></li>
%						}
					</ul>
				</div>
			</div>
			<div id="outer">
				<div id="inner">
					<iframe id="engine" frameborder="0" scrolling="no" <% $c->stash->{awaiting_logon} ? 'assembler_' : '' %>src="<% $c->stash->{assembler_src} %>" redirect_url="<% $c->stash->{redirect_url} %>" seamless onload="$(this).css('visibility','visible')"></iframe>
				</div>
			</div>
%	#		if ($c->stash->{login_required}) {
%	#			<div id="assembler_login" class="<% $c->user_in_realm('reviewer') ? 'reviewer' : 'customer' %>">
%	#					<iframe src="<% $c->uri_for($c->controller('DocumentProduction')->action_for('assembler_login')) %>" frameborder="0"></iframe>
%	#				</div>
%	#		}
		</div>
	</div>
</div>