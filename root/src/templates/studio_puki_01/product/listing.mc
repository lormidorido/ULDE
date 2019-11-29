<%init>
    use utf8;
    use List::Util qw(max first min);
</%init>
<div class="row collapse">
	<div class="medium-16 columns">
		<ul class="tabs sp-tabs-v vertical show-for-medium-up" data-tab="" role="tablist" data-options="scroll_to_content: false">
			<li class="tab-title active" role="presentational"><a href="#t0" role="tab" tabindex="0" aria-selected="false" controls="t0"><% $c->stash->{personal} ? 'Personal' : 'Business' %> Services</a></li>
%			foreach my $category (@{$c->stash->{categories}}) {
				<li class="tab-title" role="presentational"><a href="#t<% $category->id %>" role="tab" tabindex="0" aria-selected="false" controls="t<% $category->id %>" sp-tab-id="<% $category->id %>"><% $category->name %></a></li>
%	 	}
		</ul>
	
		<div class="tabs-content sp-tabs-content-v">
		  <div class="content active" id="t0">
				<h4><span class="product_head"><% $c->stash->{personal} ? 'Personal' : 'Business' %> Services</span> Overview</h4>
%	#			if ($c->stash->{customer_association}) { # keep it hear till I have sorted out how to visulaise it (visir.is)
%	#				<p class="product_sub_head">Any products added will be associated with customer <% $c->stash->{customer_association}->salutation %> (<% $c->stash->{customer_association}->user_name %>) </p>
%	#			}
%				if ($c->stash->{personal}) {
					<p>All you need to do to use our service is to select the type of document that you want and to answer our simple list of online questions. There are help and advice notes at every stage to help you through the process. As you answer the questions, you will see the draft document being created there and then on your screen! Our service is backed by sophisticated software, developed over ten years in consultation with legal experts, so that you are only presented with questions that are relevant to your circumstances.</p>
					<img class="right" src="<%  $.static_root %>/imgs/products/happy-family-07.png" alt="">
					<p>All you need to do to use our service is to select the type of document that you want and to answer our simple list of online questions. There are help and advice notes at every stage to help you through the process. You can “try before you buy” before you commit to purchasing your document and you can save a draft at any time and come back to it later. So, if you need to look something up before you answer or if you need to discuss your response with someone else (for example, who is going to be the guardian for my children if I die?) you won’t lose the information you have already entered.</p>
					<p>If you need advice on any aspect of your document, we can provide you with access to an expert either by phone or our messaging facility.</p>
					<p>Once you have purchased and completed your draft document, if you have chosen to have it reviewed, it will be sent to one of our document reviewers for review and they will either confirm that the document is legal or they may come back with suggestions as appropriate.</p>
					<p>When you, and our document reviewers, are happy with your document, we will guide you through the process of what to do next. For example; turning your Will into a legally binding document or registering your Lasting Power of Attorney with the Court of Protection.</p>
					<p>It’s a simple way to give you and your loved ones peace of mind, so why not start now – just click on a category in the menu and you are on your way.</p>
%				} else {
					<p>Starting a new business and running it efficiently with partners or as a sole trader or Limited Company is not a simple matter nowadays. With hundreds of regulations governing what you can and can’t do in almost all areas of what you do getting things right can be a minefield.</p>
					<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_302876630.jpg" alt="">
					<p>Whether you are dealing with employees, tackling health and safety issues at your premises or simply setting down the rules for how you and others will run your business getting your legal documentation right is now more crucial than ever. </p>
					<p>From start up documents like Shareholders agreements, through sales documents like Terms and Conditions to employee documentation the production of these often relatively standard documents can be an expensive and time consuming process.</p>
					<p>Through UK Law Online’s suite of Business Documents many of these documents can be produced quickly and efficiently and at a fraction of the cost that would be involved in having each one individually drafted by a Solicitor.</p>
					<p>Where matters are more complex and require some bespoke advice or drafting UK Law Online can also assist you with this and will always be there to hold your hand and offer help through the process of producing your documents.</p>
					<p>The documents have been arranged into helpful groups to assist you in navigating your way around and finding the right document for your specific needs. As you answer the questions online you will see your document being created on screen and there is no obligation to buy it until you are happy. You can pause and save your work and return to it later, perhaps because you wanted to find out the answer to a question or simply because you have run out of time to finish it.</p>
					<p>UK Law Online have a panel of experts who can review your completed document and check it meets your needs in accordance with the answers you have given.
					<p>All our documents are kept up to date with current changes in the law and you can rely on them with confidence.</p>
%				}
			</div>

%			foreach my $category (@{$c->stash->{categories}}) {
			  <div class="content" id="t<% $category->id %>">

			  	<div class="sp-slider-<% $category->id %>">

%						# product list			  	
			  		<div>
							<h4><span class="product_head"><% $c->stash->{personal} ? 'Personal' : 'Business' %> Services</span> <% $category->name %></h4>
%							if ($category->id == 574) {
							  <p>A Will is a legal document by which a person names one or more people to manage their estate on their death and which provides for how (and to whom) their property, belongings and money should be distributed and who should become guardian of any under-age children or dependents. It is therefore one of the most important documents you will create in your lifetime. Everyone's personal and financial circumstances differ and your Will therefore needs to be tailored to your requirements. The UK Law Online Wills service provides you with an easy way to create a legally compliant Will.</p>
								<img class="right" src="<%  $.static_root %>/imgs/products/wills-01.jpg" alt="">
							  <p>All you need to do to use our service is to select the type of Will that you want and to answer our simple list of online questions. There are help and advice notes at every stage to help you through the process. As you answer the questions, you will see the draft Will being created there and then on your screen!</p>
							  <p>If you need to look something up before you answer or if you need to discuss your response with someone else (for example, who is going to be the guardian for our children?) simply save what you have done so far and come back to it later, you won’t lose the information you have already entered.</p>
							  <p>If you need advice on any aspect of your Will, we can provide you with access to an expert either by phone or via our messaging facility.</p>
							  <p>Once you have purchased and completed your draft document, if you have chosen to have it reviewed, it will be sent to one of our document reviewers for review and they will either confirm that the document is legal or they may come back with suggestions as appropriate.</p>
							  <p>When you, and our document reviewers, are happy with your document we will guide you through the process for turning the document into a legally binding Will.</p>
							  <p>It’s a simple way to give you and your loved ones peace of mind, so why not start now.</p>
%							} elsif ($category->id == 565) {
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_203249566.jpg" alt="">
								<p>A codicil is a legal document that is designed to amend, rather than to replace a previously executed Will. It can change any part of the Will so, for example, it could be used to change any of the executors or it could change, or completely replace, the list of gifts and/or recipients that you had put in the original Will.</p>
								<p>Codicils must be signed and witnessed in the same way that a full Will must be signed and witnessed (albeit that the witnesses don’t have to be the same people for the two documents).  There is no limit to the number of codicils that you can associate with a Will.</p>
								<p>The main question raised by our clients in relation to codicils is “should I create a Codicil or simply write a new Will”? Well, it’s certainly cheaper to create a Codicil – but bear in mind that it’s probably best that all your Codicils are kept in the same physical place as your Will. We would suggest that if you want to keep your costs down, consider Codicils for small changes and restrict the number of Codicils you create – otherwise consider replacing your current Will with a new Will.</p>
%							} elsif ($category->id == 566) {
								<p>There may be a time when you need to change the way that you own a property to recognize the rights of another person or persons or to ensure any ownership of property passes under a Will. (Tenants in Common)</p>
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_245188459.jpg" alt="">
								<p>Any Property inherited can be redirected for family reasons or whilst considering the effect of any tax or protecting property for future generations.</p>
								<p>Most properties are held as joint tenants and there are many advantages of severing the joint tenancy to tenants in common. This change does not make any difference to the selling or buying of property but enables tax planning opportunities and allows you, the owner, to give your respective share by Will to whoever you choose - for example, to a child from a previous relationship.</p>
								<p>A Declaration of Trust declares the rights in the land or property of, another person where a simple transfer of title may not be appropriate or possible. For Example; a property may have been purchased in a sole name only but the purchasers spouse/partner had contributed monies towards the purchase but were unable to be named on the mortgage and house deeds due to their personal circumstances.</p>
								<p>A Declaration of Trust can also be used for other assets too including personal property and shares especially where the shares are not equall.</p>
								<p>A Deed of variation is a way of redirecting and protecting the way an inheritance is received and distributed by a Last Will and testament after someone has died and this must be done within two years.  They are used mainly for tax advantages and or the protection of assets for future generations and generational inheritance tax and to protect from any family changes during the probate administration or after the inheritance is received.</p>
								<p>All you need to do to use our service is to select the type of document that you want and to answer our simple list of online questions. There are help and advice notes at every stage to help you through the process. You can “try before you buy” before you commit to purchasing your document and you can save a draft at any time and come back to it later.</p>
								<p>If you need advice on any aspect of your document, we can provide you with access to an expert either by phone or via our messaging facility.</p>
								<p>Once you have purchased and completed your draft document, if you have chosen to have it reviewed, it will be sent to one of our document reviewers for review and they will either confirm that the document is legal or they may come back with suggestions as appropriate.</p>
								<p>When you, and our document reviewers, are happy with your document, we will guide you through the process of what to do next.</p>
%							} elsif ($category->id == 575) {
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_247939999.jpg" alt="">
								<p>A Living Will, also known as an Advance Health Care Directive, is a legal document that sets out your wishes regarding your health care and how you want to be treated if you become seriously ill and are unable to make or communicate your own choices.</p>
								<p>Your wishes can, for example, be either that certain treatments should not be provided in specified circumstances (and these wishes can be binding on medical staff) or that you should be treated or cared for in a particular way (these wishes are not binding on medical staff but should be taken into account by them).</p>
								<p>It is probably worth comparing the Living Will with the Lasting Power of Attorney (Health and Welfare).  They both, in essence, deal with the same issue of your care and treatment in a situation where you are unable to make your views known to your carers.  With the Power of Attorney, you are giving authority to a “trusted person” to make decisions on your behalf.  With a Living Will, you are making an advance statement of your wishes in respect of your treatment.</p>
%							} elsif ($category->id == 572) {
								<p>A Lasting Power of Attorney is a Legal Document in which you nominate a trusted person, (or several people) to be authorised to make decisions on your behalf – in certain specific circumstances.</p>
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_103986302.jpg" alt="">
								<p>There are two types of Lasting Power of Attorney:</p>
								<ul>
									<li><p>Lasting Power of Attorney (Property and Financial Affairs) which is designed to give your trusted person(s) control of your financial affairs (e.g. bank accounts, stocks and shares, property, benefits and so on). This document can either be set up to take effect only in a situation where you are unable to make decisions for yourself (e.g. a medical practitioner diagnoses that you have lost your mental capacity) or it can be set up to take effect immediately – where, for example, you are competent to make decisions but where you would prefer your trusted person(s) to be doing this on your behalf.</p></li>
									<li><p>Lasting Power of Attorney (Health and Welfare) which is designed to give your trusted person(s) authority to speak for you in relation to medical treatment and care decisions. This document can only be set up to take effect in a situation where you are unable to make decisions for yourself. (e.g. a medical practitioner diagnoses that you have lost your mental capacity)   It can be customised to define which decisions you want your trusted person(s) to make on your behalf, and which decisions you want to leave in the hands of medical professionals.</p></li>
								</ul>
								<p>If you need advice on any aspect of your document, we can provide you with access to an expert either by phone or via our messaging facility.</p>
								<p>Once you have purchased and completed your draft document, if you have chosen to have it reviewed, it will be sent to one of our document reviewers for review and they will either confirm that the document is legal or they may come back with suggestions as appropriate.</p>
								<p>When you, and our document reviewers, are happy with your document, we will guide you through the process of what to do next. For example; registering your Power of Attorney with the Office of the Public Guardian.</p>
%							} elsif ($category->id == 573) {
								<p>Probate is the process that is gone through once a person has died to administer the estate of the deceased person, resolving claims and dealing with creditors (people or organisations that are owed money by the deceased person) and ultimately distributing the deceased person’s property under the terms of their Will.</p>
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_302508068.jpg" alt="">
								<p>Probate is usually undertaken either by the Executor(s) named in the person’s Will or by an expert working on their behalf. The process starts by bringing together all the financial information about the deceased; both their assets and their debts. Once all this information is in place, the appropriate legal document is completed and an application is made to the probate court for a Grant of Probate.  Once the grant is made, the Executors can distribute what is left of the deceased’s estate (after debts are paid) under the terms of their Will.</p>
								<p>The documents included on this website are designed to provide the non-professional with the documents that are needed to gain a Grant of Probate; with the key document being “PA1 Probate Application Form”.</p>
								<p>Gaining a Grant of Probate can be a complex affair, depending on the complexity of the deceased’s estate. We can, as an alternative, provide you with a full Probate service undertaking on your behalf by our team of experts. If you are interested in this service, please contact us</p>
%							} elsif ($category->id == 564) {
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_302834348.jpg" alt="">
								<p>In this section you will find many of the documents you will need to start your business. Shareholders agreements are important to regulate the relationship between the Shareholders of a Limited Company and to set out how meetings, voting and the distribution of funds will be dealt with. They can also be used to protect the rights of the smaller (minority) shareholders and shareholders who are investors but may not be involved in the day to day running of the company.</p>
								<p>Partnership Agreements carry out much the same function for individuals who want to trade in partnership rather than through a Limited Company and there is also the Limited Liability Partnership being a hybrid of the two and an increasingly popular form of trading.</p>
								<p>It will always be important to get the advice of your accountants when starting up a new business or changing or taking over an existing one but much of the legal documentation required can be simply and cost efficiently produced via UK Law Online.</p>
%							} elsif ($category->id == 580) {
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_274643642.jpg" alt="">
								<p>Employing staff is no longer a simple matter of interview and employment. The Rules and regulations governing the employment of staff and the ongoing protection of their rights has become highly complex and fraught with potential dangers for employers who are careless about these issues.</p>
								<p>Getting you forms, documents, procedures and contracts set up correctly from the very beginning is the best way to protect yourselves as employers and ensure that you do not run into difficulties.</p>
								<p>UK Law Online have a section dedicated to this process with self explanatory documents, forms and contracts that will make your life much easier and without the time and expense of having to instruct others to do all this for you.</p> 
%							} elsif ($category->id == 581) {
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_302622449.jpg" alt="">
								<p>UK Law Online are pleased to provide a suite of documents to assist businesses in setting up and running their sales and marketing operations.</p>
								<p>Whether it is drafting a set of Terms and Conditions for your services or for the sale of your products or appointing agents to sell on your behalf with a commission agreement all of this is made much easier by accessing these documents online.</p>
								<p>In addition to the obvious documents such as purchase orders etc we have also included some documents to assist with e-commerce and the use of images for marketing.</p>
%							} elsif ($category->id == 582) {
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_244882996.jpg" alt="">
								<p>You’ve now employed some staff and managing those staff in accordance with employment legislation etc is all important. Simple day to day issues relating to sickness, paternity/maternity leave, appraisals and staff accommodation are all covered by our suite of documents for managing staff.</p>
								<p>It all starts with getting your employee handbook right and you can do this simply and easily by getting online and using our service to create this document. It will become the employee bible and is there for your protection as much as theirs.</p>
								<p>Drafting job descriptions, references and a host of other letters and documents is made a simple task by accessing UK Law Online’s documents covering this issues.</p>
								<p>All of these documents will give you the opportunity to tailor them to your own specific needs and requirements and you will be able to rest assured that they comply with employee legislation by which you are bound as an employer.</p>
%							} elsif ($category->id == 583) {
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_303498473.jpg" alt="">
								<p>One of the most frustrating things in running a business is the accumulation of bad debts that can arise from customers or clients who have failed to pay you.</p>
								<p>Collecting these debts can often be a simple process carried out by your own staff rather than incurring the costs of professional debt collectors.</p>
								<p>Often the forms and procedures are very simple, particularly if the debt is not disputed and businesses can save a lot of money by effective management and collection of their debts.</p>
								<p>All to often the cost of using external debt collectors or solicitors can put businesses off from collecting debs, particularly smaller ones, but processing these debts for collection in house can lead to effective recoveries at a relatively low cost. Cash flow is king to most businesses and bad debts are the enemy of cash flow. Use UK Law Online’s debt collection and management documents to minimize this problem.</p>
%							} elsif ($category->id == 584) {
								<img class="right" src="<%  $.static_root %>/imgs/products/shutterstock_274284644.jpg" alt="">
								<p>The final section of documents on employees continues the theme of using accurate and legally compliant letters and documents when dealing with employee grievances or disciplinary matters including dismissal.</p>
								<p>This is an area that can potentially lead to claims and proceedings if procedures are not properly followed and UK Law Online have provided a suite of documents and templates to deal with such matters.</p>
								<p>As with other documents in the business section, creating them is relatively simple and often simply a matter of inserting the relevant information and facts.</p>
								<p>As with all documents created with UK Law Online expert help is on hand if requested both in terms of reviewing documents and offering further bespoke advice.</p>
%							}
%							my $no_sub_category = [grep { $_->category->id == $category->id && !$_->sub_category } @{$c->stash->{products}}];
%							foreach my $sub_category ($no_sub_category, do { my %seen; map { $_->sub_category } sort { $a->sub_category->name cmp $b->sub_category->name } grep { $_->category->id == $category->id && $_->sub_category && !$seen{$_->sub_category->id}++ } @{$c->stash->{products}} }) {	
%								next unless ref $sub_category ne 'ARRAY' || @{$sub_category};
						  	<ul class="medium-block-grid-1 sub-category">
						  		<li>
						  			<h5><span class="product_head"><% $category->name %></span> <% ${ref $sub_category ne 'ARRAY' ? \($sub_category->name) : \''} %></h5>

							  		<ul class="medium-block-grid-1 xlarge-block-grid-2">
%											foreach my $product (sort { $a->name cmp $b->name } @${ref $sub_category eq 'ARRAY' ? \$sub_category : \[grep { $_->category->id == $category->id && $_->sub_category && $_->sub_category->id == $sub_category->id } @{$c->stash->{products}}]}) {
							  				<li class="product-item">
							  					<div class="row">
							  						<div class="medium-13 xlarge-12 columns">
							  							<h6><% $product->name %></h6>
							  							<p class="ellipsis-multiline"><% $product->description %></p>
							  						</div>
							  						<div class="medium-3 xlarge-4 columns">
							  							<ul class="medium-block-grid-1 options">
							  								<li>
%																	my @service_level = grep { $c->user_in_realm('reviewer') && $_->corporate_client_applicable || (!$c->user || $c->user_in_realm('customer')) && $_->customer_applicable } @{$product->service_level};
							  									<div class="price"><% scalar @service_level > 1 ? 'From' : 'Price' %>: £<% min map { (my $price = $_->price) =~ s/^.//; $price } @service_level %></div>
							  								</li>
%																if (!$c->user_in_realm('reviewer')) {
							  								<li>
							  									<div class="try" data-tooltip aria-haspopup="true" title="Try before you buy"><a <% $c->user_exists ? 'href' : 'assembler_src' %>="<% $c->uri_for($c->controller('DocumentProduction')->action_for('assembler'),[$product->id, (first { $_->is_primary } @{$product->template})->id, 0]) %>" class="button expand">Try before you buy</a></div>
							  								</li>
%																}
							  								<li>	
							  									<div class="add-basket" product_id="<% $product->id %>" data-tooltip aria-haspopup="true" title="<% $c->user_in_realm('reviewer') && $c->stash->{customer_association} ? 'Add product to customer account (' . $c->stash->{customer_association}->salutation . ')' : $c->user_in_realm('reviewer') ? 'No customer currently selected' : 'Add product to basket' %>"><a class="button expand"><% $c->user_in_realm('reviewer') ? 'Add to customer' : 'Add to basket' %></a></div>
							  								</li>
							  								<li>	
							  									<div class="more-info" data-tooltip aria-haspopup="true" title="Click for more info"><a sp-product-id="<% $product->id %>" sp-tab-id="<% $category->id %>" class="button expand sp-more-info">More info</a></div>
							  								</li>
							  							</ul>
							  						</div>
							  					</div>
							  				</li>
%									  	}
						  			</ul>
						  		</li>
						  	</ul>
%							}
						</div>

%						# product page
						<div>
%							foreach my $product (grep { $_->category->id == $category->id } @{$c->stash->{products}}) {
								<div sp-product-info="<% $product->id %>" class="hide">
									<h4><% $product->name %></h4>
									<p><% $product->description %></p>
							  	<ul class="medium-block-grid-1 service-levels">
							  		<li>
							  			<h5><span class="product_head">Available service levels</span></h5>
								  		<ul class="medium-block-grid-1 xlarge-block-grid-2">
%												foreach my $service_level (grep { $c->user_in_realm('reviewer') && $_->corporate_client_applicable || (!$c->user || $c->user_in_realm('customer')) && $_->customer_applicable } @{$product->service_level}) {
								  				<li class="service-level-item">
								  					<div class="row">
								  						<div class="medium-13 xlarge-12 columns">
								  							<h6><% $service_level->name %></h6>
								  							<p><%  $c->user_in_realm('reviewer') ? $service_level->corporate_client_description : $service_level->description %></p>
								  						</div>
								  						<div class="medium-3 xlarge-4 columns">
								  							<ul class="medium-block-grid-1 options">
								  								<li>
								  									<div class="price">Price: <% $service_level->price %></div>
								  								</li>
%																	if (!$c->user_in_realm('reviewer')) {
								  								<li>
								  									<div class="try" data-tooltip aria-haspopup="true" title="Try before you buy"><a <% $c->user_exists ? 'href' : 'assembler_src' %>="<% $c->uri_for($c->controller('DocumentProduction')->action_for('assembler'),[$product->id, (first { $_->is_primary } @{$product->template})->id, 0]) %>" class="button expand">Try before you buy</a></div>
								  								</li>
%																	}
								  								<li>	
								  									<div class="add-basket" service_level="<% $service_level->id %>" product_id="<% $product->id %>" data-tooltip aria-haspopup="true" title="<% $c->user_in_realm('reviewer') && $c->stash->{customer_association} ? 'Add product to customer account (' . $c->stash->{customer_association}->salutation . ')' : $c->user_in_realm('reviewer') ? 'No customer currently selected' : 'Add product to basket' %>"><a class="button expand"><% $c->user_in_realm('reviewer') ? 'Add to customer' : 'Add to basket' %></a></div>
								  								</li>
								  							</ul>
								  						</div>
								  					</div>
								  				</li>
%												}
											</ul>
										</li>
									</ul>
								</div>
%							}
						</div>
					</div>
			  </div>
%			}
		</div>
	</div>
</div> 