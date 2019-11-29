 <div class="layout one product_page slider" id="content-layout">

    <div class="panel product_page" id="main-panel">
      <div id="banner-txt">
	  <h2>Online Legal Documents</h2>
	  <h2 style="font-size:22px; margin-top:22px;">Safe and Secure</h2>
	  <h2 style="font-size:22px; margin-top:16px;">Competitively Priced</h2>
	  <h2 style="font-size:22px; margin-top:16px;">Created with you in mind</h2>

	  </div>
%	if ($c->session->{details}->referrer) {

	  <div id="banner-affiliate-txt">
		<h2>Voucher code 'SL2013' for 20% discount!</h2>
	  </div>
%	}

	  
	  	<div class="slider-wrapper theme-bar">
	      <div id="slider_02" class="nivoSlider">
		
		<img src="/static/images/site_01/uklo/will-01-w.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-07.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-02.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-03.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-04.jpg" title="" />
		<img src="/static/images/site_01/uklo/happy-family-05.jpg" title="" />

	    </div>
      </div>
	  
	  	<div id="columns">
	  <div class="box-our-service column">
			<h2 class="main">Our Online Legal document Service</h2>
			<div class="box-content">
				<p>You create your own Will document yourself using our online <span class="brand-txt">'document builder'</span>.</p>
				<div class="sub-header">How our online service works:</div>
				<ol>
					<li><p>Select a document from the list below</p>
						<ol style="list-style-type: lower-alpha;">
							<li><p class="odd">Click on the “info” button to read more information about each Will and to decide which one is right for you</p></li>
							<li><p>Click on the “Start Now” button to <span style="font-weight: bold; font-style: italic;">try before you buy</span> where you can start creating your document and where you can save all or part of your draft, or purchase the document, at any time</p></li>
						</ol></li>
					<li><p class="odd">Click on the “buy” button to purchase the document through our secure online checkout.</p></li>
					<li><p>Complete the document online and then submit it to us for review.</p></li>
					<li><p class="odd">After review, and or/edit, we'll upload your finalised document to your secure 'My Services' section of the website for you to download and use.</p></li>
				</ol>
				<img class="left" src="/static/images/site_01/uklo/professional-02.jpg"><div class="sub-header">Our online service commitment:</div>
				<p>All of our online document services feature a full legal review by one of our legal experts. We will evaluate the draft document that you initially supply to us and then contact you with any suggestions or with confirmation that the document can be finalised. We will then guide you through the process of turning your document into a legally binding Will.</p>
			</div>
		</div>

		<div class="box-benefits column last">
    	<h2 class="main">Legal Advice Available!</h2>

			<& /right_side_boxes/promo-02.mi &>
			<& /right_side_boxes/promo-03.mi &>
    	
    	</div>

	</div>

  </div>

</div>
<div id="products">
		<div id="accordion">
          <h3>Available Wills</h3>
		  <div>
          <table class="documents">
              <thead>
                <tr class="header">
                  <th class="name">Document</th>
                  <th class="info">Info</th>
                  <th class="info">Try</th>
%	if ($c->session->{details}->referrer) {
                  <th class="price">Normal Price</th>
                  <th class="price discount">Safe Legal Price</th>				  
% 	} else {
                  <th class="price">Price</th>
%	}
                  <th class="buy">Buy</th>
                </tr>
              </thead>
              <tbody>
                <tr class="document first odd">
                  <td class="name"><a name="Comprehensive Will for a married person or civil partner"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=833">Comprehensive Will for a married person or civil partner</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-833">Info</a></div></td>
				  <& /product/descr/wills-833.mi, template_id => '833' &>
                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=833">Start now</a></div></td>
                  <td class="price">&pound;95</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;76</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=833">Buy</a></div></td></tr>

				<tr class="document even">
                  <td class="name"><a name="Mutual/Mirror Wills for married couples or civil partners"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&amp;purchase=1793">Mutual/Mirror Wills for married couples or civil partners</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-1793">Info</a></div></td>
				  <& /product/descr/wills-1793.mi, template_id => '1793' &>

                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&amp;firm=EAC0C656&amp;id=1793">Start now</a></div></td>
                  <td class="price">&pound;145</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;116</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&amp;purchase=1444">Buy</a></div></td></tr>

				<tr class="document odd">
                  <td class="name"><a name="Comprehensive Will for a married person or civil partner (inc. STEP standard provisions)"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&amp;purchase=1444">Comprehensive Will for a married person or civil partner (inc. STEP standard provisions)</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-1444">Info</a></div></td>
				  <& /product/descr/wills-1444.mi, template_id => '1444' &>

                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&amp;firm=EAC0C656&amp;id=1444">Start now</a></div></td>
                  <td class="price">&pound;105</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;84</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&amp;purchase=1444">Buy</a></div></td></tr>

				<tr class="document even">
                  <td class="name"><a name="Discretionary Trust Will for married person or civil partner"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&amp;purchase=1088">Discretionary Trust Will for married person or civil partner</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-1088">Info</a></div></td>
				  <& /product/descr/wills-1088.mi, template_id => '1088' &>
                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&amp;firm=EAC0C656&amp;id=1088">Start now</a></div></td>
                  <td class="price">&pound;105</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;84</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&amp;purchase=1088">Buy</a></div></td></tr>
                <tr class="document odd">
                  <td class="name"><a name="Comprehensive Will for an unmarried person"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=834">Comprehensive Will for an unmarried person</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-834">Info</a></div></td>
				  <& /product/descr/wills-834.mi, template_id => '834' &>
                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=834">Start now</a></div></td>
                  <td class="price">&pound;95</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;76</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=834">Buy</a></div></td></tr>

                <tr class="document even">
                  <td class="name"><a name="Comprehensive Will for an unmarried person (inc. STEP standard provisions)"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=1445">Comprehensive Will for an unmarried person (inc. STEP standard provisions)</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-1445">Info</a></div></td>
				  <& /product/descr/wills-1445.mi, template_id => '1445' &>
                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=1445">Start now</a></div></td>
                  <td class="price">&pound;105</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;84</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=1445">Buy</a></div></td></tr>

<%
#                <tr class="document odd">
#                  <td class="name"><a name="Comprehensive Will for married person or civil partner (pair)"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=931">Comprehensive Will for married person or civil partner (pair)</a></td>
#                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-931">Info</a></div></td>
#				  <& /product/descr/wills-931.mi, template_id => '931' &>
#                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=931">Start now</a></div></td>
#                  <td class="price">&pound;145</td>
#%	if ($c->session->{details}->referrer) {
#				  <td class="price discount">&pound;116</td>
#%	}
#                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=931">Buy</a></div></td></tr>
#
#                <tr class="document even">
#                  <td class="name"><a name="Comprehensive Will for unmarried person (pair)"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=932">Comprehensive Will for unmarried person (pair)</a></td>
#                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-932">Info</a></div></td>
#				  <& /product/descr/wills-932.mi, template_id => '932' &>
#                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=932">Start now</a></div></td>
#                  <td class="price">&pound;116</td>
#%	if ($c->session->{details}->referrer) {
#				  <td class="price discount">&pound;95</td>
#%	}
#                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=932">Buy</a></div></td></tr>
%>

<%
#                <tr class="document even">
#                  <td class="name"><a name="Discretionary Trust Will for married person or civil partner (pair)"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=835">Discretionary Trust Will for married person or civil partner (pair)</a></td>
#                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-835">Info</a></div></td>
#				  <& /product/descr/wills-835.mi, template_id => '835' &>
#                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=835">Start now</a></div></td>
#                  <td class="price">&pound;155</td>
#%	if ($c->session->{details}->referrer) {
#				  <td class="price discount">&pound;124</td>
#%	}
#                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=835">Buy</a></div></td></tr>
%>
                <tr class="document odd">
                  <td class="name"><a name="Letter of wishes"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=836">Letter of wishes</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-836">Info</a></div></td>
				  <& /product/descr/wills-836.mi, template_id => '836' &>
                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=836">Start now</a></div></td>
                  <td class="price">&pound;10</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;8</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=836">Buy</a></div></td></tr>

                <tr class="document even">
                  <td class="name"><a name="Living Will"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=837">Living Will</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-837">Info</a></div></td>
				  <& /product/descr/wills-837.mi, template_id => '837' &>
                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=837">Start now</a></div></td>
                  <td class="price">&pound;65</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;52</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=837">Buy</a></div></td></tr>

                <tr class="document last odd">
                  <td class="name"><a name="Revocation of a Living Will"></a><a href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=838">Revocation of a Living Will</a></td>
                  <td class="info"><div class="button"><a class="popup" title="" href="#dialog-wills-838">Info</a></div></td>
				  <& /product/descr/wills-838.mi, template_id => '838' &>
                  <td class="preview"><div class="button"><a title="Check to see if this is the document you require" href="https://www.clientspace.org/r45/assembler.asp?action=p&firm=EAC0C656&id=838">Start now</a></div></td>
                  <td class="price">&pound;10</td>
%	if ($c->session->{details}->referrer) {
				  <td class="price discount">&pound;8</td>
%	}
                  <td class="buy"><div class="button"><a title="Select this document for purchase or submission" href="https://www.clientspace.org/register.asp?firm=EAC0C656&purchase=838">Buy</a></div></td></tr>

            </tbody>
          </table>
		  </div>
	</div>
</div>
