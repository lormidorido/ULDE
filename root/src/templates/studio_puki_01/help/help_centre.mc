<%init>
    use utf8;
</%init>
<div class="row collapse">
	<div class="medium-16 columns">
			<ul class="tabs sp-tabs-v vertical show-for-medium-up" data-tab="" role="tablist">
				<li class="tab-title <% $c->stash->{tab} == 1 && 'active' %>" role="presentational"><a role="tab" tabindex="0" aria-selected="false" controls="t1" style="cursor: default;">Help Centre</a></li>
				<li class="tab-title <% $c->stash->{tab} == 2 && 'active' %>" role="presentational"><a href="#t2" role="tab" tabindex="0" aria-selected="false" controls="t2">FAQ</a></li>
				<li class="tab-title <% $c->stash->{tab} == 3 && 'active' %>" role="presentational"><a href="#t3" role="tab" tabindex="0" aria-selected="false" controls="t3">User advice</a></li>
				<li class="tab-title <% $c->stash->{tab} == 4 && 'active' %>" role="presentational"><a href="#t4" role="tab" tabindex="0" aria-selected="false" controls="t4">Using our service</a></li>
<!--
				<li class="tab-title <% $c->stash->{tab} == 5 && 'active' %>" role="presentational"><a href="#t5" role="tab" tabindex="0" aria-selected="false" controls="t5">Account recovery</a></li>
-->
			</ul>

			<div class="tabs-content sp-tabs-content-v">
			  <div class="content <% $c->stash->{tab} == 1 && 'active' %>" id="t1">
			  	<h4><span class="help_centre_head">Help Centre</span></h4>
			  </div>
			  <div class="content <% $c->stash->{tab} == 2 && 'active' %>" id="t2">
			  	<ul class="inline-list controls right">
			  		<li>
			  			<a class=" button tiny">Available FAQ lists</a>
% #			  			<a class="left-off-canvas-toggle button tiny">Available FAQ lists</a>
			    	</li>
			    </ul>
			    <h4><span class="help_centre_head">Help Centre</span> FAQ</h4>

				<div class="off-canvas-wrap" data-offcanvas>
				  <div class="inner-wrap">


				    <aside class="left-off-canvas-menu">
				      <ul class="off-canvas-list">
				        <li><label>Legal area</label></li>
				        <li><a href="#">Wills</a></li>
				        <li><label>The UKLO service</label></li>
				        <li><a href="#">The legal review process</a></li>
				        <li><a href="#">Using the service</a></li>
				        <li><a href="#">General information</a></li>
				        <li><a href="#">Payments and refunds</a></li>
				      </ul>
				    </aside>

				    <section class="main-section">
				      <div class="row collapse">
				        <div class="large-16 columns">
				          <h5>Legal area: Wills</h5>
<!--				          <h5><span class="help_centre_head">FAQ list:</span> Legal area: Wills</h5> -->
				          <ul class="medium-block-grid-1 xlarge-block-grid-2 faq-block-grid">
				          	<li>
											<dl class="accordion" data-accordion="faq_accordion">
											  <dd class="accordion-navigation">
											    <a href="#pw1">What I should put in my Will?</a>
											    <div id="pw1" class="content">
											    	<p>Your Will lets people know what you would like to happen to your assets (property, money and so on) and your dependents (children) when you die:</p>
														<ul>
															<li><p>who do you want to receive your assets?</p></li>
															<li><p>who should look after any children under 18?</p></li>
															<li><p>who is going to sort out your estate after your death?</p></li>
														</ul>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw2">Which Will is Right for Me?</a>
											    <div id="pw2" class="content">
													<p>We have a range of Wills available for you to use on this website.</p>
													<p>Each Will has been designed to suit particular needs.</p>
													<p>To see which Will is right for you, click here to use our Will Selector, which comprises a simple and short set of questions which will guide you to the most appropriate Will style for you.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw3">What if I die without a Will?</a>
											    <div id="pw3" class="content">
													<p>If you die without a Will, you will have died "Intestate" and so the rules of intestacy will apply.  In essence, the State will decide who acts as executor for your estate and it will also decide what will be done with your estate.</p>
													<p>This can have some unexpected, and potentially unwelcome, results. For example,</p>
													<ul>
														<li><p>Your unmarried partner will not inherit anything.</p></li>
														<li><p>Even if you are married, your spouse may not inherit everything.</p></li>
														<li><p>If you have young children, the State will decide who will look after them and manage their financial affairs.</p></li>
														<li><p>Nothing will be left to your step children, friends, favourite charities and so on.</p></li>
														<li><p>The costs of administering your estate will be more (and so your residual estate will be less) than if you had a Will.</p></li>
													</ul>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw4">Can anyone see my Will?</a>
											    <div id="pw4" class="content">
													<p>Your Will remains private until you die (although you can, of course, communicate its contents to anyone you want to) after which it becomes public.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw5">Do I Need Legal Advice?</a>
											    <div id="pw5" class="content">
													<p>If your Will is relatively straightforward and you know what you want to achieve with it, you should not need legal advice. Examples of where legal advice might be advisable include</p>
													<ul>
														<li><p>where you share a property that you own with someone who isn't your husband, wife or civil partner</p></li>
														<li><p>you want to leave money or property to a dependent who can't care for themselves</p></li>
														<li><p>you have several family members who may make a claim on your will, for example a second spouse or children from another marriage</p></li>
														<li><p>your permanent home isnât in the UK</p></li>
														<li><p>your permanent home is the UK but you have overseas property</p></li>
														<li><p>you have a business</p></li>
													</ul>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw6">What is an Executor?</a>
											    <div id="pw6" class="content">
													<p>An Executor is someone that you name in your Will and who takes on the responsibility for carrying out the wishes contained in your Will. They will deal with the paperwork; collecting together all the assets of your estate, paying all the debts, taxes, funeral and administration costs out of money in the estate. They will also pay out the gifts and transfer any property to beneficiaries.</p>
													<p>You can appoint between one and four executors.  It is advisable to appoint more than one (in case one of them dies) and it is most usual to appoint two.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw7">Who should I choose as an Executor?</a>
											    <div id="pw7" class="content">
													<p>You should choose people who are willing to take on the responsibility and who you trust to do a good job The people most commonly appointed as executors are:</p>
													<ul>
														<li><p>relatives or friends</p></li>
														<li><p>solicitors or accountants</p></li>
														<li><p>banks</li>
														<li><p>in England and Wales, the Public Trustee or in some cases the Official Solicitor if there is no one else willing and able to act.</p></li>
													</ul>
													<p>Typically, people tend to choose one relative/friend (who is generally not paid for this role) and one professional (who will normally charge for their services).</p>
													<p>You should always approach anyone you are thinking of appointing as an executor to confirm that they are willing to take on the role. It is worth bearing in mind that an appointed executor has the right to refuse to perform the role.</p>
													<p>If an executor dies (or no long wishes to act) you may wish to appoint a new one albeit that any other surviving executor(s) can deal with the estate.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw8">How do I make sure my Will is legal?</a>
											    <div id="pw8" class="content">
													<p>For a Will to be legally valid, it must be:</p>
													<ul>
														<li><p>made by a person 18 or over</p></li>
														<li><p>made voluntarily</p></li>
														<li><p>made by a person of sound mind</p></li>
														<li><p>in writing</p></li>
														<li><p>signed by the person making the Will in the presence of 2 witnesses</p></li>
														<li><p>signed by the 2 witnesses, in the presence of the person making the Will</p></li>
													</ul>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw9">What is an Executed Will?</a>
											    <div id="pw9" class="content">
													<p>Your Will is an Executed Will once you have signed it and your signature has been witnessed by two independent witnesses.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw10">What should I do with my Executed Will</a>
											    <div id="pw10" class="content">
													<p>Keep your Will safe.  It is the original signed Will that is the valid Will.  Photocopies or scans are not valid.</p>
													<p>There is no requirement for your Will to be lodged at any particular place or with any particular person.  However, your Will is only useful if it can be found when needed! You should tell your executor (the person that you have chosen to carry out your will) or a close friend or relative where it is.</p>
													<p>You could choose to store your will:</p>
													<ul>
														<li><p>with other important documents (like your birth certificate) at home</p></li>
														<li><p>with your solicitor</p></li>
														<li><p>with your bank</p></li>
														<li><p>with the Principal Registry of the Family Division</p></li>
													</u>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw11">How do I Sign my Will?</a>
											    <div id="pw11" class="content">
													<p>Your Will becomes effective once you have signed it and your signature has been witnessed by two witnesses.</p>
													<p>To sign the Will, you and your witnesses must be present in the same room and no-one may leave the room before the signing is complete.</p>
													<p>You sign first, in the presence of your witnesses</p>
													<p>Then each witness signs with his/her usual signature, followed by his/her printed name, address and occupation.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw12">Who can Witness my Will?</a>
											    <div id="pw12" class="content">
													<p>For your Will to be valid, two independent witnesses must sign that they witnessed you signing your Will.</p>
													<p>The witnesses are not required to read the Will; all they are doing is witnessing your signature.  There are several rules that need to be followed to make your Will valid:</p>
													<p>Your witnesses must be:</p>
													<ul>
														<li><p>at least eighteen years old</p></li>
														<li><p>capable of understanding what they are doing</p></li>
														<li><p>traceable (that is, they should be relatively easily findable in the event of your death)</p></li>
													</ul>
													<p>Your witnesses must <strong>not</strong> be</p>
													<ul>
														<li><p>beneficiaries (that is, they may not be left anything in the Will)</p></li>
														<li><p>married to, or in a civil partnership with, a beneficiary</p></li>
														<li><p>blind</p></li>
													</ul>
											    </div>
											  </dd>
											</dl>
										</li>
										<li>
											<dl class="accordion" data-accordion="faq_accordion">
											  <dd class="accordion-navigation">
											    <a href="#pw13">When should I review my Will?</a>
											    <div id="pw13" class="content">
													<p>It is recommended that you should review your Will every 5 years and after any major change in your life, for example:</p>
													<ul>
														<li><p>getting married, separated, married or divorced</p></li>
														<li><p>having a child</p></li>
														<li><p>purchasing or selling property</p></li>
														<li><p>if the executor named in the Will dies</p></li>
													</ul>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw14">Does getting Married Invalidate my Current Will?</a>
											    <div id="pw14" class="content">
													<p>Most Wills will automatically be revoked (invalidated) upon marriage. There is one exception to this: it can remain legally valid if it expressly stipulates that it is 'written in contemplation' of that marriage.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw15">Can I make changes to my Will?</a>
											    <div id="pw15" class="content">
													<p>No. You can't amend the document that is your Will after it's been signed and witnessed.</p>
													<p>If you wish to make minor amendments to what is in your Will, you can effectively make changes to it by making an official alteration called a codicil.</p>
													<p>If you wish to make major changes to your Will, it is recommended that you draw up a New Will.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw16">What is a Codicil?</a>
											    <div id="pw16" class="content">
													<p>A Codicil is a document that modifies, deletes, qualifies, or revokes provisions contained in a previously executed Will.</p>
													<p>Codicils are designed to enable small changes to be made to your wishes without the need to create a totally new Will; for example, you may wish to change one of your Executors or the gift that you leave to a friend.</p>
													<p>You must sign a codicil and get it witnessed in the same way as witnessing a Will and it should ideally be kept together with your Will.</p>
													<p >Thereâs no limit to how many codicils you can add to a Will.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw17">When should I make a New Will?</a>
											    <div id="pw17" class="content">
													<p>For major changes you should make a new Will.</p>
													<p>Your new Will should explain that it revokes (officially cancels) all previous Wills and codicils.</p>
													<p>You should destroy your old Will by burning it or tearing it up.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw18">What is a Living Will?</a>
											    <div id="pw18" class="content">
													<p>A Living Will is a document that sets out your wishes regarding health care and how you want to be treated if you become seriously ill and unable to make or communicate your own choices.</p>
													<p>Your wishes can, for example, be either that certain treatment should not be provided in specified circumstances (and these wishes can be binding on medical staff), or that you should be treated or cared for in a particular way (these wishes are not binding on medical staff but should be taken into account).</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw19">What is a Letter of Wishes?</a>
											    <div id="pw19" class="content">
													<p>A letter of wishes is an informal letter addressed to your executors which expresses what you would like to happen following your death.</p>
													<p>Unlike your Will, the letter of wishes does not become a publicly available document on death. It can be used to assist or guide your executors on pretty much anything you wish. It does not interfere with or restrict the discretion of the executors in any way.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw20">What are STEP Provisions?</a>
											    <div id="pw20" class="content">
													<p>Some of the Wills available on our website contain "STEP" provisions which are a set of standard clauses developed by The Society of Trust and Estate Practitioners ("STEP"); a society for specialists in trusts, probate and wills. The STEP Standard Provisions describe the executors' powers and responsibilities during the probate process and their powers (as trustees) in the event that trusts need to be set up.</p>
													<p >As such they are a standard way of providing the executors with technical and routine provisions they need to administer the estate properly. For example, this authorises professional executors or trustees to charge for their work.</p>
													<p>Using these standard provisions the Will writer can ease the work of the executors when they administer your estate, without having to clutter up your Will with lots of technical provisions that might otherwise confuse the lay reader.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw21">What is a Discretionary Trust Will?</a>
											    <div id="pw21" class="content">
													<p>Some of the Wills available on our website are designed for people that wish, in addition to the normal information about gifts, bequests and dependents, also to create a discretionary trust. A Discretionary Trust is a trust under which no individual has a right to an interest in possession. Generally, the trustees have the power to decide who should receive the capital or income from the trust. Discretionary trusts are also relevant property trusts.</p>
													<p>Examples of when such a trust might be appropriate are:</p>
													<ul>
														<li><p>To try and avoid a local authority using a share in the home to cover the cost of long term medical or nursing care for the surviving spouse/civil partner, or</p></li>
														<li><p>To ensure that gifts intended for children/grandchildren from a former relationship are received by them, without the danger of the surviving spouse/civil partner reducing the amount that goes to them.</p></li>
													</ul>
													<p>Please note that in order to use one of our Discretionary Trust Wills, your marital home must be worth more than £50,000 after either deduction of any mortgage or after your mortgage is repaid on death by a policy of insurance.</p>
													<p>It is recommended that you use one of our advice services (<a class="phone_advice_link">phone advice</a> or <a class="email_advice_link">email advice</a>) before creating your own Discretionary Trust Will.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw22">What is a Civil Partnership?</a>
											    <div id="pw22" class="content">
													<p>A civil partnership is a relationship between two people of the same sex ("civil partners") which is formed when they register as civil partners of each other. It is the same-sex equivalent of marriage under the Civil Partnership Act 2004 and under this legislation the civil partners have equivalent legal rights to spouses.</p>
													<p>Also note the Marriage (Same Sex Couples) Act 2013. This Act is not yet in full effect. Once it is fully in place, it will grant those registered in a civil partnership in England or Wales the ability to convert their partnership into a marriage, with all of the equal rights and responsibilities of civil marriage. Our Wills do not currently deal with Same Sex Marriages but we will, of course, offer the appropriate documents once the Act comes in to force.</p>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw23">Can my Will be Challenged?</a>
											    <div id="pw23" class="content">
													<p>A Will can be challenged but only in limited circumstances. Those are:</p>
													<ul>
														<li><p>If your Will is deemed not to be valid.</p></li>
														<li><p>If someone considers that they have not been adequately provided for and where they have a right to that expectation.</p></li>
													</ul>
											    </div>
											  </dd>
											  <dd class="accordion-navigation">
											    <a href="#pw24">Can I get Access to more Detailed Information?</a>
											    <div id="pw24" class="content">
													<p>Yes, this list of Frequently Asked Questions is designed to help you gain an initial understanding of what is entailed in writing a Will and some of the things that you should be considering. Once you start writing one of the Wills available on the UK Law Online website, you will have access to much more detailed notes about the particular Will that you are writing. You will be able to toggle, on the right hand of your screen, between the document that you are creating and a set of comprehensive explanatory notes by clicking between the âdocumentâ and ânotesâ tabs â as shown in the image.</p>
													<img src="/static/templates/studio_puki_01/imgs/help_centre/faq_further_help.png" style="width:100%; border-width:1px; border-style:solid; border-color: #dddddd; margin:0 0 0.625rem 0;">
													<p>If you still can't find the information that you need, it is recommended that you use one of our advice services (<a class="phone_advice_link">phone advice</a> or <a class="email_advice_link">email advice</a>).</p>
											    </div>
											  </dd>
											</dl>
										</li>
									</ul>
				        </div>
				      </div>
				    </section>

				  <a class="exit-off-canvas"></a>

				  </div>
				</div>
			  </div>
			  <div class="content <% $c->stash->{tab} == 3 && 'active' %>" id="t3">
			    <h4><span class="help_centre_head">Help Centre</span> User advice available</h4>
			    <p>UK Law Online does not provide legal advice on the drafting of documents.</p>
			    <p>However, if you have any questions on how to use our website to draft your legal documents, or on downloading your completed documents, please contact us on <a href="mailto:advice@uklawonline.com">advice@uklawonline.com</a> or call us on 0845 888 0002</p>

			  </div>
			  <div class="content <% $c->stash->{tab} == 4 && 'active' %>" id="t4">
			 	<h4><span class="help_centre_head">Help Centre</span> Using our service</h4>
			 		<p>All you need to do to use our service is to select the type of document that you want and to answer our simple list of online questions. There are help and advice notes at every stage to help you through the process. As you answer the questions, you will see the draft document being created there and then on your screen!</p>  
			  	<p>You can "try before you buy" before you commit to purchasing your document and you can save a draft at any time and come back to it later. So, if you need to look something up before you answer or if you need to discuss your response with someone else (for example, who is going to be the guardian for our children?) you won’t lose the information you have already entered.</p>
			  	<p>If you need advice on producing your document, we can provide you with access to an expert either by phone or via email.</p>
			  	<p>Once you have purchased and completed your draft document, it will be available for you to download and we will provide you with appropriate notes on how to turn your final document into a legally binding document.</p>
			  </div>
			  <div class="content <% $c->stash->{tab} == 5 && 'active' %>" id="t5">
			  <h4><span class="help_centre_head">Help Centre</span> Account recovery</h4>

			  </div>
			</div>
	</div>
</div>
