---
layout: xslt
comPhone: 
comAccount: 
comBank: 
cssFontFamily: Arial
cssColor: "#0c323e"
company:
  width: 160
  info:
  - label: Đơn vị bán hàng
    code: ComName
    style: "font-weight: bold; font-size: 17px;"
  - label: Mã số thuế
    code: ComTaxCode
    style: "font-weight: bold; letter-spacing: 2px"
  - label: Địa chỉ
    code: ComAddress
  - label: Số tài khoản
    value: 76010000372259 tại Ngân hàng Đầu tư Phát triển Bà Rịa - Vũng Tàu
  - label: Điện thoại
    value: 0254.6253413
customer:
  width: 160
  info:
  - label: Họ tên người mua hàng
    width: 630
    code: Buyer
  - label: Tên đơn vị
    width: 630
    code: CusName
  - label: 
    width: 630
  - label: Mã số thuế
    width: 630
    code: CusTaxCode
  - label: Địa chỉ
    width: 630
    code: CusAddress
  - label: 
    width: 630
  - label: Hình thức thanh toán
    width: 200
    code: Kind_of_Payment
    kindOfPayment: true
    col-2:
      - label: Số tài khoản
        width: 353
        code: CusBankNo
---
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl js" xmlns="http://www.w3.org/1999/xhtml"
xmlns:js="urn:custom-javascript" xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
  <xsl:param name="bien" select="0"/>
  <xsl:param name="bien1" select="0"/>

  <xsl:variable name="itemCount">
    <xsl:value-of select="count(Invoice//Content//Products//Product)"/>
  </xsl:variable>

  <xsl:template name="addZero">
    <xsl:param name="count"/>
    <xsl:if test="$count > 0">
      <xsl:text>0</xsl:text>
      <xsl:call-template name="addZero">
        <xsl:with-param name="count" select="$count - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="congphi">
    <xsl:param name="count"/>
    <xsl:if test="$count > 0">
      <xsl:value-of select="$count">
      </xsl:value-of>
      <xsl:text>0</xsl:text>
      <xsl:call-template name="addZero">
        <xsl:with-param name="count" select="$count - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="addDots">
    <xsl:param name="val"/>
    <xsl:param name="val1"/>
    <xsl:param name="val2"/>
    <xsl:param name="i" select="1"/>
    <xsl:if test="$val1>0">
      <xsl:choose>
        <xsl:when test="$val2 !=0">
          <xsl:value-of select="substring($val,$i,$val2)"/>
          <xsl:if test="substring($val,$i+$val2+1,1) !=''">
            <xsl:text>.</xsl:text>
          </xsl:if>
          <xsl:call-template name="addDots">
            <xsl:with-param name="val" select="$val"/>
            <xsl:with-param name="val1" select="$val1 - 1"/>
            <xsl:with-param name="i" select="$i + $val2"/>
            <xsl:with-param name="val2" select="3"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <!--<xsl:text>test</xsl:text>-->
          <xsl:value-of select="substring($val,$i,3)"/>
          <xsl:if test="substring($val,$i+3,1) !=''">
            <xsl:text>.</xsl:text>
          </xsl:if>
          <xsl:call-template name="addDots">
            <xsl:with-param name="val" select="$val"/>
            <xsl:with-param name="val1" select="$val1 - 1"/>
            <xsl:with-param name="i" select="$i + 3"/>
            <xsl:with-param name="val2" select="3"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="addLine">
    <xsl:param name="count"/>
    <xsl:if test="$count > 0">
      <tr class="noline back">
        <td class="back-bold" height="13px">
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold" height="13px">
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold" height="13px">
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold" height="13px">
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold" height="13px">
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold">
          <xsl:value-of select="''"/>
        </td>
      </tr>
      <xsl:call-template name="addLine">
        <xsl:with-param name="count" select="$count - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <!--<link href="styles.css" type="text/css" rel="stylesheet" />-->
        <title>VAT</title>
        <style type="text/css" rel="stylesheet">
          html, body
          {
          margin: 0;
          padding: 0;
          height: 100%;
          background-color: white;
          }
		  @page {
        size: A4; margin: 15mm;
      }
          #main
          {
          margin: 0 auto;
          }
          .VATTEMP
          {
		  width: 836px !important;
          background-color: white;
          font-family: '{{cssFontFamily}}', Times, serif;
          font-size: 14px;
          }
		  span, i, b{
			color: {{cssColor}};
		  }
          .VATTEMP .header-main, .content
          {
          width: 790px;
          }
          .VATTEMP #logo
          {
          float: left;
          width: 100px;
          height: 100px;
          background: url('') no-repeat;
          margin: 0;
          }
          .VATTEMP .header
          {
          float: right;
          width: 613px;
          }
          .VATTEMP .header-content
          {
          float: left;
          text-align: center;
          width: 400px;
          }
          .VATTEMP .header h2
          {
          font-size: 1em;
          }
          .VATTEMP .header h2, .header p
          {
          margin: 0;
          }
          .VATTEMP .header p.name-upcase
          {
          font-size: 13px;
          text-transform: uppercase;
          }
          .VATTEMP .header-note
          {
          float: right;
          font-size: 100%;
          width: 175px;
          margin-top: 0;
          }
          .VATTEMP .header .number
          {
          font-family: '{{cssFontFamily}}', Times, serif;
          font-size: 100%;
          }
          .clearfix:after
          {
          clear: both;
          content: ".";
          display: block;
          height: 1px;
          overflow: hidden;
          visibility: hidden;
          }
          .clearfix
          {
          clear: both;
          }
          .VATTEMP .input-code
          {
          border: 1px solid #000000;
          float: left;
          text-align: center;
          width: 18px;
          height: 14px;
          }
          .VATTEMP div label.fl-l, div label
          {
          margin-right: 0;
          margin-top: 3px;

          }
          .VATTEMP .input-name, .input-date
          {
          border: 0;
          border-bottom: 1px dotted {{cssColor}};
          }
          .VATTEMP .statistics
          {
          clear: both;
          margin-right: 0;
          }
          .nenhd
          {
          position: relative;
          }
          .nenhd_bg
          {
          top: 560px;
          left: 100px;
          width: 605px;
		      height: 184px;
		      background-size: 100%;
          margin: 0 auto;
          position: absolute;
          opacity:0.2;
          z-index: 1;
          background: url('data:image/jpeg;base64,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') no-repeat;
          }
          .VATTEMP .statistics table
          {
          background-position: bottom;
          border: 0 none;
          font-size: 100%;
          margin: 0;
          position: relative;
          z-index: 2;
          }
          table
          {
          border-collapse: collapse;
          }
          .VATTEMP .statistics table th
          {
          font-size: 100%;
          border-bottom: 1px solid {{cssColor}};
          border-right: 1px solid {{cssColor}};
          border-left: 1px solid {{cssColor}};
          border-top: 1px solid {{cssColor}};
		  text-align:center;
		  padding:2px 5px;
          }
          .VATTEMP .statistics table th.h2
          {
          font-size: 100%;
          text-transform: none;
          border-bottom: 1px solid {{cssColor}} !important;
          border-right: 1px solid {{cssColor}} !important;
          border-left: 1px solid {{cssColor}} !important;
          border-top: 1px solid {{cssColor}} !important;
          color:  {{cssColor}};
          }
          .VATTEMP .statistics table td.stt
          {
          text-align: center;
          padding-left: 0;
          }
          .VATTEMP .statistics table td.stt2
          {
          text-align: center;
          color: #000000;
          }
          .VATTEMP .statistics table .back td
          {
          color: #000000;
          font-family: '{{cssFontFamily}}', Times, serif;
          font-size: 100%;
          }
          <!-- .VATTEMP .statistics table .noline td -->
          <!-- { -->
          <!-- border-bottom: 1px dotted {{cssColor}}; -->
          <!-- border-right: 1px solid {{cssColor}}; -->
          <!-- border-left: 1px solid {{cssColor}}; -->
          <!-- border-top: 0 none; -->
          <!-- } -->
          .VATTEMP .statistics table td
          {
          border-right: 1px solid {{cssColor}};
          border-left: 1px solid {{cssColor}};
          //padding-top: 2px;
          padding-bottom: 2px;
          padding-right: 2px;
          padding-left: 5px;
          }
          .VATTEMP .statistics tr td.back-bold
          {
          font-size: 100%;
          border-bottom: 1px dotted {{cssColor}};
          }
          .VATTEMP .statistics table .back-bold
          {
          padding-right: 5px;
          text-align: right;
		  height: 30px;
          }
          .VATTEMP .statistics tr td.back-bold2
          {
			  font-size: 100%;
			  border-bottom: 1px dotted {{cssColor}};
			  height: 30px;
          }
          .VATTEMP .statistics tr td.back-bold3
          {
          font-size: 100%;
          border-bottom:none!important;
          }
          .VATTEMP .statistics table .back-bold2
          {
          padding-left: 5px;
          text-align: left;
          }
          .VATTEMP .statistics tr.bg-pink td
          {
          font-size: 100%;
          text-align: right;
          background: none repeat scroll 0 0 #fedccc;
          }
          .VATTEMP .payment, .date
          {
          margin: 20px 0;
          text-align: center;
          width: 35%;
          }
          .VATTEMP .payment
          {
          float: left;
          }
          .VATTEMP .payment p, .date p
          {
          margin: 0;
          }
          .VATTEMP .date
          {
          float: right;
          height: 120px;
          }
          .VATTEMP .input-date
          {
          width: 40px;
          }
          .VATTEMP .input-name, .back-bold, .input-date
          {
            font-family: '{{cssFontFamily}}', Times, serif;
          }
          .fl-l2
          {
          float: left;
          color: {{cssColor}};
          }
          .fl-l
          {
          float: left;
          min-height: 16px;

          }
          .bgimg
          {
          border: 1px solid #000000;
          cursor: pointer;
          //width: 170px;
          }
          .bgimg p
          {
          color: #000000;
          padding-left: 13px;
          text-align: left;
          }
          p
          {
          font-size: 13px;
          }
          .item
          {
          color: #000000;
          }
		  /* ================ */
		  	/* Company Info*/
		  	.comInfo label{
		  		//font-size:16px;
		  	}
			  .comInfo td{
		  		padding-left:10px;
		  	}
			  .comInfo .vt-row{
		  		margin-bottom:8px;
		  	}
			  .comInfo .title{
		  		{{#if company.width}} width:{{company.width}}px {{/if}};
		  	}
			
			/* ================ */
		  	/* Customer Info*/

		  	.customerInfo{
		  	margin-top: 5px;
		  	display: block;		  	
		  	}
		  	.customerInfo td{
		  		padding-left: 10px;
		  	}
		  	.customerInfo label{
		  		//font-size:16px;
		  	}
			.customerInfo .title{
        {{#if customer.width}} width:{{customer.width}}px {{/if}};
			}
			.customerInfo .vt-row{
			margin-bottom: 8px;
			}
			.InvInfoLeft{
		  	text-align:center;
		  	margin:15px 0px 0px 0px;
		  	}
			.InvInfoRight{
		  	text-align:left;
		  	padding-bottom:10px;
		  	}
			.InvInfoRight span{
			font-size: 14px;
			}
        </style>



      </head>
      <body>
        <center>
          <div id="printView" style="position: relative;background-color: white;WIDTH: 100%;">
            <xsl:choose>
              <xsl:when test="/Invoice/Invcancel!=''">
                <img style="position: absolute;left: 0px;top: 0px;width: 100%;height: auto;z-index: 3;" width="100%" height="900px" src="data:image/png;base64,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" />
              </xsl:when>
            </xsl:choose>

            <xsl:for-each select="Invoice//Content/Products/Product[(position()-1) mod 10 = 0]">
              <xsl:variable name="level1Count" select="(position()-1)*10"/>
              <xsl:variable name="pageC" select="(position())"/>

              <div class = "VATTEMP" style="border:1px solid white;">
                <div  class ="pagecurrent" id="page_{position()}">
                  <div style="width:810px !important;margin-top:5px;">
                    <div class="statistics"  >
                      <div class="nenhd" style="margin-bottom: 10px !important;">
                        <table cellspacing="0" cellpadding="0" border="0" style="">
                          <thead>
                            <!--<xsl:copy-of select="$header" />-->
                            <xsl:for-each select="/Invoice//Content">
                              <tr style="background-color: white !important;">
                                <td colspan="6" style="padding-left: 0px !important;padding-right: 0px !important;">
								  <table cellspacing="0" cellpadding="0"  style="width:100%; float: left;">
									<tr style="border-top:1px solid {{cssColor}};">
										<td style="width:215px;border:none;">
                      <div style="margin:5px 0 0 20px;">                        
												<!-- <img alt="logo" style="width:106px" src=""/> -->
											</div>
										</td>
										<td style="vertical-align:top;border:none;">
											<div class="InvInfoLeft" style="">
												<p style="margin:0 auto;">
													<b style="font-size:24px; font-family: Arial, Helvetica, sans-serif">HÓA ĐƠN GIÁ TRỊ GIA TĂNG</b>
                        </p>
                        <p style="margin:0 auto;">
													<b style="font-size:16px; font-family: Arial, Helvetica, sans-serif">Bản thể hiện của hóa đơn điện tử</b>
												</p>
												<p style="margin:10px auto;font-size:14px;">
													<xsl:choose>
														<xsl:when test="ArisingDate!= '' and substring(ArisingDate,7,4) != '1957' ">
															<span>Ngày </span>
															<xsl:value-of select="substring(ArisingDate,1,2)"/>
															<span>  Tháng </span>
															<xsl:value-of select="substring(ArisingDate,4,2)"/>
															<span>  Năm </span>
															<xsl:value-of select="substring(ArisingDate,7,4)"/>
														</xsl:when>
														<xsl:otherwise>
															<span>Ngày</span> &#8230;
															<span>  Tháng</span> &#8230;
															<span>  Năm</span> &#8230;
														</xsl:otherwise>
													</xsl:choose>
													<br/>
													<xsl:if test="$itemCount&gt;10">
													  <label style=" display: block; color:#000000">
														<xsl:choose>
														  <xsl:when test="$pageC = 1">
															Trang <xsl:value-of select="$pageC" />/<xsl:value-of select="ceiling($itemCount div 10)" />
														  </xsl:when>
														  <xsl:when test="$pageC &gt; 1">
															Tiep theo trang truoc - Trang <xsl:value-of select="$pageC" />/<xsl:value-of select="ceiling($itemCount div 10)" />
														  </xsl:when>
														</xsl:choose>
													  </label>
													</xsl:if>
												</p>
											</div>
										</td>
										<td style="vertical-align:top;border:none;width:200px;">
											<div class="InvInfoRight" style="padding-left:25px;">
												<div class="clearfix" style="line-height:22px;padding-top:14px;">
													<span>Mẫu số</span> :
													<span><xsl:value-of select="InvoicePattern"/></span>
												</div>
												<div class="clearfix" style="line-height:22px">
													<span>Ký hiệu</span> :
													<b>
														<xsl:value-of select="SerialNo"/>
													</b>
												</div>
												<div class="clearfix" style="line-height:22px">
													<span>Số</span>:
													<b style="color:red;font-size:140%;">
														<xsl:call-template name="addZero">
															<xsl:with-param name="count" select="7-string-length(InvoiceNo)"/>
														</xsl:call-template>
														<xsl:value-of select="InvoiceNo"/>
													</b>
												</div>
											</div>
										</td>
									</tr>
                                  </table>
                                  <table cellspacing="0" cellpadding="0"  style="width:100%;" >
                                    <tr class="comInfo" style="border-top:1px solid {{cssColor}};border-bottom:1px solid {{cssColor}};">
										<td  style="border:none;padding-top:7px;padding-left:10px;">
                    {{#each company.info}}
                    <div class="clearfix vt-row">
                      <label class="fl-l title" style="margin-top:0;">
                        <span>{{this.label}} </span>
                      </label>
                      <label class="fl-l" style="margin:0;">:&#160;
                        <span {{#if this.style}} style="{{this.style}}" {{/if}}>
                        {{#if this.code}}
                        <xsl:choose>
                          <xsl:when test="{{this.code}}!=''">                            
                              <xsl:value-of select="{{this.code}}"/>                            
                          </xsl:when>
                          <xsl:otherwise>
                            &#160;
                          </xsl:otherwise>
                        </xsl:choose>
                        {{/if}}
                        {{#if this.value}}
                          {{this.value}}
                        {{/if}}
                        </span>
                      </label>
                    </div>
                    {{/each}}
										</td>
                                    </tr>
                                  </table>
                                  <table class="customerInfo" cellspacing="0" cellpadding="0"  style="">
                                    <tr>
										<td colspan="6" style=" border-left: none!important;border-right: none!important;padding-top:10px;padding-left:10px;">
                      {{#each customer.info}}
                        <div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>{{this.label}}</span> 
                        </label>
                        <label class="fl-l input-name" style="width:{{this.width}}px;margin:0;">                          
                          {{#if this.code}}
                          :&#160;
                          <span>
                          <xsl:choose>
                            <xsl:when test="{{this.code}}!=''">	
                                {{#if this.kindOfPayment}}
                                    {{> kindOfPayment}}
                                  {{else}}
                                    <xsl:value-of select="{{this.code}}"/>
                                {{/if}}
                            </xsl:when>
                            <xsl:otherwise>														
                                &#160;
                            </xsl:otherwise>
                          </xsl:choose>
                          </span>
                          {{/if}}                          
                        </label>
                        {{#if this.col-2}}
                          {{#each this.col-2}}
                          <label class="fl-l" style="margin-top:0;">
                          <span>{{this.label}}</span> 
                          </label>
                          <label class="fl-l input-name" style="width:{{this.width}}px;margin:0;">                          
                            {{#if this.code}}
                            :&#160;
                            <span>
                            <xsl:choose>
                              <xsl:when test="{{this.code}}!=''">	
                                  {{#if this.kindOfPayment}}
                                      {{> kindOfPayment}}
                                    {{else}}
                                      <xsl:value-of select="{{this.code}}"/>
                                  {{/if}}
                              </xsl:when>
                              <xsl:otherwise>														
                                  &#160;
                              </xsl:otherwise>
                            </xsl:choose>
                            </span>
                            {{/if}}                          
                          </label>
                          {{/each}}
                        {{/if}}
											</div>
                      {{/each}}											
										</td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>


                            </xsl:for-each>
                          </thead>
                          <tbody class="nenhd">
                            <tr>
                              <th style="width:27px;" >
                                <span>STT</span>
                              </th>
                              <th>
                                <span>Tên hàng hóa, dịch vụ</span>
                              </th>
                              <th style="width: 50px;">
                                <span>Đơn vị tính</span>
                              </th>
                              <th style="width: 70px;">
                                <span>Số lượng</span>
                              </th>
                              <th style="width: 115px;">
                                <span>Đơn giá</span>
                              </th>
                              <th style="width: 115px;">
                                <span>Thành tiền</span>
                              </th>
                            </tr>
                            <tr style="font-size:13px;">
                              <th class="h2" style="line-height:25px;font-weight:400;">
                                1
                              </th>
                              <th class="h2" style="font-weight:400;">
                               2
                              </th>
                              <th class="h2" style="font-weight:400;">
                               3
                              </th>
                              <th class="h2" style="font-weight:400;">
                                4
                              </th>
                              <th class="h2" style="font-weight:400;">
                                5
                              </th>
                              <th class="h2" style="font-weight:400;">
                                6 = 4 x 5
                              </th>
                            </tr>
                            <xsl:for-each select="..//../Products/Product[  ($level1Count  + 10)  >= position() and  position() >  $level1Count]">
                              <tr class="noline back">
                                <td class="back-bold2" style="text-align:center;">
                                  <div style="display: block;">
                                    <xsl:value-of select="position()"/>
                                  </div>
                                </td>
                                <td class="back-bold2"><!--Tên hàng hóa, dịch vụ-->
                                  <div style="display: block;word-wrap: break-word;text-align: left;overflow: hidden;">
                                    <xsl:value-of select="ProdName"/>
                                  </div>
                                </td>
                                <td class="back-bold2"><!--Đơn vị tính-->
                                  <div style="display: block;word-wrap: break-word;text-align: left;  overflow: hidden;">
                                    <xsl:value-of select="ProdUnit"/>
                                  </div>
                                </td>
                                <td class="back-bold2"><!--Số lượng-->
                                  <div style="display: block;word-wrap: break-word;text-align: center;  overflow: hidden;">
                                    <xsl:choose>
                                      <xsl:when test="(ProdQuantity='') or(ProdQuantity=0)">
                                        &#160;
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <!-- fix new-->
                                        <xsl:value-of select="translate(translate(translate(format-number(translate(ProdQuantity,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </div>
                                </td>
                                <td class="back-bold2"><!--Đơn giá-->
                                  <div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">
                                    <xsl:choose>
                                      <xsl:when test="(ProdPrice='') or(ProdPrice=0)">
                                        &#160;
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <!-- fix new-->
                                        <xsl:value-of select="translate(translate(translate(format-number(translate(ProdPrice,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </div>
                                </td>
                                <td class="back-bold2"><!--Thành tiền-->
                                  <div style="display: block;word-wrap: break-word;text-align: right; overflow: hidden;">
                                    <xsl:choose>
                                      <xsl:when test="(Amount=0) or(Amount='')">
                                        &#160;
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <!-- fix new-->
                                        <xsl:value-of select="translate(translate(translate(format-number(translate(Amount,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </div>
                                </td>
                              </tr>


                              <xsl:if test="(position() + $level1Count)= $itemCount">
                                <xsl:if test="($itemCount mod 10) != 0">
                                  <xsl:call-template name="addLine">
                                    <xsl:with-param name="count" select="10- ($itemCount mod 10)"/>
                                  </xsl:call-template>
                                </xsl:if>

                                <tr  class="noline back" style="border-top: 1px solid {{cssColor}};">
                                  <td class="back-bold" colspan="3" style="padding-left: 0px;text-align: right!important;border-bottom:none !important; border-right:none !important">
                                    <label style="">
                                      <span>Cộng thành tiền:</span>
                                    </label>
                                  </td>
                                  <td colspan="3" style="text-align: right; border-left:none !important">
                                    <label class="fl-l input-name" style="float: right;width:100%;">
                                      <xsl:choose>
                                        <xsl:when test="(../../Total!='' and ../../Total!=0)">
                                          <!-- fix new-->
                                          &#160;  <xsl:value-of select="translate(translate(translate(format-number(translate(../../Total,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          &#160;
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </label>
                                  </td>
                                </tr>
                                <tr class="noline back" style="border-top: 1px solid {{cssColor}}; ">
                                  <td colspan="3" style="text-align: right; border-right: 0">
                                    <label class="fl-l" style="line-height:20px; text-align:left">
                                      <span>Thuế suất GTGT:</span>
                                      <xsl:choose>
                                        <xsl:when test="../../VAT_Rate!=''">
                                        <xsl:choose>
                                          <xsl:when test="../../VAT_Rate!='-1' ">
                                          &#160; <xsl:value-of select="../../VAT_Rate"/>%
                                          </xsl:when>
                                          <xsl:otherwise>
                                          &#160;/
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        &#160; %
                                        </xsl:otherwise>
                                      </xsl:choose>                                      
                                    </label>
                                    <label class="fl-l" style="line-height:20px; float:right">
                                        <span>Tiền thuế GTGT:</span>
                                    </label>
                                  </td>
                                  <td colspan="3"  style="border-left: 0;">
                                    <label class="fl-l input-name" style="float: right!important;width:100%;">
                                      <xsl:choose>
                                        <xsl:when test="../../VAT_Amount='0'">
                                          <xsl:choose>
                                            <xsl:when test="../../VAT_Rate='-1'">
                                              &#160;/
                                            </xsl:when>
                                            <xsl:otherwise>
                                              0
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:when>

                                        <xsl:when test="../../VAT_Amount!=''">
                                          <!-- fix new-->
                                          <xsl:value-of select="translate(translate(translate(format-number(translate(../..//VAT_Amount,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          &#160;
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      
                                    </label>
                                  </td>
                                </tr>
                                <tr class="noline back" style="border-top: 1px solid {{cssColor}}; border-bottom: 1px solid {{cssColor}};">
                                  <td class="back-bold" style="text-align: left; border-right: 0" colspan="3">
                                    <label style="line-height:20px;">
                                      <span>Tổng cộng tiền thanh toán:</span>
                                    </label>
                                  </td>
                                  <td  colspan="3" style="border-left: 0;">
                                    <label class="fl-l input-name" style="float: right;width: 100%;text-align: right;">
                                      <xsl:choose>
                                        <xsl:when test="(../../Amount!='' and ../../Amount!=0)">
                                          <!-- fix new-->
                                          <xsl:value-of select="translate(translate(translate(format-number(translate(../../Amount,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          &#160;
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </label>
                                  </td>
                                </tr>
                                <tr class="noline back" style="border-top: 1px solid {{cssColor}}; border-bottom: 0">
                                  <td colspan="6" style="padding-right: 0px;padding-top: 8px;">
                                    <div class="clearfix">
                                      <label class="fl-l2">
                                        <span><i>Số tiền viết bằng chữ:</i></span>
                                      </label>
                                      <label class="fl-l input-name" style="width:660px; text-align: left;">
                                        <xsl:choose>
                                          <xsl:when test="../../Amount_words!=''">
                                            &#160;  <xsl:value-of select="../../Amount_words"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            &#160;
                                          </xsl:otherwise>
                                        </xsl:choose>
                                      </label>
                                    </div>
                                    <div class="clearfix">
                                        <label class="fl-l2" style="width: 135px"> 
                                          &#160;
                                        </label>
                                        <label class="fl-l2 input-name" style="width: 660px">
                                          &#160;
                                        </label>
                                    </div>
                                  </td>
                                </tr>
								<!--variable-->
								<xsl:variable name="serial">
									<xsl:value-of select="SerialNo"/>
								</xsl:variable>
								<xsl:variable name="pattern">
									<xsl:value-of select="InvoicePattern"/>
								</xsl:variable>
								<xsl:variable name="invno">
									<xsl:value-of select="InvoiceNo"/>
								</xsl:variable>
								<!---->
                                <tr  class="noline back" style="border-bottom: 1px solid {{cssColor}};">
                                  <td colspan="6" style="padding-top:20px;">
                                    <table style="width:100%;">
										<tr>
											<td style="border: none;width: 333px;vertical-align: top;text-align:center;color: #08086B;">
												<p style="font-size:14px; margin-top:0;margin-bottom: 0;">
													<b>
													NGƯỜI MUA HÀNG
                          </b>
												</p>
												<xsl:choose>
													<xsl:when test="/Invoice/imageClient != '' ">
														<div class="bgimg" style="background:url({/Invoice/imageClient/@URI}) no-repeat center left; height: 83px;width:295px;border:none;background-color:#DFF0D8;" onclick="showDialog('dialogClient','{$serial}','{$pattern}','{$invno}',1,'messClt','ic')">
															<p style="margin-top:3px;margin-bottom:5px;font-size:12px">
																<xsl:value-of select="/Invoice/imageClient"/>
															</p>
															<p style="font-size:12px;">
															Ký bởi:
																<xsl:value-of select="/Invoice/CNCus"/>
																<br/> Ký ngày:
																<xsl:value-of select="/Invoice/Date"/>
															</p>
														</div>
													</xsl:when>
												</xsl:choose>
											</td>
											<!--panel TVAN-->
											<td style="border: none;width: 333px;vertical-align: top;">
												<xsl:choose>
													<xsl:when test="/Invoice/convert!=''">
														<div style="text-align:center;padding-top:1px;color: #08086B;">
															<div>
																<label style="font-size:11px">
																	<b>
																		<!--<xsl:value-of select="/Invoice/convert"/>-->
																HÓA ĐƠN CHUYỂN ĐỔI TỪ HÓA ĐƠN ĐIỆN TỬ
																	</b>
																</label>
																<p style="font-size:11px; margin:0px">
																Ngày <b>
																		<xsl:value-of select="substring(/Invoice/ConvertDate,1,2)"/>
																	</b> tháng <b>
																		<xsl:value-of select="substring(/Invoice/ConvertDate,4,2)"/>
																	</b> năm <b>
																		<xsl:value-of select="concat('20',substring(/Invoice/ConvertDate,9,2))"/>
																	</b>
																</p>
																<p style="font-size:11px; margin:0px">
																Người chuyển đổi
																</p>
																<i>
																(Signature of converter)
																</i>
																<p style="margin-top:20px">
																	<xsl:value-of select="/Invoice/ConvertBy"/>
																</p>
																<!--<p style="font-size:14px; margin:0px">
															Thủ trưởng đơn vị
															</p>-->
															</div>
														</div>
													</xsl:when>
												</xsl:choose>
											</td>
											<!--panel server-->
											<td style="border: none;width: 333px;vertical-align: top;text-align:center;color: #08086B;">
												<p style="font-size:14px; margin-top:0;margin-bottom: 0;">
													<b>
													NGƯỜI BÁN HÀNG
													</b>
												</p>
												<xsl:choose>
													<xsl:when test="/Invoice/image != '' ">
														<div class="bgimg" style="background:url({/Invoice/image/@URI}) no-repeat center left; height: 83px;border:none;background-color:#DFF0D8;" onclick="showDialog('dialogServer','{$serial}','{$pattern}','{$invno}',0,'messSer','is')">
															<p style="font-size:12px;color:red;">
																Chữ ký điện tử có hiệu lực
																<br/>
																Được ký bởi:
																<br/>
																<xsl:value-of select="/Invoice/CNCom"/>
															</p>
														</div>
													</xsl:when>
												</xsl:choose>
											</td>
										</tr>
                                    </table>
                                  </td>
                                </tr>
                              </xsl:if>
                            </xsl:for-each>
                            <!-- </xsl:for-each> -->
                          </tbody>
                        </table>
                        <div class="nenhd_bg"> &#160; </div>
                      </div>
					  <div style="font-size:88%; text-align: center; margin-top: 4px;">
							<span><b>Giải pháp Hóa đơn Điện tử</b> được cung cấp bởi <b>Trung Tâm Kinh Doanh VNPT Bà Rịa- Vũng Tàu</b> - Hotline đăng ký dịch vụ 0913759468</span>
							<br/>
							<xsl:choose>
								<xsl:when test="/Invoice/Fkey !=''">
									<div style="font-size:13px; width:800px; text-align: center; margin:5px auto;">
										<span>Hóa đơn Điện tử (HĐĐT) được tra cứu trực tuyến tại https://portaltool-miennam.vnpt-invoice.com.vn.
										<br/>Mã tra cứu HĐĐT này: <b><xsl:value-of select="/Invoice/Fkey"/></b></span>
									</div>
								</xsl:when>
							</xsl:choose>
						</div>
                      <!--panel footer-->
                    </div>
                  </div>
                </div>
              </div>
            </xsl:for-each>
          </div>
          <div class="clearfix" id="bt"> &#160; </div>
        </center>
      </body>
      <!-- <script> -->
        <!-- ShowCurrentPage(); -->
      <!-- </script> -->

    </html>


  </xsl:template>

</xsl:stylesheet>