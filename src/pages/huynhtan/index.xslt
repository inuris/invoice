---
layout: xslt
comPhone: 
comAccount: 
comBank: 
cssFontFamily: Arial
cssColor: "#2e3192"
company:
  style: &style "color:#111; "
  info:
  - code: ComName
    style: "font-weight: bold; font-size: 20px;"
  - label: Mã số thuế
    code: ComTaxCode
    style: *style
    valueStyle: "font-weight: bold; letter-spacing: 2px; color:#111"
  - label: Địa chỉ
    code: ComAddress
    style: *style
  - label: Điện thoại
    value: "0254.358 4968 - 358 4969"
    style: *style
  - label: Số tài khoản
    value: 118000017244 tại Ngân hàng TMCP Công Thương Việt Nam - CN Bà Rịa - Vũng Tàu  
    style: *style
  - label: Email
    value: "huynhtanhuan@yahoo.com.vn  /  Website: www.huynhtan.com.vn"
    style: *style
customer:
  input: true
  width: 160  
  info:
  - label: Họ tên người mua hàng
    width: 700
    code: Buyer
    input: true
  - label: Tên đơn vị
    width: 772
    code: CusName
    input: true
  - label: Mã số thuế
    width: 770
    code: CusTaxCode
    input: true
  - label: Địa chỉ
    width: 792
    code: CusAddress
    input: true
  - width: 837
    input: true
  - label: Hình thức thanh toán
    width: 200
    code: Kind_of_Payment
    isPayment: true
    input: true
    col-2:
      - label: Số tài khoản
        width: 440
        code: CusBankNo
        input: true
---
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns="http://www.w3.org/1999/xhtml" xmlns:js="urn:custom-javascript" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" version="1.0" exclude-result-prefixes="msxsl js">
	<xsl:variable name="itemsPerPage">
		<xsl:value-of select="10"/>
	</xsl:variable>
	<xsl:variable name="itemCount">
		<xsl:value-of select="count(Invoice//Content//Products//Product)"/>
	</xsl:variable>
	<xsl:variable name="pagesNeeded">
		<xsl:choose>
			<xsl:when test="$itemCount &lt;= $itemsPerPage">
				<xsl:value-of select="1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$itemCount mod $itemsPerPage = 0">
						<xsl:value-of select="$itemCount div $itemsPerPage"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ceiling($itemCount div $itemsPerPage)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:template name="addZero">
		<xsl:param name="count"/>
		<xsl:if test="$count &gt; 0">
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
		<xsl:if test="$val1&gt;0">
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
		<xsl:if test="$count &gt; 0">
			<tr class="noline back">
				<td class="back-bold">
					<xsl:value-of select="''"/>
				</td>
				<td class="back-bold">
					<xsl:value-of select="''"/>
				</td>
				<td class="back-bold">
					<xsl:value-of select="''"/>
				</td>
				<td class="back-bold">
					<xsl:value-of select="''"/>
				</td>
				<td class="back-bold">
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
	<xsl:template name="findSpaceChar">
		<xsl:param name="str"/>
		<xsl:variable name="strLength">
			<xsl:value-of select="string-length($str)"/>
		</xsl:variable>
		<xsl:if test="$strLength &gt; 0">
			<xsl:choose>
				<xsl:when test="substring($str, $strLength) != ' '">
					<xsl:call-template name="findSpaceChar">
						<xsl:with-param name="str" select="substring($str, 1, $strLength - 1)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$strLength"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="tempAmount_words">
		<xsl:param name="str"/>
		<xsl:variable name="strLength">
			<xsl:value-of select="string-length($str)"/>
		</xsl:variable>
		<xsl:variable name="row1Length">
			<xsl:value-of select="88"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$strLength &gt; $row1Length">
				<xsl:variable name="str0">
					<xsl:value-of select="substring($str, 1, $row1Length)"/>
				</xsl:variable>
				<xsl:variable name="spaceCharPosition">
					<xsl:call-template name="findSpaceChar">
						<xsl:with-param name="str" select="$str0"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="str1">
					<xsl:value-of select="substring($str0, 1, $spaceCharPosition)"/>
				</xsl:variable>
				<xsl:variable name="str2">
					<xsl:value-of select="substring($str, $spaceCharPosition + 1)"/>
				</xsl:variable>
				<div class="clearfix">
					<label class="fl-l" style="font-weight:normal; padding-left:10px;">
						<span>Số tiền viết bằng chữ : </span>
					</label>
					<label class="fl-l input-name" style="width:712px;height:17px;min-width: 100px;display: block;">
						<xsl:value-of select="$str1"/>
					</label>
				</div>
				<div class="clearfix" style="padding-bottom:5px;">
					<label class="fl-l input-name" style="width:842px;height:17px;min-width: 100px;display: block;margin-left:10px;">
						<xsl:value-of select="$str2"/>
					</label>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="clearfix">
					<label class="fl-l" style="font-weight:normal;padding-left:10px;padding-top:6px;">
						<span>Số tiền viết bằng chữ : </span>
					</label>
					<label class="fl-l input-name" style="width:712px;height:17px;min-width: 100px;display: block;padding-top:6px;">
						<xsl:value-of select="$str"/>
					</label>
				</div>
				<div class="clearfix" style="padding-bottom:5px;">
					<label class="fl-l input-name" style="width:842px;height:17px;min-width: 100px;display: block;margin-left:10px;"/>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:variable name="countExtra1">
		<xsl:choose>
			<xsl:when test="Extra2!=''">
				<xsl:value-of select="count(Extra1)"/>
			</xsl:when>
			<xsl:otherwise>
					 0
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="countExtra2">
		<xsl:choose>
			<xsl:when test="Extra2!=''">
				<xsl:value-of select="count(Extra2)"/>
			</xsl:when>
			<xsl:otherwise>
					 0
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="counttyGia">
		<xsl:choose>
			<xsl:when test="../../ExchangeRate!=''">
				<xsl:value-of select="count(../../ExchangeRate)"/>
			</xsl:when>
			<xsl:otherwise>
					 0
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:template name="main">
		<xsl:param name="pagesNeededfnc"/>
		<xsl:param name="itemCountfnc"/>
		<xsl:param name="itemNeeded"/>
		<xsl:for-each select="Products//Product">
			<xsl:choose>
				<!-- Vị trí dòng product đầu mỗi trang -->
				<xsl:when test=" position() mod $itemNeeded = 1">
					<xsl:choose>
						<!-- Dòng product đầu tiên của trang đầu -->
						<xsl:when test="position()=1">
							<xsl:text disable-output-escaping="yes">&lt;div class="pagecurrent" id="1"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="VATBound" style="border: 1px solid {{cssColor}};margin: 0 auto;width:860px;" &gt;</xsl:text>
							<xsl:call-template name="addfirtbody">
							</xsl:call-template>
							<xsl:call-template name="addsecondbody">
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;div class="statistics"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="nenhd" style="width:800px; margin-bottom:5px"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;table class="productTable"   width="860px" cellpadding="0" cellspacing="0" style="border: 0; border-top: 1px solid {{cssColor}};border-bottom: 1px solid {{cssColor}};margin-top: 10px;padding-bottom: 5px;margin: 0 auto;position:relative;z-index:2;"&gt;</xsl:text>
							<xsl:call-template name="calltitleproduct">
							</xsl:call-template>
							<xsl:call-template name="callbodyproduct">
							</xsl:call-template>
							<!-- Trường hợp chỉ có 1 sản phẩm product -->
							<xsl:if test="(position()=1) and $itemCountfnc=1">
								<xsl:call-template name="addchuky">
								</xsl:call-template>
								<xsl:call-template name="addLine">
									<xsl:with-param name="count" select="$pagesNeededfnc * $itemNeeded - $itemCountfnc - $countExtra1 -$countExtra2 - $counttyGia"/>
								</xsl:call-template>
								<xsl:call-template name="calltongsoproduct">
								</xsl:call-template>
								<xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;div class="nenhd_bg" style="margin-top: -6px; margin-left: -26px"&gt;&lt;/div&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
								<xsl:call-template name="addfinalbody">
								</xsl:call-template>
								<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
								<xsl:call-template name="add_vnpt_introduction"/>
							</xsl:if>
						</xsl:when>
						<!-- Dòng product đầu của các trang sau -->
						<xsl:otherwise>
							<xsl:text disable-output-escaping="yes">&lt;div class="pagecurrent" id=</xsl:text>
							<xsl:value-of select="((position()-1) div $itemNeeded) + 1"/>
							<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="VATBound" style="border: 1px solid {{cssColor}};margin: 0 auto;width:860px;" &gt;</xsl:text>
							<xsl:call-template name="addfirtbody">
							</xsl:call-template>
							<!--  <div style="margin-left: 318px; margin-top: 8px">
					 <label>Tiếp theo trang trước - trang</label>
					 <xsl:value-of select="((position()-1) div $itemNeeded) + 1"/>/<xsl:value-of select="$pagesNeededfnc"/>
				  </div> -->
							<xsl:call-template name="addsecondbody">
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;div class="statistics"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="nenhd" style="width:800px;margin-bottom:5px"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;table class="productTable"   width="860px" cellpadding="0" cellspacing="0" style="border: 0; border-top: 1px solid {{cssColor}};border-bottom: 1px solid {{cssColor}};margin-top: 10px;padding-bottom: 5px;margin: 0 auto;position:relative;z-index:2;"&gt;</xsl:text>
							<xsl:call-template name="calltitleproduct">
							</xsl:call-template>
							<xsl:call-template name="callbodyproduct">
							</xsl:call-template>
							<!-- Trường hợp dòng product cuối cùng là dòng đầu tiên của trang cuối cùng -->
							<xsl:if test=" position() = $itemCountfnc">
								<xsl:call-template name="addchuky">
								</xsl:call-template>
								<xsl:call-template name="addLine">
									<xsl:with-param name="count" select="$pagesNeededfnc * $itemNeeded - $itemCountfnc - $countExtra1 -$countExtra2 - $counttyGia"/>
								</xsl:call-template>
								<xsl:call-template name="calltongsoproduct">
								</xsl:call-template>
								<xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;div class="nenhd_bg" style=" margin-left: -26px"&gt;&lt;/div&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
								<xsl:call-template name="addfinalbody">
								</xsl:call-template>
								<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<!-- Vị trí dòng product cuối cùng mỗi trang, không phải trang cuối -->
				<xsl:when test=" (position() mod $itemNeeded = 0) and (position() &lt; $itemCountfnc)">
					<xsl:call-template name="callbodyproduct">
					</xsl:call-template>
					<xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;div class="nenhd_bg" style="margin-top: -6px; margin-left: -26px"&gt;&lt;/div&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					<p style="page-break-before: always"/>
				</xsl:when>
				<!-- Vị trí dòng sản phẩm cuối cùng -->
				<xsl:when test=" position() = $itemCountfnc">
					<xsl:call-template name="callbodyproduct">
					</xsl:call-template>
					<xsl:call-template name="addchuky">
					</xsl:call-template>
					<xsl:call-template name="addLine">
						<xsl:with-param name="count" select="$pagesNeededfnc * $itemNeeded - $itemCountfnc - $countExtra1 -$countExtra2 - $counttyGia"/>
					</xsl:call-template>
					<xsl:call-template name="calltongsoproduct">
					</xsl:call-template>
					<xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;div class="nenhd_bg" style="margin-top: -6px; margin-left: -26px"&gt;&lt;/div&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					<xsl:call-template name="addfinalbody">
					</xsl:call-template>
					<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
				</xsl:when>
				<!-- Các vị trí dòng sản phẩm ở khoảng giữa một trang -->
				<xsl:otherwise>
					<xsl:call-template name="callbodyproduct">
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="addfirtbody">
		<table class="headerInfo" style="width:100%;">
			<tr class="comInfo" style="">
				<td>
					<div style="width:240px;">
						<img alt="logo" style="width:100%;height:100%;" src="data:image/png;base64,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"/>
					</div>
				</td>
				<td colspan="2" style="padding-top:7px;border-bottom:1px solid {{cssColor}};">
					{{>info info=company}}
				</td>
			</tr>
		</table>
		<table style="width:100%;">
			<tr style="">
				<td style="vertical-align:top;width:210px;">
					&#160;
				</td>
				<td style="vertical-align:top;width:411px;">
					<p style="margin:10px auto;font-size:14px;text-align:center;line-height:30px;">
						<b style="font-size:22px;font-family:Times New Roman;">HÓA ĐƠN GIÁ TRỊ GIA TĂNG </b>
						<br/>
						<xsl:choose>
							<xsl:when test="../../ArisingDate!= '' and substring(../../ArisingDate,7,4)!= '1957'">
								<span>Ngày </span>
								<xsl:value-of select="substring(../../ArisingDate,1,2)"/>
								<span>  tháng </span>
								<xsl:value-of select="substring(../../ArisingDate,4,2)"/>
								<span>  năm </span>
								<xsl:value-of select="substring(../../ArisingDate,7,4)"/>
							</xsl:when>
							<xsl:otherwise>
								<span>Ngày </span> &#8230;
								<span>  tháng </span> &#8230;
								<span>  năm </span> &#8230;
							</xsl:otherwise>
						</xsl:choose>
					</p>
				</td>
				<td style="vertical-align:top;padding-left:24px;">
					<div class="InvInfoRight" style="">
						<div class="clearfix" style="line-height:22px; padding-top:10px;">
							<span>Mẫu số </span> :
							<b><xsl:value-of select="../../InvoicePattern"/></b>
						</div>
						<div class="clearfix" style="line-height:22px">
							<span>Ký hiệu </span> :
							<b>
								<xsl:value-of select="../../SerialNo"/>
							</b>
						</div>
						<div class="clearfix" style="line-height:22px">
							<span>Số </span>:
							<b style="color:red;font-size:140%;">
								<xsl:call-template name="addZero">
									<xsl:with-param name="count" select="7-string-length(../../InvoiceNo)"/>
								</xsl:call-template>
								<xsl:value-of select="../../InvoiceNo"/>
							</b>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="addsecondbody">
		<table class="customerInfo" style="">
			<tr>
				<td>
					{{>info info=customer}}
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="calltitleproduct">
		<tr class="productTableHeader" style="">
			<td style="width:27px;">
				<b class="title">STT</b>
			</td>
			<td style="">
				<b class="title">Tên hàng hóa, dịch vụ</b>
			</td>
			<td style="width:70px;">
				<b class="title" style="line-height:13px;">Đơn vị tính</b>
			</td>
			<td style="width:70px;">
				<b class="title">Số lượng</b>
			</td>
			<td style="width:115px;">
				<b class="title">Đơn giá</b>
			</td>
			<td style="width:170px;">
				<b class="title">Thành tiền</b>
			</td>
		</tr>
		<tr class="productInfoHeader" style="text-align:center;">
			<td style="font-weight:bold;line-height:25px;"><span>1</span></td>
			<td style="font-weight:bold;"><span>2</span></td>
			<td style="font-weight:bold;"><span>3</span></td>
			<td style="font-weight:bold;"><span>4</span></td>
			<td style="font-weight:bold;"><span>5</span></td>
			<td style="font-weight:bold;"><span>6 = 4 x 5</span></td>
		</tr>
	</xsl:template>
	<xsl:template name="callbodyproduct">
		<tr class="noline back productTableContent">
			<td class="back-bold">
				<div style="display: block ;word-wrap: break-word;text-align: center;  overflow: hidden;">
					<xsl:value-of select="position()"/>
				</div>
			</td>
			<td class="back-bold">
				<div style="text-align: left;display: block; word-wrap: break-word; overflow: hidden; float: left; padding-left: 2px">
					<xsl:value-of select="ProdName"/>
				</div>
			</td>
			<td class="back-bold">
				<div style="display: block;word-wrap: break-word;text-align: center;  overflow: hidden;">
					<xsl:choose>
						<xsl:when test="(ProdUnit=0) or(ProdUnit='')">
						 
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ProdUnit"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
			<td class="back-bold">
				<div style="display: block;word-wrap: break-word;text-align: center;  overflow: hidden;">
					<xsl:choose>
						<xsl:when test="ProdQuantity=0">
						 
						</xsl:when>
						<xsl:when test="ProdQuantity=''">
						 
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="translate(translate(translate(format-number(ProdQuantity, '###,###.00'),',','?'),'.',','),'?','.')" />
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
			<td class="back-bold">
				<div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">
					<xsl:choose>
						<xsl:when test="(ProdPrice='') or(ProdPrice=0)">
						 	&#160;
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="translate(translate(translate(format-number(ProdPrice, '###,###'),',','?'),'.',','),'?','.')"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
			<td class="back-bold">
				<div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">
					<xsl:choose>
						<xsl:when test="Amount=''">
						 
						</xsl:when>
						<xsl:when test="Amount=0">
						 
						</xsl:when>
						<xsl:when test="Amount='-1'">
						 
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="translate(translate(translate(format-number(Amount, '###,###'),',','?'),'.',','),'?','.')"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="calltongsoproduct">
		<tr class="bg-pink" style="">
			<td colspan="5" style="border-top:1px solid {{cssColor}};border-bottom:1px solid {{cssColor}};border-left:none !important;text-align:left; text-align:right;padding-right:10px;">
				<span class="hoang_so_le">Cộng tiền hàng : </span>
			</td>
			<td align="right" style="border-top:1px solid {{cssColor}};border-bottom: 1px solid {{cssColor}};border-left:1px white !important;">
				<b>
					<xsl:choose>
						<xsl:when test="(../../Total='') or (../../Total=0)">
							<label class="input-name summary" style="height:20px;display: block;margin-right:5px;border-bottom: none;color: black;">
								0
							</label>
						</xsl:when>
						<xsl:otherwise>
							<label class="input-name summary" style="height:20px;display: block;margin-right:5px;border-bottom: none;color: black;">
								<xsl:value-of select="translate(translate(translate(format-number(../../Total, '###,###'),',','?'),'.',','),'?','.')"/>
							</label>
						</xsl:otherwise>
					</xsl:choose>
				</b>
			</td>
		</tr>
		<tr class="bg-pink" style="border-bottom:1px solid {{cssColor}};">
			<td colspan="2" style="border-top:none!important;border-bottom:none!important;border-right:none!important; text-align:left; padding-left:10px;">
				<span>Thuế suất GTGT : </span>
				<xsl:choose>
					<xsl:when test="../../VAT_Rate='-1'">
						<label class="input-name"> \ %</label>
					</xsl:when>
					<xsl:when test="../../VAT_Rate!=''">
						<label class="input-name" style="width:40px;height:20px;padding-top:0px;font-size:15px;border-bottom: none;">
						 <xsl:value-of select="../../VAT_Rate"/> %
						</label>
					</xsl:when>
					<xsl:otherwise>
						<label class="input-name" style="width:45px;height:20px;padding-top:0px;border-bottom: none;">&#160;&#160;
						</label>%
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td colspan="3" style="border-top:1px white !important;border-left:none!important;border-bottom:1px white;text-align:right;padding-right:10px;line-height:0px;">
				<span>Tiền thuế GTGT : </span>  
			</td>
			<td align="right" style="border-top:none!important;border-bottom:none!important;border-left:1px white !important;">
				<b>
					<xsl:choose>
						<xsl:when test="../../VAT_Rate='-1'">
							<label class="input-name summary" style="height:20px;display: block;margin-right:0px;color: black;border-bottom: none;">\</label>
						</xsl:when>
						<xsl:when test="../../VAT_Amount=''">
							<label class="input-name summary" style="height:20px;display: block;margin-right:0px;border-bottom: none;">
								<xsl:value-of select="''"/>
							</label>
						</xsl:when>
						<xsl:when test="../../VAT_Amount=0">
							<label class="input-name summary" style="height:20px;display: block;margin-right:5px;color: black;border-bottom: none;">
								0
							</label>
						</xsl:when>
						<xsl:otherwise>
							<label class="input-name summary" style="height:20px;display: block;margin-right:5px;color: black;border-bottom: none;">
								<xsl:value-of select="translate(translate(translate(format-number(../../VAT_Amount, '###,###'),',','?'),'.',','),'?','.')"/>
							</label>
						</xsl:otherwise>
					</xsl:choose>
				</b>
			</td>
		</tr>
		<tr class="bg-pink">
			<td colspan="5" style="border-top:none!important;border-bottom:1px solid {{cssColor}};border-left:none;text-align:right;padding-right:10px;">
				<span class="hoang_so_le">Tổng cộng tiền thanh toán : </span>
			</td>
			<td align="right" style="color: #31373E;border-top:none!important;border-bottom:1px solid {{cssColor}};border-left:1px white !important;">
				<b>
					<xsl:choose>
						<xsl:when test="(../../Amount='') or (../../Amount=0)">
							<label class="input-name summary" style="height:20px;display: block;margin-right:5px;border-bottom: none;color:#2e3192;">
								0
							</label>
						</xsl:when>
						<xsl:otherwise>
							<label class="input-name summary" style="height:20px;display: block;margin-right:5px;color:black;border-bottom: none;">
								<xsl:value-of select="translate(translate(translate(format-number(../../Amount, '###,###'),',','?'),'.',','),'?','.')"/>
							</label>
						</xsl:otherwise>
					</xsl:choose>
				</b>
			</td>
		</tr>
		<tr>
			<td colspan="6">				
				<xsl:variable name="input" select="../../Amount_words"/>
				
				<xsl:call-template name="tempAmount_words">
					<xsl:with-param name="str" select="translate($input,',',' ')"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="addchuky">
		<xsl:choose>
			<xsl:when test="../../Extra1 != ''">
				<tr>
					<td class="back-bold">
						<div style="display: block;word-wrap: break-word;width: 30px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold">
						<div style="text-align: left; width: 310px; display: block; word-wrap: break-word; overflow: hidden; float: left; padding-left: 2px">
							<xsl:value-of select="../../Extra1"/>
						</div>
					</td>
					<td class="back-bold">
						<div style="display: block;word-wrap: break-word;width: 70px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold">
						<div style="display: block;word-wrap: break-word;width:130px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold">
						<div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold">
						<div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">

						</div>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>

			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="../../Extra2 != ''">
				<tr>
					<td class="back-bold" style="height: 20px;border-bottom: 1px dotted #00348d;border-top: 0px solid #2e3192;">
						<div style="display: block;word-wrap: break-word;width: 30px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px;border-bottom: 1px dotted #00348d;border-top: 0px solid #2e3192;">
						<div style="text-align: left; width: 310px; display: block; word-wrap: break-word; overflow: hidden; float: left; padding-left: 2px">
							<xsl:value-of select="../../Extra2"/>
						</div>
					</td>
					<td class="back-bold" style="height: 20px; border-bottom: 1px dotted #00348d;border-top: 0px solid #2e3192;">
						<div style="display: block;word-wrap: break-word;width: 70px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px; border-bottom-color: currentColor;border-bottom: 1px dotted #00348d;border-top: 0px solid #2e3192;">
						<div style="display: block;word-wrap: break-word;width:130px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px; border-bottom: 1px dotted #00348d;border-top: 0px solid #2e3192;">
						<div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px;border-bottom: 1px dotted #00348d;border-top: 0px solid #2e3192;">
						<div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">

						</div>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="addfinalbody">
		<div class="clearfix">
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
			<center>
				<table style="height: 83px; border-bottom: medium none; border-left: medium none; border-top: medium none; border-right: medium none;">
					<tr>
						<!--panel client-->
						<td style="border: none;width: 333px;vertical-align: top;text-align:center;">
							<p style="font-size:14px; margin-top:0;height: 20px;margin-bottom: 0;">
								<b>
								Người mua hàng
								</b>
							</p>
							<xsl:choose>
								<xsl:when test="/Invoice/imageClient != '' ">
									<div class="bgimg" style="background:url({/Invoice/imageClient/@URI}) no-repeat center left; height: 70px;width:295px;background-color:#DFF0D8;border:none;" onclick="showDialog('dialogClient','{$serial}','{$pattern}','{$invno}',1,'messClt','ic')">
										<p style="font-size:12px;color:red;margin:1px;">
											Chữ ký điện tử có hiệu lực<br />
											Được ký bởi:<br />
											<xsl:value-of select="../../ComName"/>
										</p>
									</div>
								</xsl:when>
							</xsl:choose>
						</td>
						<!--panel TVAN-->
						<td style="border: none;width: 333px;vertical-align: top;">
							<xsl:choose>
								<xsl:when test="/Invoice/convert!=''">
									<div style="text-align:center;padding-top:1px;">
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
						<td style="border: none;width: 333px;vertical-align: top;text-align:center;">
							<p style="font-size:14px; margin-top:0;height: 20px;margin-bottom: 0;">
								<b>
								Người bán hàng
								</b>
							</p>
							<xsl:choose>
								<xsl:when test="/Invoice/image != '' ">
									<div class="bgimg" style="background:url({/Invoice/image/@URI}) no-repeat center left; height: 70px;width:295px;border:none;background-color:#DFF0D8;float:right;" onclick="showDialog('dialogServer','{$serial}','{$pattern}','{$invno}',0,'messSer','is')">
										<p style="font-size:12px;text-align:left;margin:0px;line-height:18px;">
											Chữ ký điện tử có hiệu lực<br />
											Được ký bởi:<br />
											<xsl:value-of select="../../ComName"/>
										</p>
									</div>
								</xsl:when>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</center>
			<!--dialog server-->
			<div id="dialogServer" style="background-color:white;display:none">
				<xsl:variable name="sc">
					<xsl:value-of select="//*[contains(@Id,'serSig')]//*[local-name() = 'X509Certificate']"/>
				</xsl:variable>
				<div style="color:blue" id="messSer">Unknown!</div>
				<br/>
				<br/>
				<a href="#" onclick="displayCert('{$sc}')">
					<div style="color:#184D4E">Xem thông tin chứng thư</div>
				</a>
			</div>
			<!--dialog TVAN-->
			<!---->
			<!--dialog client-->
			<div id="dialogClient" style="background-color:white;display:none">
				<xsl:variable name="sc1">
					<xsl:value-of select="//*[contains(@Id,'cltSig')]//*[local-name() = 'X509Certificate']"/>
				</xsl:variable>
				<div style="color:blue" id="messClt">Unknown!</div>
				<br/>
				<br/>
				<a href="#" onclick="displayCert('{$sc1}')">
					<div style="color:#184D4E">Xem thông tin chứng thư</div>
				</a>
			</div>
			<!---->
			<div class="clearfix"/>
			<!--panel replace-->
			<xsl:choose>
				<xsl:when test="/Invoice/TvanData/Content/isReplace!=''">
					<div style="text-align:center;padding-top:0px;font-size:14px;text-transform:uppercase">
						<xsl:value-of select="//Invoice/TvanData/Content/isReplace"/>
					</div>
				</xsl:when>
				<xsl:when test="isReplace!=''">
					<div style="text-align:center;padding-top:0px;font-size:14px;text-transform:uppercase">
						<xsl:value-of select="isReplace"/>
					</div>
				</xsl:when>
				<xsl:when test="/Invoice/Content/isReplace!=''">
					<div style="text-align:center;padding-top:0px;font-size:14px;text-transform:uppercase">
						<xsl:value-of select="//Invoice/Content/isReplace"/>
					</div>
				</xsl:when>
				<xsl:when test="isReplace!=''">
					<div style="text-align:center;padding-top:0px;font-size:14px;text-transform:uppercase">
						<xsl:value-of select="isReplace"/>
					</div>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="/Invoice/Content/isAdjust!=''">
					<div style="text-align:center;padding-top:0px;font-size:14px;text-transform:uppercase">
						<xsl:value-of select="//Invoice/Content/isAdjust"/>
					</div>
				</xsl:when>
				<xsl:when test="isAdjust!=''">
					<div style="text-align:center;padding-top:0px;font-size:14px;text-transform:uppercase">
						<xsl:value-of select="isAdjust"/>
					</div>
				</xsl:when>
				<xsl:when test="/Invoice/TvanData/Content/isAdjust!=''">
					<div style="text-align:center;padding-top:0px;font-size:14px;text-transform:uppercase">
						<xsl:value-of select="//Invoice/TvanData/Content/isAdjust"/>
					</div>
				</xsl:when>
				<xsl:when test="isAdjust!=''">
					<div style="text-align:center;padding-top:0px;font-size:14px;text-transform:uppercase">
						<xsl:value-of select="isAdjust"/>
					</div>
				</xsl:when>
			</xsl:choose>
			<!---->
			<!--panel convert-->
			<!---->

		</div>
	</xsl:template>
	<xsl:template name="add_vnpt_introduction">
		<div style="font-size:13px;text-align: center; margin:0px auto;">
			<b style="color:black;">Giải pháp Hóa đơn Điện tử</b> được cung cấp bởi <b style="color:black;">Trung Tâm Kinh Doanh VNPT Bà Rịa- Vũng Tàu</b> - Hotline đăng ký dịch vụ: 0913759468
		</div>
		<xsl:choose>
			<xsl:when test="/Invoice/Fkey !=''">
				<div style="font-size:13px;text-align: center; margin:5px auto;">
					Hóa đơn Điện tử (HĐĐT) được tra cứu trực tuyến tại https://portaltool-miennam.vnpt-invoice.com.vn/.
					<br/>Mã tra cứu HĐĐT này: <b style="color:black;"><xsl:value-of select="/Invoice/Fkey"/></b>
				</div>
			</xsl:when>
		</xsl:choose>
		<div style="margin:0px auto; margin-top:2px; ">
			<div class="clearfix" id="bt" style="margin:0px auto;"/>
		</div>
	</xsl:template>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
				<title>VAT</title>
				<style type="text/css" rel="stylesheet">		  	
			@charset "utf-8";
			#main{margin:0 auto}
		  	* html,body {
		  	margin: 0px auto;
		  	padding: 0;
		  	height: 100%;
		  	}
		  	span, i, b{
		  		color: #2e3192;
		  	}
		  	i{
				font-size: 85%;
		  	}		  	
		  	table {
				border-collapse: collapse
		  	}
		  	#main {
		  	margin: 0 auto
		  	}
		  	.VATTEMP {
		  	background-color: #fff;
		  	font: 78%/1.4em Times New Roman;
		  	font-size: 14px;
		  	margin: 0px auto;
		  	}

		  	.VATTEMP .header-main,
		  	.content {
		  	width: 790px
		  	}
		  	.VATTEMP .header {
		  	float: right;
		  	width: 600px;
		  	font-family: Times New Roman
		  	}
		  	.VATTEMP .header-content {
		  	float: left;
		  	text-align: center;
		  	width: 375px;
		  	font-family: Times New Roman
		  	}
		  	.VATTEMP .header-content2 {
		  	float: left;
		  	text-align: left;
		  	width: 610px;
		  	font-family: Times New Roman
		  	}
		  	.VATTEMP .header h2 {
		  	font-size: 22px;
		  	font-family: Times New Roman
		  	}
		  	.VATTEMP .header h2,
		  	.header p {
		  	margin: 0;
		  	font-family: Times New Roman
		  	}
		  	.VATTEMP .header p.name-upcase {
		  	font-size: 14px;
		  	text-transform: uppercase;
		  	font-family: Times New Roman
		  	}
		  	.VATTEMP .header-note {
		  	float: right;
		  	font-size: 14px;
		  	width: 200px;
		  	margin-top: 0;
		  	font-family: Times New Roman
		  	}
		  	.VATTEMP .header .number {
		  	font-family: "Times New Roman", Times, serif;
		  	font-size: 22px
		  	}
		  	.clearfix:after {
		  	clear: both;
		  	content: ".";
		  	display: block;
		  	height: 1px;
		  	overflow: hidden;
		  	visibility: hidden
		  	}
		  	.clearfix {
		  	clear: both
		  	}
		  	.VATTEMP .input-code {
		  	border: 1px solid {{cssColor}};
		  	color: #2e3192;
		  	float: left;
		  	font-weight: normal;
		  	text-align: center;
		  	width: 18px;
		  	height: 14px
		  	}
		  	.VATTEMP div label.fl-l,
		  	div label {
		  	margin-right: 5px;
		  	}
		  	.VATTEMP .input-name,
		  	.input-date {
		  	border: 0;
		  	border-bottom: 1px dotted {{cssColor}};
		  	}
		  	.VATTEMP .statistics {
		  	clear: both
		  	}
		  	.nenhd {
		  	position: relative;
		  	}
		  	.nenhd_bg {
			background-size: 100%;
		  	width: 500px;
		  	height: 234px;
		  	top: 100px;
		  	left: 210px;
			  position: absolute;
		  	z-index: 1;
		  	margin: 0;
		  	opacity:0.2;
		  	background: url('data:image/png;base64,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') no-repeat;
		  	}

		  	.VATTEMP .payment,
		  	.date {
		  	text-align: center;
		  	width: 35%
		  	}
		  	.VATTEMP .payment {
		  	float: left
		  	}
		  	.VATTEMP .payment p,
		  	.date p {
		  	margin: 0
		  	}
		  	.VATTEMP .date {
		  	float: right
		  	}
		  	.VATTEMP .input-date {
		  	width: 40px;
		  	color: #101011 !important;
		  	}
		  	.fl-l {
		  	float: left;
		  	}
		  	.fl-r {
		  	float: right
		  	}
		  	.VATTEMP div label.fl-r,
		  	div label {
		  	margin-right: 0px;
		  	margin-top: 0px;
		  	margin-bottom: 1px;
		  	font-size: 14px;
		  	}
		  	.bgimg {
		  	border: 1px solid {{cssColor}};
		  	cursor: pointer;
		  	margin-bottom:5px;
		  	}
		  	.bgimg p {
		  	color: #f00;
		  	padding-left: 5px;
		  	text-align: left
		  	}
		  	p {
		  	font-size: 14px
		  	}
		  	#SolutionVNPT{
		  	margin-bottom:5px;
		  	font-size:12px;
		  	border-bottom:1px dashed;
		  	text-align: center;width: auto;
		  	width: 1010px;
		  	}

			/* ================ */
		  	/* Header Info*/

		  	.headerInfo{
		  	border-bottom:none!important;
		  	}
		  	.headerInfo p {
		  		margin:0 0 5px 0;
		  		padding:0;
		  	}

			/* ================ */
		  	/* Title*/
		  	.InvInfoLeft{
		  	text-align:center;
		  	margin:15px 0px 0px 0px;
		  	}

		  	/* ================ */
		  	/* Form, Serial, No. */

		  	.InvInfoRight{
		  	text-align:left;
		  	padding-bottom:10px;
		  	}
			.InvInfoRight span{
			font-size: 14px;
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
			.customerInfo .vt-row{
			  margin-bottom: 6px;
			}
			.customerInfo .title{
				//width: 158px;
			}

			/* ================ */
		  	/* Product Table*/

		  	.productTable {
		  	background-position: bottom;
		  	border: 1px solid {{cssColor}};
		  	font-size: 14px;
		  	margin: 0;
		  	height: 300px;
		  	position: relative;
		  	z-index: 2
		  	}
		  	.productTable th {
		  	font-size: 14px;
		  	text-transform: uppercase;
		  	height: 60px;
		  	}
		  	.productTable td.stt {
		  	text-align: center
		  	}
		  	.productTable .back td {
		  	font-family: "Times New Roman", Times, serif;
		  	font-size: 14px
		  	}
		  	.productTable .noline td {
		  	border-bottom: 1 none
		  	}
		  	.productTable td {
		  	border-bottom: 1px solid {{cssColor}};
		  	border-right: 1px solid {{cssColor}};
		  	padding: 0px;
		  	}
		  	.productTable td:last-child{
		  		border-right:0;
		  	}
		  	.productTable tr td.back-bold {
		  	font-size: 14px;
		  	padding-right: 5px;
		  	padding-left: 5px;
		  	text-align: right;
		  	border-bottom: 1px dotted {{cssColor}};
		  	border-top: 0px solid {{cssColor}};
		  	height: 30px;
		  	}
		  	.productTable tr.bg-pink{
		  	height: 32px;
		  	}
		  	.productTable tr.bg-pink td {
		  	font-size: 14px;
		  	text-align: right;
		  	}


			.productTableHeader{
				height:40px;
			}
		  	.productTableHeader td{
		  		text-align:center;
		  		padding:2px 5px;
		  	}
		  	.productTableHeader td:last-child{
		  		border-right:0;
		  	}
		  	.productTableHeader .title{
		  	}
		  	.productTableHeader .subtitle{
				font-style:italic;
				font-size:13px;
		  	}
			/* ================ */
		  	/* Company Info*/
		  	.comInfo label{
		  		font-size:13px;
		  	}
			.comInfo td{
		  		padding-left: 7px;          
		  	}
			.comInfo .vt-row{        
		  		margin-bottom:0;
		  	}
			.comInfo .title{
		  		//width:80px;
		  	}
			.pagecurrent{
				margin:0px auto !important;
				background-size: 100% !important;
				padding-top:27px;
				width: 870px;
				height: 1125px;
			}
			.english-font{
				//font-size: 88% !important; 
				font-style: italic;
			}
			.VATBound{
			background-size: 100%;
		  	background: url('') repeat;
			}
				</style>
			</head>
			<body style="height: auto;">
				<div id="printView" style="position: relative;">
					<xsl:choose>
						<xsl:when test="/Invoice/Invcancel!=''">
							<img style="position: absolute;left: 0px;top: 0px;width: 100%;height: 94%;z-index: 2;" width="100%" height="900px" src="data:image/png;base64,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"/>
						</xsl:when>
					</xsl:choose>
					<xsl:for-each select="Invoice//Content">
						<div class="VATTEMP">
							<div id="quantitypages" style="padding-left:auto;padding-right:auto;">
								<xsl:call-template name="main">
									<xsl:with-param name="pagesNeededfnc" select="$pagesNeeded"/>
									<xsl:with-param name="itemCountfnc" select="count(Products//Product)"/>
									<xsl:with-param name="itemNeeded" select="$itemsPerPage"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>