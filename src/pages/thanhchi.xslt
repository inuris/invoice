---
layout: xslt
---
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
          font-family: 'Times New Roman', Times, serif;
          font-size: 14px;
          }
		  span, i, b{
			color: #4e1d52;
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
          font-family: 'Times New Roman', Times, serif;
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
          border-bottom: 1px dotted #4e1d52;
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
          top: 440px;
          left: 270px;
          width: 300px;
		      height: 280px;
		      background-size: 100%;
          margin: 0 auto;
          position: absolute;
          opacity:0.2;
          z-index: 1;
          background-image: url('data:image/png;base64,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');
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
          border-bottom: 1px solid #4e1d52;
          border-right: 1px solid #4e1d52;
          border-left: 1px solid #4e1d52;
          border-top: 1px solid #4e1d52;
		  text-align:center;
		  padding:2px 5px;
          }
          .VATTEMP .statistics table th.h2
          {
          font-size: 100%;
          text-transform: none;
          border-bottom: 1px solid #4e1d52 !important;
          border-right: 1px solid #4e1d52 !important;
          border-left: 1px solid #4e1d52 !important;
          border-top: 1px solid #4e1d52 !important;
          color:  #4e1d52;
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
          font-family: 'Times New Roman', Times, serif;
          font-size: 100%;
          }
          <!-- .VATTEMP .statistics table .noline td -->
          <!-- { -->
          <!-- border-bottom: 1px dotted #4e1d52; -->
          <!-- border-right: 1px solid #4e1d52; -->
          <!-- border-left: 1px solid #4e1d52; -->
          <!-- border-top: 0 none; -->
          <!-- } -->
          .VATTEMP .statistics table td
          {
          border-right: 1px solid #4e1d52;
          border-left: 1px solid #4e1d52;
          //padding-top: 2px;
          padding-bottom: 2px;
          padding-right: 2px;
          padding-left: 5px;
          }
          .VATTEMP .statistics tr td.back-bold
          {
          font-size: 100%;
          border-bottom: 1px dotted #4e1d52;
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
			  border-bottom: 1px dotted #4e1d52;
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
            font-family: 'Times New Roman', Times, serif;
          }
          .fl-l2
          {
          float: left;
          color: #4e1d52;
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
		  		margin-bottom:0;
		  	}
			.comInfo .title{
		  		width:109px;
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
				//width:172px;
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
									<tr style="border-top:1px solid #4e1d52;">
										<td style="width:215px;border:none;">
                      <div style="margin:5px 0 0 20px;">                        
												<img alt="logo" style="width:106px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIgAAAB/CAIAAAC7Tx2kAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAFHGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDUgNzkuMTYzNDk5LCAyMDE4LzA4LzEzLTE2OjQwOjIyICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOSAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDE5LTA3LTAzVDA5OjQ0OjQ5KzA3OjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOS0wNy0wM1QwOTo0ODoxNyswNzowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOS0wNy0wM1QwOTo0ODoxNyswNzowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDowYWE3NGMzOC1kNTg3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"/>
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
                                    <tr class="comInfo" style="border-top:1px solid #4e1d52;border-bottom:1px solid #4e1d52;">
										<td  style="border:none;padding-top:7px;padding-left:10px;">
											<div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>Đơn vị bán hàng&#160;</span>
												</label>
												<xsl:choose>
													<xsl:when test="ComName!=''">
														<label class="fl-l" style="margin:0;font-size:17px;">
															: <span style="font-weight:bold;"> <xsl:value-of select="ComName"/> <small> - THANH CHI CORPORATION</small></span>
														</label>
													</xsl:when>
													<xsl:otherwise>
														<label class="fl-l" style="width:540px;margin:0;">&#160;</label>
													</xsl:otherwise>
												</xsl:choose>
											</div>
											<div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>Mã số thuế</span>
												</label>
												<label class="fl-l" style="margin:0;">
													: <b><xsl:value-of select="ComTaxCode"/></b>
												</label>
											</div>
											<div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>Địa chỉ</span>
												</label>
												<label class="fl-l " style="margin:0;">
													: <span><xsl:value-of select="ComAddress"/></span>
												</label>
                      </div>
                      <div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0px;">
													<span>Số tài khoản</span>
												</label>
												<label class="fl-l " style="margin:0;">
													: <span>76010000050926 tại Ngân hàng BIDV - CN Vũng Tàu</span>
												</label>
                      </div>
                      <div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0px;">
													<span></span>
												</label>
												<label class="fl-l " style="margin:0;">
													&#160;&#160;<span>76610000101279 tại Ngân hàng BIDV - CN Vũng Tàu - Côn Đảo</span>
												</label>
											</div>
											<div class="clearfix vt-row" style="margin-top:0;">
												<label class="fl-l title" style="margin-top:0;">
													<span>Điện thoại</span>
												</label>
												<label class="fl-l" style="margin:0;">
													:<span> 0254.3582575</span>
												</label>
												<label class="fl-l" style="margin-top:0;">
													<span>&#160; * &#160;Fax</span>
												</label>
												<label class="fl-l" style="margin:0;">
													:<span> 0254.3582574</span>
												</label>
											</div>
											
										</td>
                                    </tr>
                                  </table>
                                  <table class="customerInfo" cellspacing="0" cellpadding="0"  style="">
                                    <tr>
										<td colspan="6" style=" border-left: none!important;border-right: none!important;padding-top:10px;padding-left:10px;">
											<div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>Họ tên người mua hàng : </span> 
                        </label>
                        <label class="fl-l input-name" style="width:655px;margin:0;">
												<xsl:choose>
													<xsl:when test="Buyer!=''">		
															<xsl:value-of select="Buyer"/>	
													</xsl:when>
													<xsl:otherwise>														
															&#160;
													</xsl:otherwise>
                        </xsl:choose>
                      </label>
											</div>
											<div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>Tên đơn vị : </span>
                        </label>
                        <label class="fl-l input-name" style="width:725px;margin:0;">
												<xsl:choose>
													<xsl:when test="CusName!=''">			
															<xsl:value-of select="CusName"/>
													</xsl:when>
													<xsl:otherwise>														
															&#160;
													</xsl:otherwise>
                        </xsl:choose>
                      </label>
											</div>
											<div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>Mã số thuế : </span>
												</label>
												<label class="fl-l input-name" style="width:725px;margin:0;">
													<xsl:choose>
														<xsl:when test="CusTaxCode!=''">							
															<xsl:value-of select="CusTaxCode"/>
														</xsl:when>
														<xsl:otherwise>
															&#160;
														</xsl:otherwise>
													</xsl:choose>
												</label>
											</div>
											<div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>Địa chỉ : </span>
												</label>
												<label class="fl-l input-name" style="width:745px;margin:0;">
													<xsl:choose>
														<xsl:when test="CusAddress!=''">								
															<xsl:value-of select="CusAddress"/>
														</xsl:when>
														<xsl:otherwise>
															&#160;
														</xsl:otherwise>
													</xsl:choose>
												</label>
											</div>
											<div class="clearfix vt-row">
												<label class="fl-l title" style="margin-top:0;">
													<span>Hình thức thanh toán : </span>
												</label>
												<label class="fl-l input-name" style="width:668px;margin:0;">
													<xsl:choose>
														<xsl:when test="Kind_of_Payment!=''">
															<xsl:choose>
																<xsl:when test="Kind_of_Payment='TM'">
																	Tiền mặt
																</xsl:when>
																<xsl:when test="Kind_of_Payment='CK'">
																	Chuyển khoản
																</xsl:when>
																<xsl:when test="Kind_of_Payment='TTD'">
																	Thẻ tín dụng
																</xsl:when>
																<xsl:when test="Kind_of_Payment='HDDT'">
																	Hóa đơn điện tử
																</xsl:when>
																<xsl:when test="Kind_of_Payment='BT'">
																	Bù trừ
																</xsl:when>
																<xsl:when test="Kind_of_Payment='TM, CK'">
																	Tiền mặt/ Chuyển khoản
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="Kind_of_Payment"/>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:when>
														<xsl:otherwise>
															&#160;							
														</xsl:otherwise>
													</xsl:choose>
												</label>												
											</div>
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

                                <tr  class="noline back" style="border-top: 1px solid #4e1d52;">
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
                                <tr class="noline back" style="border-top: 1px solid #4e1d52; ">
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
                                <tr class="noline back" style="border-top: 1px solid #4e1d52; border-bottom: 1px solid #4e1d52;">
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
                                <tr class="noline back" style="border-top: 1px solid #4e1d52; border-bottom: 0">
                                  <td colspan="6" style="padding-right: 0px;padding-top: 8px;">
                                    <div class="clearfix">
                                      <label class="fl-l2">
                                        <span><i>Số tiền viết bằng chữ:</i></span>
                                      </label>
                                      <label class="fl-l input-name" style="width:677px; text-align: left;">
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
                                        <label class="fl-l2" style="width: 120px"> 
                                          &#160;
                                        </label>
                                        <label class="fl-l2 input-name" style="width: 680px">
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
                                <tr  class="noline back" style="border-bottom: 1px solid #4e1d52;">
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