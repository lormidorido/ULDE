<%init>
    use utf8;
</%init>
<div class="row collapse">
	<div class="medium-16 columns">
		<ul class="tabs sp-tabs-h show-for-medium-up" data-tab="" role="tablist">
			<li class="tab-title <% $c->stash->{tab} == 1 && 'active' %>" role="presentational"><a href="#t1" role="tab" tabindex="0" aria-selected="false" controls="t1">Why choose us</a></li>
			<li class="tab-title <% $c->stash->{tab} == 2 && 'active' %>" role="presentational"><a href="#t2" role="tab" tabindex="0" aria-selected="false" controls="t2">How our service works</a></li>
			<li class="tab-title <% $c->stash->{tab} == 3 && 'active' %>" onclick="location.href='/help'" role="presentational"><a href="#" role="tab" tabindex="0" aria-selected="false" controls="t3">Read our <span class="sp-faq">FAQ</span></a></li>			
% #			<li class="tab-title <% $c->stash->{tab} == 3 && 'active' %>" role="presentational"><a href="#t3" role="tab" tabindex="0" aria-selected="false" controls="t3">Read our <span class="sp-faq">FAQ</span></a></li>
		</ul>
		<div class="tabs-content sp-tabs-content-h">
			<div class="content <% $c->stash->{tab} == 1 && 'active' %> no_css" id="t1">
				<div class="sp-slider show-for-medium-up hide-for-xlarge-up">
<!--
					<div><img src="<% $.static_root %>/imgs/slider-first-page/happy-family-02.jpg" alt=""></div>
					<div><img src="<% $.static_root %>/imgs/slider-first-page/happy-family-03.jpg" alt=""></div>
					<div><img src="<% $.static_root %>/imgs/slider-first-page/happy-family-04.jpg" alt=""></div>
-->
					<div><img src="<% $.static_root %>/imgs/slider-first-page/1000x400.1.jpg" alt=""></div>
					<div><img src="<% $.static_root %>/imgs/slider-first-page/1000x400.2.jpg" alt=""></div>
				</div>
				<div class="sp-slider show-for-xlarge-up">
					<div><img src="<% $.static_root %>/imgs/slider-first-page/1416.1.png" alt=""></div>
					<div><img src="<% $.static_root %>/imgs/slider-first-page/1416.2.jpg" alt=""></div>
					<div><img src="<% $.static_root %>/imgs/slider-first-page/1416.3.jpg" alt=""></div>
				</div>
			</div>
			<div class="content <% $c->stash->{tab} == 2 && 'active' %>" id="t2">
				<p>All you need to do to use our service is to select the type of document that you want and to answer our simple list of online questions. There are help and advice notes at every stage to help you through the process. As you answer the questions, you will see the draft document being created there and then on your screen!</p>
				<img class="right" src="<%  $.static_root %>/imgs/shutterstock_302415401.jpg" alt="">
				<p>You can "try before you buy" before you commit to purchasing your document and you can save a draft at any time and come back to it later. So, if you need to look something up before you answer or if you need to discuss your response with someone else (for example, who is going to be the guardian for our children?) you won’t lose the information you have already entered.</p>
				<p>If you need advice on any technical aspect of producing your document, we can provide you with access to an IT expert either by phone or via email.</p>
				<p>Once you have purchased and completed your draft document, it will be available for you to download and we will provide you with appropriate notes on how to turn your final document into a legally binding document.</p>
<!--			
				<p>All you need to do to use our service is to select the type of document that you want and to answer our simple list of online questions. There are help and advice notes at every stage to help you through the process. As you answer the questions, you will see the draft document being created there and then on your screen! Our service is backed by sophisticated software, developed over ten years in consultation with legal experts, so that you are only presented with questions that are relevant to your circumstances.</p>
				<img class="right" src="<%  $.static_root %>/imgs/shutterstock_302415401.jpg" alt="">
				<p>You can “try before you buy” before you commit to purchasing your document and you can save a draft at any time and come back to it later. So, if you need to look something up before you answer or if you need to discuss your response with someone else (for example, who is going to be the guardian for our children?) you won’t lose the information you have already entered.</p>
				<p>If you need advice on any aspect of your document, we can provide you with access to an expert either by phone of via email.</p>
				<p>Once you have purchased and completed your draft document, it will be sent to one of our legal experts for review and they will either confirm that the document is legal or they may come back with suggestions as appropriate.</p>
				<p>When you, and our legal experts, are happy with your document, we will guide you through the process of what to do next. For example; turning your Will into a legally binding document or registering your Power of Attorney with the Court of Protection.</p>
				<p>It’s a simple way to give you and your loved ones peace of mind, so why not start now – just click here and you are on your way.
-->
			</div>
			<div class="content <% $c->stash->{tab} == 3 && 'active' %>" id="t3">
			
			</div>
		</div>
	</div>
</div>
