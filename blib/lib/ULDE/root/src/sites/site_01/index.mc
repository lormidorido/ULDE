<div class="layout one first_page slider" id="content-layout">

  <div class="panel first_page" id="main-panel">
      <div id="banner-txt">
%	if (1 || $c->req->params->{b} == 1) {
		<h2>Comprehensive Wills from £95</h2>
		<a href="/product/listing">Click here to view available Wills</a>
		
		<h2 style="font-size:22px; margin-top:22px">Which is the right Will for you?</h2>
		<a class="popup selector" title="UKLO Will Selector" href="#will-tree-root">Click here and find out</a>
		
		<& /decision_trees/will_tree_v1.0/will_tree.mi &>
	
		<h2 style="font-size:22px; margin-top:22px">Why do you need a Will?</h2>
		<a class="popup" href="#dialog-why-will" title="Why make a Will?">Click here to find out</a>
% 	} elsif ($c->req->params->{b} == 2) {
		<a style="display:block;margin-top:22px" class="ui-button" href="/product/listing">Comprehensive Wills from £95</a>
		<a style="display:block;margin-top:22px" class="ui-button" id="opener-why-will">Why do you need a Will?</a>
		<a style="display:block;margin-top:22px" class="ui-button" href=#>Which is the right Will for you?</a>		
% 	} else {
		<a href="/product/listing"><h2>Comprehensive Wills from £95</h2></a>		
		<a href=#><h2 style="font-size:22px; margin-top:22px">Which is the right Will for you?</h2></a>
		<a id="opener-why-will" style><h2 style="font-size:22px; margin-top:22px">Why do you need a Will?</h2></a>
%	}
		<div style="display:none;">
			<div id="dialog-why-will">
				<h2>Why do you need a Will?</h2>
				<p>If you don’t have a legal Will, you will not be in control of who receives your assets (money, property, jewellery and so on). They may not go to who you would logically expect. They could even go to the person you least want to have them, such as an ex-spouse, or even the taxman!</p>
				<p>Having a legal Will is the only way to ensure that your instructions and wishes will be carried out in the event of your death.</p>
			</div>
		</div>
  	  </div>
	  
%	if ($c->session->{details}->referrer) {

	  <div id="banner-affiliate-txt">
		<h2>In association with Safe Legal [Wealth Management]</h2>
	  </div>
%	}

	<div class="slider-wrapper theme-bar">
	  <div id="slider_01" class="nivoSlider">
		
		<img src="/static/images/site_01/uklo/happy-family-08.jpg" title="" />
		<img src="/static/images/site_01/uklo/will-01-w.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-07.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-02.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-03.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-04.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-05.jpg" title="" />

	  </div>
    </div>
	<!/div>
	
	<div id="columns">
	  <div class="box-our-service column">
			<h2 class="main">Welcome to uklawonline.com</h2>
			<div class="box-content">
			  <p><b>The <span class="brand-txt">UK Law Online Wills</span> service provides you with an easy way to create a legally compliant Will on your own terms. To put it simply, we provide the best site to make your legal Will online!</b><p/>
			  <div class="sub-header">How the Service Works</div>
			  <div class="video"><a class="youtube popup" href="http://www.youtube.com/v/StKqlxWxi7o?rel=0"><img src="/static/images/site_01/uklo/video-08.png"><div class="title">Click for video demo</div></a></div>
			  <p>You can click on the video icon on the right to view a demonstration on how the service works.</p>
			  <p class="odd">All you need to do to use our service is to select the type of Will that you want and to answer our simple list of online questions. There are help and advice notes at every stage to help you through the process. As you answer the questions, you will see the draft Will being created there and then on your screen! Our service is backed by sophisticated software, developed over ten years in consultation with legal experts, so that you are only presented with questions that are relevant to your circumstances.</p>
			  <p>You can “try before you buy” before you commit to purchasing your Will and you can save a draft at any time and come back to it later.  So, if you need to look something up before you answer or if you need to discuss your response with someone else (for example, who is going to be the guardian for our children?) you won’t lose the information you have already entered.</p>
			  <!img class="left" src="/static/images/site_01/uklo/happy-family-06.jpg">
			  <p class="odd">If you need advice on any aspect of your Will, we can provide you with access to an expert either by phone of via email.</p>
			  <p>Once you have purchased and completed your draft Will, it will be sent to one of our legal experts for review and they will either confirm that the Will is legal or they may come back with suggestions as appropriate.</p>
			  <p class="odd">When you, and our legal experts, are happy with your Will, we will guide you through the process for turning the document into a legally binding Will.</p>
			  <p>It’s a simple way to give you and your loved ones peace of mind, so why not start now – just click here and you are on your way.</p>
			</div>
		</div>
		<div class="box-benefits column last">
%	if ($c->session->{details}->referrer) {
		<h2 class="main promo_box_header">Special promotion</h2>
% 	} else { 
    	<h2 class="main"><q>Bespoke Online Legal Documents for You</q></h2>
%	}


%	if ($c->session->{details}->referrer) {
			<& /right_side_boxes/promo-04.mi &>
			<& /right_side_boxes/promo-01.mi &>
%	}

  			<div class="box-content">
				<ul class="benefits">
					<li class="own-time">
						Complete the Will in your own time</li>
					<li class="easy">
						Easy to use software</li>
					<li class="checked">
						Every Will checked by a legal expert</li>
<!--					<li class="try">
						Try before you buy for free</li>
					<li class="software">
						Expert software</li> -->
					<li class="advice">
						Email or telephone advice available</li>
					<li class="price">
						Competitive pricing</li>
<!--					<li class="appointment">
						No appointments necessary</li> -->
					<li class="save">
						Save a draft and return to it later</li>
					<li class="safe">
						Safe and secure</li>
						
				</ul>

			</div>

%	if (!$c->session->{details}->referrer) {
			<& /right_side_boxes/promo-01.mi &>
%	}    	
    	
		</div>
	</div>

  </div>
</div>

