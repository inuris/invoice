---
layout: xslt
comPhone: 
comAccount: 
comBank: 
cssFontFamily: Arial
cssColor: "#0c323e"
company:
  info:
  - code: ComName
    style: "font-weight: bold; font-size: 17px;"
  - label: Mã số thuế
    code: ComTaxCode
    style: "font-weight: bold; letter-spacing: 2px"
  - label: Địa chỉ
    code: ComAddress
  - label: Điện thoại
    value: "0254.358 4968 - 358 4969  /  Fax : 0254.358 4967"  
  - label: Số tài khoản
    value: 118000017244 tại Ngân hàng TMCP Công Thương Việt Nam - CN Bà Rịa - Vũng Tàu  
  - label: Email
    value: "huynhtanhuan@yahoo.com.vn  /  Website: www.huynhtan.com.vn"
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
					<label class="fl-l input-name" style="width:698px;height:17px;min-width: 100px;display: block;">
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
					<label class="fl-l input-name" style="width:698px;height:17px;min-width: 100px;display: block;padding-top:6px;">
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
							<xsl:text disable-output-escaping="yes">&lt;div class="VATBound" style="border: 1px solid;margin: 0 auto;width:860px;" &gt;</xsl:text>
							<xsl:call-template name="addfirtbody">
							</xsl:call-template>
							<xsl:call-template name="addsecondbody">
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;div class="statistics"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="nenhd" style="width:800px; margin-bottom:5px"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;table class="productTable"   width="860px" cellpadding="0" cellspacing="0" style="border: 0; border-top: 1px solid;border-bottom: 1px solid;margin-top: 10px;padding-bottom: 5px;margin: 0 auto;position:relative;z-index:2;"&gt;</xsl:text>
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
							<xsl:text disable-output-escaping="yes">&lt;div class="VATBound" style="border: 1px solid;margin: 0 auto;width:860px;" &gt;</xsl:text>
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
							<xsl:text disable-output-escaping="yes">&lt;table class="productTable"   width="860px" cellpadding="0" cellspacing="0" style="border: 0; border-top: 1px solid;border-bottom: 1px solid ;margin-top: 10px;padding-bottom: 5px;margin: 0 auto;position:relative;z-index:2;"&gt;</xsl:text>
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
				<td style="border-bottom:1px solid;">
					<div style="width:120px;height:81px;">
						<img alt="logo" style="width:100%;height:100%;" src=""/>
					</div>
				</td>
				<td colspan="2" style="padding-top:7px;border-bottom:1px solid;">
					{{>comInfo company=company}}
				</td>
			</tr>
		</table>
		<table style="width:100%;">
			<tr style="border-bottom:1px solid;">
				<td style="vertical-align:top;width:210px;">
					&#160;
				</td>
				<td style="vertical-align:top;width:411px;">
					<p style="margin:10px auto;font-size:14px;text-align:center;line-height:30px;">
						<b style="font-size:22px;font-family:Times New Roman;color:red;">HÓA ĐƠN GIÁ TRỊ GIA TĂNG </b>
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
					<div class="clearfix vt-row">
						<label class="fl-l" style="margin-top:0;">
							<span>Họ tên người mua hàng : </span>
						</label>
						<label class="fl-l input-name" style="width:686px;margin:0;">
							<xsl:choose>
								<xsl:when test="../../Buyer!=''">							
									<xsl:value-of select="../../Buyer"/>
								</xsl:when>
								<xsl:otherwise>
								&#160;
								</xsl:otherwise>
							</xsl:choose>
						</label>
					</div>
					<div class="clearfix vt-row">
						<label class="fl-l" style="margin-top:0;">
							<span>Tên đơn vị : </span>
						</label>
						<label class="fl-l input-name" style="width:768px;margin:0;">
							<xsl:choose>
								<xsl:when test="../../CusName!=''">							
									<xsl:value-of select="../../CusName"/>
								</xsl:when>
								<xsl:otherwise>
								&#160;
								</xsl:otherwise>
							</xsl:choose>
						</label>
					</div>
					<div class="clearfix vt-row">
						<label class="fl-l" style="margin-top:0;">
							<span>Mã số thuế : </span>
						</label>
						<label class="fl-l input-name" style="width:765px;margin:0;">
							<xsl:choose>
								<xsl:when test="../../CusTaxCode!=''">							
									<xsl:value-of select="../../CusTaxCode"/>
								</xsl:when>
								<xsl:otherwise>
								&#160;
								</xsl:otherwise>
							</xsl:choose>
						</label>
					</div>
					<div class="clearfix vt-row">
						<label class="fl-l" style="margin-top:0;">
							<span>Địa chỉ : </span>
						</label>
						<label class="fl-l input-name" style="width:792px;margin:0;">
							<xsl:choose>
								<xsl:when test="../../CusAddress!=''">								
									<xsl:value-of select="../../CusAddress"/>
								</xsl:when>
								<xsl:otherwise>
								&#160;
								</xsl:otherwise>
							</xsl:choose>
						</label>
					</div>
					<div class="clearfix vt-row">
						<label class="fl-l" style="margin-top:0;">
							<span>Hình thức thanh toán : </span>
						</label>
						<label class="fl-l input-name" style="width:235px;margin:0;">
							<xsl:choose>
								<xsl:when test="../../Kind_of_Payment!=''">
									<xsl:choose>
										<xsl:when test="../../Kind_of_Payment='TM'">
										Tiền mặt
										</xsl:when>
										<xsl:when test="../../Kind_of_Payment='CK'">
										Chuyển khoản
										</xsl:when>
										<xsl:when test="../../Kind_of_Payment='TTD'">
										Thẻ tín dụng
										</xsl:when>
										<xsl:when test="../../Kind_of_Payment='HDDT'">
										Hóa đơn điện tử
										</xsl:when>
										<xsl:when test="../../Kind_of_Payment='BT'">
										Bù trừ
										</xsl:when>
										<xsl:when test="../../Kind_of_Payment='TM, CK'">
										Tiền mặt/ Chuyển khoản
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="../../Kind_of_Payment"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
								&#160;							
								</xsl:otherwise>
							</xsl:choose>
						</label>
						<label class="fl-l" style="margin-top:0;">
							<span>Số tài khoản : </span>
						</label>
						<label class="fl-l input-name" style="width:375px;margin:0;">
							<xsl:choose>
								<xsl:when test="../../CusBankNo!=''">								
									<xsl:value-of select="../../CusBankNo"/>
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
			<td style="font-weight:bold;line-height:25px;">1</td>
			<td style="font-weight:bold;">2</td>
			<td style="font-weight:bold;">3</td>
			<td style="font-weight:bold;">4</td>
			<td style="font-weight:bold;">5</td>
			<td style="font-weight:bold;">6 = 4 x 5</td>
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
			<td colspan="5" style="border-top:1px solid;border-bottom:1px solid;border-left:none !important;text-align:left; text-align:right;padding-right:10px;">
				<span class="hoang_so_le">Cộng tiền hàng : </span>
			</td>
			<td align="right" style="border-top:1px solid;border-bottom: 1px solid;border-left:1px white !important;">
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
		<tr class="bg-pink" style="border-bottom:1px solid;">
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
			<td colspan="5" style="border-top:none!important;border-bottom:1px solid ;border-left:none;text-align:right;padding-right:10px;">
				<span class="hoang_so_le">Tổng cộng tiền thanh toán : </span>
			</td>
			<td align="right" style="color: #31373E;border-top:none!important;border-bottom:1px solid;border-left:1px white !important;">
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
											Chữ ký điện tử có hiệu lực
											<br/>
											Được ký bởi:
											<br/>
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
											Chữ ký điện tử có hiệu lực
											<br/>
											Được ký bởi:
											<br/>
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
		  	font: 78%/1.4em Sans-serif,Times New Roman;
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
		  	border: 1px solid #2e3192;
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
		  	border-bottom: 1px dotted black;
		  	}
		  	.VATTEMP .statistics {
		  	clear: both
		  	}
		  	.nenhd {
		  	position: relative;
		  	}
		  	.nenhd_bg {
			background-size: 100%;
		  	width: 600px;
		  	height: 255px;
		  	top: 100px;
		  	left: 140px;
			position: absolute;
		  	z-index: 1;
		  	margin: 0;
		  	opacity:0.4;
		  	background: url('data:image/jpeg;base64,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') no-repeat;
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
		  	border: 1px solid #2e3192;
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
			margin-bottom: 2px;
			}
			.customerInfo .title{
				//width: 158px;
			}

			/* ================ */
		  	/* Product Table*/

		  	.productTable {
		  	background-position: bottom;
		  	border: 1 1 1 1 solid #2e3192;
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
		  	border-bottom: 1px solid;
		  	border-right: 1px solid;
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
		  	border-bottom: 1px dotted;
		  	border-top: 0px solid;
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
							<img style="position: absolute;left: 0px;top: 0px;width: 100%;height: 94%;z-index: 2;" width="100%" height="900px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA4QAAAOECAMAAADOkA8JAAAAY1BMVEVHcEz/AAD/AAD+AAD/AAD/AAD+AAD/AAD+AAD/AAD+AAD/AAD/AAD+AAD+AAD/AAD/AAD/AAD/AAD+AAD/AAD/AAD+AAD/AAD+AAD/AAD/AAD/AAD+AAD/AAD+AAD/AAD/AAADq+BvAAAAIHRSTlMACgX88Bf+AfcP6axW1+AfMmLOtzsob6GNS8B6x4SXRBjjj18AABQKSURBVHhe7dzbUhtJGoXRRDL5g8EG2RyNObz/U06MBZHR0z1twEK7pFrrsmeio6nKT1tCQu2yBQCHX57+69N5+xytEDTYnqIVggbbU09WCBpsT09b3kLg8Nu6wYu2jjC2haDBdYTJLQQNtq/RCkGD7WybFQLHo8HtVwjUaLBlKwQ7mK4Q7GC+QrCDf6/wvH0w0GA/Gg0GKgQ7OBpMVQgazFYIGgxUCBz/XDf4+Lo/rkgADbZ29qvCHqgQNJjeQtBgfgtBg/ktBA22ClQIGgxsIWhwK1sIHP8YDba3buFF+0PAwXODt+/5SsQeqBA0GNhC0GCgQtBgoELQYLRC0OD7v6A0ADSYrRA0mK8QNDgqPHpjhcDB91/xLEeDgQpBg0enm/yaxADQ4PjS7qPHFgAabPVS4ae3VQgaXJ62DUluIWhwPCPtr6kQWGyqwfwWggaH92whaDC3haDB9FfVgAb3rULQ4Kjwtv0OaDBQIbA4GQ3GKgQN9tFgokKwg6tW0QpBg8MeVQgaHI5/JCoEDQ4H0QpBg62eK1yOCgfQYGoLQYN9NLi1Ck8b0Go0mK0QNJitEDQYqXA5KgQNJirs864QFtdPv6yyXyg1W1DXmR1cKxWuocHlVVuzhRnYwUCD+QpBg/kKQYP5CkGDKkSDk/l6qa5CNBiucLlqc4MGn0aDE6iwb6dC0KAthHoYDaoQNKhCNDjDr9jIQ4P9riWpEDt416amxlfdgAYzghWCBlWIBlUIGhwVPu1nhRBt0BZC3YwGd6DCqwYazCgVosFpVLjcrwrhucH7lmUL0aA/OQYNqhANTl8tkhWCBm0hGsyr8RUcOw7qfjToi3ACIN5gfgtBg7YQDd7s9lcz3jXQYIQK0WDeusKuQjToD5Ej0GBeva9C0KAthLvnBqsFqBBqEg2qEDv4kGxQhWiwjwb3pML7BnYwWmFXIRoMsYVoME+FaDCsblSIBqPq9xWCBm0hXCUb9HU5UIEGIxXeNLCD0Qr7lCtEg/062qAtxA6GGlQhXPXRoApBg/5cGQ3OoMLADwsaVCEaVCFocFT4oEI0qEJoq1yD+Qp7vEKodYP9pFqQLcQOnpQ/2wINqhANzkyp8Bc0aAvR4KIlqBBWy6k0qEI0qMLreVeIBlWIBlXYZ1ohGvTFHmiQqm1XCHX6lwbZdoUwhQZViB3s36MNel2IHdSgP23+B2hQhWhQhSfzrhANqhANqrDve4Vo0BaiwYP2GypctL2DBv2hM5we/bZBqsIVokE+qkK4nUCDthA72H9EG/S6EDuoQRWiQX/0vCvQoArRoArzHy5Cgyrs76sQNGgL0aAtBA3aQjToT7/g8bnB4/Ye1Gb+8AQN/nxng1S8QjRItkI0iArRoArRICpEgypEgyrcqbdb0aAK4WLd4Ldkg74eBA32zTaowldsIdhBFaJBH4aHi08f0yCLcIVokJpKhWhQhanLiwa5ncQbsGhQhf3fK0SDh21GbCEatIWgQVuIBlUIdf6rwf4l06A/UoF1g09baZBKV4gGeQx/QBcN8pj4czE0iC1EgypEg6gQDaoQDeJLDAbOP+capKZSIRq0hYcNDaJCNOiD87OlwbOWQ823Quoy2iC2kOcGv8Yb5GLObxPZwf7SICrEDqqwq1CDc2QL0SAq1CAqRIP4KL0GUSEapPa+QjRoC9EgKuTy6ysaRIVoUIUfeIvQICrU4GWbMM739mU7dbZLDaqw71+FTKFBVGgH++dog3hGagdDDWILecsO4kMV2EEW4QrRIPUnFaJBVIgGvS5Eg9hCNGgL0SAqpA73o0EV7uwN5OzLFBpEhRo8bwmokMM/bxAVYge5nMQLe+ygCpc7ViG14QaxhdhBFfbdq1CD/VO0QXzowg7uS4NUhStEg4QrRIOoUIN4XYgGUaEGUSEaVOHOvP2rwYuWgAo5/PaBDaJCNIgKNYgK0SCHU62Q47k0yNkkfwVObatBVIgdpOJ/qoYGVTjRLdTg0UwapKa5hRrsGrSF2EFUuHUaxIf1Of45hQbxcX0NPrZ9hwo1iArRICrUICpEg/jjGQ2iQjSICjWICjn4MRpEhbkPbGjwtkE7nPVH+DWIDxBrEKpeKnxsGRqEcIUahOct7LOtUIPYQg3Ch28hGsQWahAfo+Lg+9N/LaMNokINHp22SUOFGkSFt+3jaHC57QZRIRpEhRpEhSx2pUFUqEE4nvnbyRpEhRqEAxVqEBVqEBVu6qMdLE5m3yAq1CAq1GDPXkhUaAdXrdqbocINPo3S4M5ChRrER477rlWoQXzwHw2iQg2iQmrdYNcgKtwEDaJCDaLCPtMKNYg/AtAg1EuFrzxSLK6fftnYBYM3VUitG+xXbcNQYX9DhRpc7lGD2EI7CCrUID6EpUE4CFeoQVjsxJtfGkSFGnza9wZRoQZR4dOocCDaILaQephVg9hCDWIL//GwafCufTiok//30UgN9q00CJXcQjsIKtQgPhiiQajFvCvUILZQg1A+ovVCg/igZFTdaBBbGKNBbGHeNBrEFt7NvcH7FgLxCjUI1zP7yKQGsYUaBG9VaxAVahBUWPfRBkGFGkSFU2iw3zRQYXIHJ9ggKryfa4OgQg1CuEINQmXfONMg1CwqrLtog2ALXxqsBirUYAg+UJlv8GH6DaLCmz1usL+mQVChHUSFGgQVZhsEb2drEBWWBvcBKtQgqPDqnQ2CCjWICh9qbxq8rraDUGF/qP1osM+yQWyhHQS/Urzq720QVKhBqFGhBsEWahAVzrNBUKEGUeE7jrIGQYWr/WkQ7nbwIye1brCfaBBbGN3BjTQIPvqlQaidqVCDqFCD4BnparlucNE2Dbztlm8QVKhBVHhSc24QVKhBVNj7P1eoQbCFp3NpEBX2SR7zmkWDsOrJg24HoWpUOMkG+3cNosLoDmoQFc6oQfC6UIOoUIPgTXENosLpNHjQZgYV5sdHg6hwma0w3yDYwtOjmTeICnuuwnyDYAtvkw2CtwZq3WD/MdcGocYvRZI7ON8GoUaF6QbBFmowBEaF4QZBhekGQYXpBkGFsQZBhSOJGTQIKnz83waB0/HRla01+PO4DaDCMU7ZBkGF8QZBhRqE8Mep0w2CCjMNAvVS4XGoQWBUmGkQuP3ATOoi2iCo8LnBbxp8BVTYR4WbbbAHGgRbmN1BUKEGIf9LzItPr28QqFFhuEGwhbEGQYUjm51uEFQ4GjxsbwYq7KPCVINgC9MNggp3tEFQ4WjwiwYh8jGXOv/VYP/TBkGF74zoPLqDoEINQtvgm3yZBoEaFYYbBBWGGgRGhZEGgfFmX7RBUGF/fVLnnwMNgi0MNAi2MNAg2MJEg8D5qHC6DYIKR4NnbbOAek2Fdfmrwf410yDYwnWDT5kGQYUVaBBUmNhBUOFZukFQYaZBYLwFEWoQOB+xBRsEFfaRW6pBsIXpBsEWphsEWxhoEPhbdpdft90gUKPCRINAjQpfGrxsEeAZ6edsg+AZabhBsIX5BkGFnzMNAmcvEZ61AODsa/rpKGgwXiFo8HP2LQrQ4OXl1+QvZ0CDLx9bW4YqBA22ltxC0OCosEcqBA3+9R98PKAO/ze5qrPtbSFw9uXvs1db30LQ4HkbWm2rQuBwNPhX26gQqNFgy1YIdjBbIWgwVyFo8NP5795APG8fBjTYR4P5CsEO5isEDeYrBA3mKwQNDmfj/xoAGkxXCBpsNX6NGgAaXFe4uS0EDr+tk7por1SBLQQN5rcQNJivEDQ4bKJCoI5Hg++t8KK9GzAabNkKwQ5mKwQ7mK0QNJirEDR4tA4oUyFosB9dZN7iGMAOZisEDQYqBI5/rht8bBtwOIIOAA2+VNgDFYIG146jWwgarHqp8LFtEWhwiFYIGhwV9kCFoMG1wBaCBt+6hcDxj9Fg2/oWAgfPDd62D/HaLQQNpp/sggb3s0LQ4KjwtgWABgMVggbzFYIG8xWCBvMVggaHg1SFoMHxwRwVDnDw/VcSy9tk9qDBo9Pw+IIGt6l+VTjmFzwXPc28EB3xgwZVGACL0WC2QtBgtkLQYLTCpQrRYPYlaVchGkxWaAvRYFJFKgQN2kJYnKSPfr5C0KAK0eCqDfkKuwrRYP4FKmgwol4qXDXQYIYK0eA0Kuwq3Ao0aAvRYM8cdRVCjQaNNGjwfx2oEA3u75Nl0KAKoa6TB1yFsFg3+LTaiV/fPu1thdjBq1YtxhaiweVVy7KF2MFh8lt41UCDGXUyZhs0mFDRLQQN2kI06D9689Dg024d51psokLQoC2EetjRBluNhw/Q4E6POGjQFqLBuxZkC9FgHw3aQrCD79zCuwYaDLkOzDlo0BaiQT8KOLgq3GXUzT4d21IhGtylLQQNqhCeG7z3Ihc0uPkK7xtoMEKFaDAvWiFo0Baiwbya/I8H98lDqkKoeIP5CsEOesKNBm/m8bL3poEGVRiEBvMVdhUGoEFbiAanVyFo0A8Mdfd8JKvNRd1P6UeGQIN5f60QNKhCNPhQbWbuxw8OGgxW2OdZIRq0haBBFaJBFwAcwZrvJUCDLgLUVfT4qRA0qEI0qEKaBq+r0e5SFwMN9nHsVLjVywFXfTz0YwvRoKcGaJDKvkhGg1S8QjTIR1cIGnRpcNBcHKjVK46ZCk+qfRCYQoO2EA320AO9LYTVrhwwFaJBFeafLqBBW7hoGwWr6NFyqWC1fO3BorIVokEqXCEaxBaiQRWiQfamQjTossFp8jCpEOpPG1Th9w1cOuxg9iCpEA329x0jVjO+fNhBW4gGUSEadBFxfKh6uYwHLQIN8t4KYc5HR4Vo0MWE06PMsVEhaFCFaFCFcPthDarwx+8vKtS6wb7p46LCt11W7OCmDwunsQuLBlEhGlQhGsTlxSFxgXFEqJrKJUaDLvJxi0CDvGzhz79VCI/beYjm/1QIj9s9Girsc7zUaNAWokFUiAZViAZxyXEgXHQcB+r5sn9LXXY0iAqfcbF+0yp0FFTo0nMRejjGFqJBFaJBVMjFp+QRwMMgGlQhGqReKjxsGWiQfIVo0K1QoRuPmzEBbjtuB266G/Ile0PQoFvS51Ih58mHXWwhNZ8GbSF2EFuIBlWIBnFzcJu9XEeDuEG4xW4RbjBuEuefX317USEaVOFZmzUNokI06GZ93csKNbhDt9XtWu5ThVwmG8QWUusG++7cUs7365ZxmXxYxRZSO9cgbpsdRIVokFLhoEHcPNxGz0jRIG4gbqFbOGNuIG4ibp/beNl2DpdfUw2iQjSoQjSICjW4f7fN7fy8Q7eTs31sUIV9Zyqksg2iQs6iT15wUznbtwdNbKGHTNxY7CBV4QrxcIkKBw2iQjToBs+aW4RbjBvkJp+3KUGDKkSDqJA6jDaICjn7Em0QFdrBLzO6LRxOr0Lm2aAnPp+yNxw7qMIeqxA7yGF0C9EgVYfZLcRDIjWZG894QESF2EHcfLcBtx83IcABuGhbhAZRoQZRIRpEhS4+DgKH32Z46XEUXHgcBlx2HAcXHQeCOv7HS44Kj7Z0JPhbg3AcrdAOQj0fi3702KLsIB6ct1WhBvvUnnZgCz31h/AWahD2fws1iC3k+Oe/Ngjb2UINusA4JC4vjsnUubg4KC4tjspt+2NoEBVqEBWiQVSoQVTIwY83NgjHPzZYIQdvvJzg2LiYODguJdTz0Vmmj44GcXhOGxpEhRpEhTOmQVSoQRyiZbZCDeIY9fdUyMH3zTWIg/T+CjX4Z5cOalSIBrGFLhuO04y5aDhQLhmOVH/lkWKxbw3igV2DsJjIFmoQB2vVkjSIo9WnWqEGsYVoEBVqEBWyONnCL7BwxH5boQu0rw2iQpcH6uXpVuqYaRAmUqEGcdSeJnLUNIgtRIPYQg1iC6nMJUGFVy1Dg1DTqFCDOHbLVIUahLqObqEGoRYqXKtrDWILkxbXsSfmMJEt9FCEA/gUOoAahBoVahBsoQaTsIUaxBbeaRDCR/FOg3OFLfRyGMIVahDqYXYV1sOUGoQaFWoQbKEGUaEfFhxMPyoqzPGDosJ7DabA+nj2ew1+GLCF024Q6uYDK7SDoMK6mXqDUPEKNQh7XOFuNYgKb+b98AIq1CAq7DcaBFuYaRBUqEG4z1aoQaiXCqvtgftdbhBbWBoEFSafWoMKNYgKH2rWDYIKNYgKe6xCDcJddAs1CFU7XeFdskGwhXUX/fUuqDDbIKjwbvxSCVToP3ojUOF1aTAKFfbr0iDYwkiDYAs1CFfRLdQgVL2mQg2CLayraIOgwr1uEK76qFCDoMLYWIMKNYgKT2rWDxGgQg2iwh6vUIPYwoUGQ2CVrVCDUNkKNQj1lwo1CLawVtEGQYWr6Nsm4Lczq8SbJnmwWo4KZ7yDoEINosLvCw2moUIvTaNQYR8V5p4Sgy3MNggq1GAInI4KNRgAVS8VHmgwA0IV1mm0QVDhaBBoo8LwDoIK078OAhWmGwQVZhsEFf44iDYIKuw/DkINAqdHYwujDYIK0y8+QYWhBoHbUWGiQaA+uMLTo39tEKhRYbhBsIXHH/CvjjYIKhwjC7wmlp/HHxF3f22DoMI+KkztINjCdIOgwnSDoMJQg8DjqDDbIKgw0yBQo8Jog2ALv/1hhY9/1iCosI8KU09rwRamGwQVphsEFYYaBC5GhdkGQYWZBoF6qfAw1CAwKsw0CFx8ekeFF8kGQYV1Md7oDwAVjl/nbBaoMNsgqPDL4fQbBBVefPqwBkGFfVSYahBsYbpBUGGoQeB8VLipNzPeAKgaFUYaBEaFoQaBUeHkGgQVjjcxEkCF43/YClDhWbpBUGGoQeD886/gvp5lGwQVfjlLNwi2MNogqLB/PUs3CLYw3iDYws+RBoHL5y1skQaBqucKW6hB4LnClm0QVPgfPAnyvt7gS2sAAAAASUVORK5CYII="/>
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