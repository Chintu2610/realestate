<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>

<%
HttpSession sdsession = request.getSession(true);

// Retrieve the username attribute from the session
String username = (String) sdsession.getAttribute("username");
String roleIDString = (String) sdsession.getAttribute("RoleID");

// Check if the user is logged in or redirect to the login page
if (roleIDString == null) {
    response.sendRedirect("login.jsp"); // Change "login.jsp" to your actual login page
} else {
    // Rest of your content for the logged-in user
%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
<link rel="shortcut icon" href="./images/favicon.ico">

<!--	Fonts
	========================================================-->
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!--	Css Link
	========================================================-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/layerslider.css">
<link rel="stylesheet" type="text/css" href="css/color.css" id="color-change">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
	 
	  <link rel="stylesheet" href="css/YouTubePopUp.css">

<!--	Title
	=========================================================-->
<title>Homex - Real Estate Template</title>
</head>
<body>
<!-- Main Wrapper -->
    <div class="main-wrapper">

    
        <!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
      
      <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
        
         <!-- Main Wrapper -->
    <div class="page-wrapper">
        
		 <!--	sidebar end  -->
        <div class="content container-fluid">
<!--=================================
Terms and conditions -->
<section class="space-ptb">
<h1 style="display:none;">Find the best property by Investors Clinic</h1> 
  <div class="container">
    <div class="row">
      <div class="col-12">
              <div class="section-title">
          <h2>Terms and conditions</h2>
        </div>
          <p class="mb-20">We Investors Clinic Infratech Pvt. Ltd. (hereinafter referred to as “Company”) provide one stop end-to-end solutions for property investment through various option to our esteem clients. Here the term "Client" refers to a person, irrespective of Gender, Firm, Company, Entity in whose favour a particular property is booked and/ or a credit note is issued.That the terms and condition mentioned hereinafter incorporates this service terms applicable upon our clients and all users of the website www.investorsclinic.in. </p>

        <h6 class="text-primary mt-4">A. SCOPE OF AGREEMENT</h6><p class="MsoListParagraphCxSpFirst" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">1.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">In no event will the company and/or
its group companies and/or its entities be liable for any loss or damages
arising from the use of or reliance on information provided on this website/ in
this brochure. The use of any information or material on this website/ in this
brochure is entirely at the visitor’s own risk. In case of contradiction
between this information and the final agreement, the conditions of the final agreement
alone shall be binding.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">2.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">The information on this
website/ in this brochure does not constitute a legal offer and/or contract of
any such type between us/the promoter and the visitor.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">3.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">The names, marks and copyrights
in the artistic style in which they are represented herein either belong to, or
are owned by or has been permitted to be used by the company.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">4.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">This website/ brochure contains
material which is owned by or licensed by the company and is protected by
copyright and intellectual property laws. Reproduction is prohibited without
prior permission in writing. The company has the right to alter the information
of this website/ brochure without obligation to communicate any changes.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">5.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">A visitor, by the act of
submitting information through the website or email will be considered to
warrant that he/she has provided true, accurate, current and complete
information. By entering a mobile number, a visitor is considered to have
consented to the company, to send alerts, promotional SMS and the permission to
be contacted.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">6.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">The company shall make every
effort to keep the website free of viruses and other harmful components but
does not warrant the same. This website and emails from the company are
vulnerable to data corruption, interception, tampering, viruses as well as
delivery error and the visitor accepts the fact that the company shall not be
liable for any consequences that may arise from them.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">7.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">The design, plans,
specifications, facilities, images, features, etc. shown on this website/ in
this brochure are only indicative and subject to the approval of the respective
authorities. We/the promoter reserve the right to change these without any
notice or objections.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">8.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">The company or any of its
employees, managers or representatives shall not be responsible for any damage
or economic loss arising out of or related to the use of the website/ brochure.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">9.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">The website may contain links
to other websites which are not under the control of the company. Any such
links may be accessed by the visitor and the company shall not be liable or
responsible for the same.<o:p></o:p></span></p><p class="MsoListParagraphCxSpMiddle" style="margin-left:72.0pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">10.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">We/ the promoter reserves the
right to change, alter, add or delete any of the specifications mentioned
herein without prior permission or notice subject however to the applicable
laws.<o:p></o:p></span></p><p>



















</p><p class="MsoListParagraphCxSpLast" style="margin-left:72.0pt;mso-add-space:auto;
text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><!--[if !supportLists]--><span lang="EN-US">11.<span style="font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;
</span></span><!--[endif]--><span lang="EN-US">Please note that ________ is
the only official website of ____________ (“the company”). The public at large
is hereby informed and advised not to refer to or rely on any information/data
on any other unauthorized/unofficial websites having our logos / project
details / brand name. You may choose to report any such unauthorized/unofficial
websites to us on ____________ such that we can initiate necessary action
against them. In addition, please check/ensure that you are dealing with our
official “RERA registered” real estate agent only.</span></p><p class="MsoListParagraphCxSpLast" style="margin-left:72.0pt;mso-add-space:auto;
text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><span style="color: rgb(51, 122, 183); font-family: &quot;Source Sans Pro&quot;, sans-serif; font-size: 12px; text-align: start; text-indent: 0px;"><br></span></p><p class="MsoListParagraphCxSpLast" style="margin-left:72.0pt;mso-add-space:auto;
text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><span style="color: rgb(51, 122, 183); font-family: &quot;Source Sans Pro&quot;, sans-serif; font-size: 12px; text-align: start; text-indent: 0px;">OTHER SCOPE OF AGREEMENT</span><br></p><p class="MsoListParagraphCxSpLast" style="margin-left:72.0pt;mso-add-space:auto;
text-align:justify;text-indent:-18.0pt;mso-list:l0 level1 lfo1"><span lang="EN-US"><o:p></o:p></span></p>

        <p class="mb-20">1. The Company as a service provider relies on the information pertaining to various projects provided by the respective builders/developers, given in writing and/or provided through their representatives, responsible persons, advertisements by the Builders/Developers in the print and/or electronic media and/or such other authentic sources.</p>
        <p class="mb-20">2. The customer is advised to regularly visit the website of the Company and/ or respective builders/developers for developments and/or events pertaining to real estate from time to time.</p>
        <p class="mb-20">3. In case a client intends to cancel a unit/property booked by him/her through the Company, he/she shall be liable to pay a nominal administrative charge to the Company for issuance of No Objection Certificate (NOC) by the Company. The administrative charge may vary from project to project, Developer to Developer and/or such other factors that may be relevant to a particular project. The Company will not be bound to issue a NOC until the client has paid the administrative charges as mentioned.</p>
        <p class="mb-20">4. The client is bound to notify the Company in case he transfers the unit booked by him/her or creates any third party interest in the property booked through the Company.</p>
        <p class="mb-20">5. The credit note issued by the Company for a particular project to the client is non-transferable and in case the client sells/transfers the property and/or creates any third party interest in any manner whatsoever then it shall be the responsibility of the client to notify the Company about such transfer within seven days of such transfer. It is further clarified that the liability of the Company under the credit note is only towards the client and not towards the subsequent transferee (s) and/or any entity in whose favor the client has created any such interest. The Company will only disburse the amount under the credit note (subject to the conditions mentioned in the credit note) in favor of the person to whom the said credit note is issued and shall not be liable to pay anyone claiming for and on behalf of the person to whom the credit note was originally issued. The company will have the right to deduct TDS in terms of applicable laws. It is further clarified that if the client, while creating any third party interest has also included the credit note in the cost of the unit, the Company shall neither be a party to the said transaction, nor be responsible in any manner whatsoever to release the payment to such third party under any circumstances.</p>
        <p class="mb-20">6. The Company in the capacity of service provider is not responsible for any delays for whatsoever reason , increasing in cost, change of layout, change/levying of PLC, scraping of project, change in the builder policies, change in the government policies, judicial/administrative orders, variations between commitments and deliverables and/or such other circumstances that may take place from time to time.</p>
        <p class="mb-20">7. The a Company as a service provider is not a part of the business of a Builder/Developer and is not involved in either decision making or obtaining statutory approvals from relevant authorities. The Company is not liable for any misrepresentation made by the builder/developer in any manner whatsoever and at any point of time.</p>
        <p class="mb-20">8. In case the Company has issued a credit note and subsequently it does not receive the commission due from the concerned developer it shall not be liable to disburse the credit note to the client under any circumstances whatsoever. Further the Company will not be liable to disburse the credit note until it receives the brokerage/ commission from the concerned Developer and until other conditions mentioned in the credit note are fulfilled. In case the Company does not finally receive the payment from the concerned Developer for any reasons whatsoever, then it shall not be liable to honour the credit note under any circumstances whatsoever. In case the Company only receives part commission from the Developer, it shall release the proportionate amount to the Client.</p>
        <p class="mb-20">9. The Company clarifies that it shall not be responsible for interest if any, on the overdue payments that may be levied by the Developer and/or cancellation(s) of the unit under any circumstances whatsoever.</p>
        <p class="mb-20">10. The company further clarifies that It shall be the responsibility of the client to point out the accuracy of the information that may form part and parcel of any email conversation and should bring the same to the notice of the Company on an immediate basis failing which the Company will presume that the information in every communication is accurate and the Company shall not be responsible for any loss which accrues on account of any erroneous information and/or any ramification arising as a consequence thereof.</p>
        <p class="mb-20">11. The Company shall not be responsible for any verbal commitments allegedly made by any employee at any point of time. The Company will further not consider any communications that may be in writing but not made on the Company's letter head and not made by a person empowered/authorized to make such a commitment. The Company will not be bound by the commitments made by any ex-employee, if he is not working in the Company at the relevant time when such commitment was made. Any commitment made by an existing employee from a personal email ID shall not be entertained by the Company at any point of time.</p>
        <p class="mb-20">12. The Client shall have no objection if the Company uses any data pertaining to his booking for any advertising and promotional purposes.</p>
        <p class="mb-20">13. The Company may suspend the functionality of the website due to reasons of maintenance and/or other reasons from time to time. Any information accessed by the client during the period of such suspension which may not be updated information, shall not bind the Company in any manner whatsoever.</p>
        <p class="mb-20">14. In case of any query, clarification, grievance the client is free to contact the Customer Care Department of the Company at PHONE NO. 9711454999 or address an email at EMAIL ID : customercare@investorsclinic.in.</p>
        <p class="mb-20">15. The client will be bound by the rules and by laws guidelines laid down by the concerned builder/developer for each project and the Company will not have any say in the same. That in case the query of the client requires a response from the developers end then the Company shall coordinate with the concerned builder/developer and forward the response received from the concerned builder/developer. The Company however will not be liable if such response is unsatisfactory to the client.</p>
        <p class="mb-20">16. The Company does not accept any cash from any client under any circumstances whatsoever. The Company only accepts duly signed Cheque or Demand Drafts/ Bankers Cheque in favor of the concerned Developer for the concerned projects only after the client fills up the booking form issued by the concerned Developer.</p>
        <p class="mb-20">17. The Company shall not be responsible for any cancellation arising out of incomplete/ invalid documents in support of the booking and at the same time the Company owes no responsibility for any cancellations arising out of non-sanction/ delay in sanction of loan from any financial institution.</p>
        <p class="mb-20">18. The non-receipt of an email communication cannot be treated as a valid ground for non performance of any obligation or ignorance about a particular policy and/or other aspects that may be contained in the email.</p>
        <p class="mb-20">19. In case of any dispute the courts at Noida shall have the exclusive jurisdiction to try and entertain the same. During the use of website if any dispute arises out of such use will be subject to laws of India and to the exclusive jurisdiction of the courts in Noida.</p>

        <h6 class="text-primary mt-4">B. COLLECTION OF PERSONAL AND OTHER INFORMATION</h6>
        <p class="mb-20">1. The User expressly agrees and acknowledges that the Company collects and stores the User’s personal information, which is provided by the User from time to time on the Website, including but not limited to the User's user name, passwords, email address, name, address, age, date of birth, sex, nationality, shopping preferences, browsing history, etc., as well as any images or other information uploaded/published by the User on the Website. The User is aware that this information will be used by the Company/Website to provide services and features targeted at the User, that are most likely to meet the User’s needs, and also to customize and improve the Website to make its user's experiences safer and easier.</p>
        <p class="mb-20">2. The User is aware that the Company/Website may automatically track certain information about the User based upon the User's IP address and the User’s behaviour on the Website and the User expressly consents to the same. The User is aware that this information is used to do internal research on user demographics, interests, and behaviour, to enable the Company/Website to better understand, and cater to the interests of its users. The User is expressly made aware that such information may include the URL that the User visited prior to accessing the Website, the URL which the User subsequently visits (whether or not these URLs form a part of the Website), the User's computer &amp; web browser information, the User's IP address, etc.</p>
        <p class="mb-20"> 3. If the User chooses to purchase products / services from the Website, the User consents to allowing the Company/Website to collect information about the User's buying behaviour and trends.</p>
        <p class="mb-20"> 4. If the User chooses to post messages / reviews / feedback anywhere on the Website, including but not limited to message boards, chat rooms, other message areas, etc., the User is aware that any and all such information provided / uploaded will be collected and stored by the Company indefinitely, and that such retained information may be used to resolve disputes, provide customer support, troubleshoot problems, etc., and that such information, if requested, may be provided to judicial or governmental authorities of requisite jurisdiction, or otherwise used by the Company/Website as permitted by applicable laws.</p>
        <p class="mb-20">5. The User is aware that any and all information pertaining to the User collected by the Company, whether or not directly provided by the User to the Company/Website, including but not limited to personal correspondence such as emails or letters, feedback from other users or third parties regarding the User's activities or postings on the Website, etc., may be collected and complied by the Company/Website into a file/folder specifically created for / allotted to the User, and the User hereby expressly consents to the same. </p>
        <p class="mb-20">6. The User is aware that while he/she can browse some sections of the Website without being a registered user, certain activities (such as placing an order) require the User to provide valid personal information to the Company/Website for the purpose of registration. The User is aware that the contact information provided to the Company/Website may be used to send the User offers and promotions, whether or not based on the User's previous orders and interests, and the User hereby expressly consents to receiving the same.</p>
        <p class="mb-20">7. The User is aware that the Company/Website may occasionally request the User to complete optional online surveys. These surveys may require the User to provide contact information and demographic information (like zip code, age, income bracket, sex, etc.). The User is aware that this data to is used to customise the Website for the benefit of the User, and providing all users of the Website with products/services/content that the Company/Website believes they might be interested in availing of, and also to display content according to the User's preferences.</p>
        <p class="mb-20"> 8. The User is further aware that the Company/Website may occasionally request the User to write reviews for products/services purchased/availed of by the User from the Website, and also reviews for the various sellers listing their products/services on the Website. The User is aware that such reviews will help other users of the website make prudent and correct purchases, and also help the Company/Website remove sellers whose products are unsatisfactory in any way, and the User hereby expressly authorizes the Company/Website to publish any and all reviews written by the User on the Website, along with the User's name and certain contact details, for the benefit and use of other Users of the Website. </p>
        <p class="mb-20">9. Nothing contained herein shall be deemed to compel the Website/Company to store, upload, publish, or display in any manner content/reviews/surveys/feedback submitted by the User, and the User hereby expressly authorizes the Website/Company to remove from the Website any such content, review, survey, or feedback submitted by the User, without cause or being required to notify the User of the same. </p>

        <h6 class="text-primary mt-4">C. COOKIES</h6>
        <p class="mb-4">a) The User is aware that a ‘Cookie’ is a small piece of information stored by a web server on a web browser so it can later be traced back from that particular browser, and that cookies are useful for enabling the browser to remember information specific to a given user, including but not limited to a User's login identification, password, etc. The User is aware that the Website places both permanent and temporary cookies in the User's computer's hard drive and web browser, and does hereby expressly consent to the same.</p>
        <p class="mb-4">b) The User is further aware that the Website uses data collection devices such as cookies on certain pages of the Website to help analyse web page flow, measure promotional effectiveness, and promote trust and safety, and that certain features of the Website are only available through the use of such cookies. While the User is free to decline the Website's cookies if the User's browser permits, the User may consequently be unable to use certain features on the Website.</p>
        
        <h6 class="text-primary mt-4">D. DIVULGING/SHARING OF PERSONAL INFORMATION</h6>
         <p class="mb-4">a) The User is aware that the Website/Company may share the User's personal information with other corporate entities and affiliates to help detect and prevent identity theft, fraud and other potentially illegal acts; correlate related or multiple accounts to prevent abuse of the Website's services; and to facilitate joint or co-branded services, where such services are provided by more than one corporate entity.</p>
         <p class="mb-4">b) The User is aware that the Website/Company may disclose personal information if required to do so by law or if the Website/Company in good faith believes that such disclosure is reasonably necessary to respond to subpoenas, court orders, or other legal processes. The Website/Company may also disclose the User's personal information to law enforcement offices, third party rights owners, or other third parties if it believes that such disclosure is reasonably necessary to enforce the Terms or Policy; respond to claims that an advertisement, posting or other content violates the rights of a third party; or protect the rights, property or personal safety of its users, or the general public.</p>
         <p class="mb-4"> c) The User is further aware that the Website/Company and its affiliates may share / sell some or all of the User's personal information with other business entities should the Company/Website (or its assets) plan to merge with, or be acquired by such business entity, or in the event of re-organization, amalgamation, or restructuring of the Company's business. Such business entity or new entity will continue to be bound be the Terms and Policy, as may be amended from time to time. </p>
         <h6 class="text-primary mt-4">E. User's Consent</h6>
         <p class="mb-4">By using the Website and/ or by providing information to the Company through the Website, the User consents to the collection and use of the information disclosed by the User on the Website in accordance with this Policy, including but not limited to the User's consent the Company/Website sharing/divulging the User's information, as per Privacy Policy. </p>
         <h6 class="text-primary mt-4">F. AD SERVERS</h6>
         <p class="mb-4">To try and bring you offers that are of interest to you, we have relationships with other companies to whom we allow to place ads on our Website and Mobile App. As a result of your visit to our Website and / or Mobile App, ad server companies may collect information such as your domain type, your IP address and clickstream information.</p>
         <h6 class="text-primary mt-4">G. COPYRIGHT AND TRADEMARK POLICY</h6>
         <p class="mb-4">All content included in our Services, such as text, graphics, logos, button icons, images, clips, digital downloads, data compilations, and software, is the property of the Company and its content suppliers and protected by copyright laws. All software used on this Website and Mobile App is the property of the Company.</p>
         <h6 class="text-primary mt-4">H. SUSPENSION OF USER ACCESS AND ACTIVITY</h6>
         <p class="mb-4">Notwithstanding other legal remedies that may be available to it, the Company may in its sole discretion limit the User's access and/ or activity by immediately removing the User's access credentials either temporarily or indefinitely, or suspend / terminate the User's membership, and/or refuse to provide User with access to the Website, without being required to provide the User with notice or cause:</p>
         <p class="mb-4">a) If the User is in breach any of these Terms or the Policy;</p>
         <p class="mb-4">b) If the User has provided wrong, inaccurate, incomplete or incorrect information;</p>
         <p class="mb-4">c) If the User's actions may cause any harm, damage or loss to the other users or to the Website/Company, at the sole discretion of the Company.</p>
         <h6 class="text-primary mt-4">I. THIRD-PARTY WEBSITES</h6>
         <p class="mb-4">Our Website / Mobile App may contain links to other websites. When you click on one of these links, you are navigating to another website. We do not accept liability for misuse of any information by any website controller to which we may link. We also do not have any responsibility of liability for the content on websites that use www.investorsclinic.in search functionality. We encourage you to read the privacy statements of these websites, which may differ from ours.</p>
          <h6 class="text-primary mt-4">J. INDEMNIFICATION AND LIMITATION OF LIABILITY</h6>
          <p class="mb-4">Each User agrees to indemnify, defend and hold harmless the Company and its affiliates including but not limited to its (and its affiliates’) officers, directors, consultants, agents and employees (“Indemnities”) from and against any and all losses, liabilities, claims, damages, demands, costs and expenses (including legal fees and disbursements in connection therewith and interest chargeable thereon) asserted against or incurred by the Indemnities that arise out of, result from, or may be payable by virtue of, any breach or non-performance of any representation, warranty, covenant or agreement made or obligation to be performed by such User pursuant to these General Terms of Use. Further, each User agrees to hold the Indemnities harmless against any claims made by any third party due to, or arising out of, or in connection with, such User’s use of the Website or Services, User’s violation of the General Terms of Use, or User’s violation of any rights of another, including any intellectual property rights.</p>
          <p class="mb-4">In no event shall the Indemnities, be liable to the Users or any third party for any special, incidental, indirect, consequential or punitive damages whatsoever, including those resulting from loss of use, data or profits, whether or not foreseeable or whether or not the Company has been advised of the possibility of such damages, arising out of or in connection with (i) User’s use of or access to the Website, Services or materials on the Website; or (ii) services provided by any Registered Service Provider.</p>
          <p class="mb-4">The limitations and exclusions in this Section apply to the maximum extent permitted by applicable laws.</p>
          <h6 class="text-primary mt-4">K. ENTIRE AGREEMENT</h6>
          <p class="mb-4">These Terms, read with the Policy form the complete and final contract between the User and the Company with respect to the subject matter hereof and supersedes all other communications, representations and agreements (whether oral, written or otherwise) relating thereto;</p>
          <h6 class="text-primary mt-4">L. WAIVER</h6>
          <p class="mb-4">The failure of either Party at any time to require performance of any provision of these Terms shall in no manner affect such Party's right at a later time to enforce the same. No waiver by either Party of any breach of these Terms, whether by conduct or otherwise, in any one or more instances, shall be deemed to be or construed as a further or continuing waiver of any such breach, or a waiver of any other breach of these Terms.</p>
          <h6 class="text-primary mt-4">M. SEVERABILITY</h6>
          <p class="mb-4">If any provision/clause of these Terms is held to be invalid, illegal or unenforceable by any court or authority of competent jurisdiction, the validity, legality and enforceability of the remaining provisions/clauses of these Terms shall in no way be affected or impaired thereby, and each such provision/clause of these Terms shall be valid and enforceable to the fullest extent permitted by law. In such case, these Terms shall be reformed to the minimum extent necessary to correct any invalidity, illegality or unenforceability, while preserving to the maximum extent the original rights, intentions and commercial expectations of the Parties hereto, as expressed herein.</p>
          <h6 class="text-primary mt-4">N. DISCLAIMER</h6>
          <p class="mb-4">For all the real estate projects displayed on our website the information has been gathered by Investors Clinic Infratech Private Limited “the Company” through public sources/project marketing material/internet sources/on their own and has not been provided by the developer and hence shall not be construed as an offer for sale or an advertisement for sale by Investors Clinic or by the builder/developer. Additionally--</p>

          <ul class="ps-3 mb-20">
          <li> While reasonable efforts are made by the Company to ensure the update, authenticity and completeness of the information displayed here, there exists a possibility that it may not be complete and updated. The Clients are advised to recheck all information and details form the Builder/ Developer and make an independent assessment/decision before booking and property. The Client shall not make any claim on the Company, whatsoever in this regard.</li>
          <li>The pictures / photos shown in various projects include the artist’s impression of the Project. The actual properties may vary from such representations. You may also verify the completeness and accuracy of the information from RERA website of the respective state where the Project is located.</li>
          <li>As per the regulations, the Developer has a 90 days’ time period from 1st May 2017 to obtain necessary registration under the law. The display of information on Investors Clinic does not in any way confirm or guarantee the allotment of registration to the Project under RERA and authorities may also deny the registration later at any stage. </li>
        </ul>
        <p class="ps-3 mb-20">Investors Clinic shall neither be responsible nor liable for any inaccuracy in the information provided here and therefore the customers are requested to validate the information from the respective builders/developers before making any decision of the purchase of properties. Investors Clinic, its directors, employees, agents and other representatives shall not be liable for any action taken, cost / expenses / losses incurred by you based on the information given on its portal. </p>
      </div>
          </div>
  </div>
</section>
<!--=================================
Terms and conditions -->
</div>
</div>
</div>
<script src="js/jquery.min.js"></script> 
<!--jQuery Layer Slider --> 
<script src="js/greensock.js"></script> 
<script src="js/layerslider.transitions.js"></script> 
<script src="js/layerslider.kreaturamedia.jquery.js"></script> 
<!--jQuery Layer Slider --> 
<script src="js/popper.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/owl.carousel.min.js"></script> 
<script src="js/tmpl.js"></script> 
<script src="js/jquery.dependClass-0.1.js"></script> 
<script src="js/draggable-0.1.js"></script> 
<script src="js/jquery.slider.js"></script> 
<script src="js/wow.js"></script> 

<script src="js/custom.js"></script>

<!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    
</body>
</html>

<%
   }
%>