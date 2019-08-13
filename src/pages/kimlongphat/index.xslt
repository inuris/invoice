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
						<span>Số tiền viết bằng chữ: </span>
					</label>
					<label class="fl-l input-name" style="width:645px;height:17px;min-width: 100px;display: block;">
						<xsl:value-of select="$str1"/>
					</label>
				</div>
				<div class="clearfix" style="padding-bottom:5px;">
					<label class="fl-l input-name" style="width:789px;height:17px;min-width: 100px;display: block;margin-left:10px;">
						<xsl:value-of select="$str2"/>
					</label>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="clearfix">
					<label class="fl-l" style="font-weight:normal;padding-left:10px;padding-top:6px;">
						<span>Số tiền viết bằng chữ: </span>
					</label>
					<label class="fl-l input-name" style="width:645px;height:17px;min-width: 100px;display: block;padding-top:6px;">
						<xsl:value-of select="$str"/>
					</label>
				</div>
				<div class="clearfix" style="padding-bottom:5px;">
					<label class="fl-l input-name" style="width:789px;height:17px;min-width: 100px;display: block;margin-left:10px;"/>
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
							<xsl:text disable-output-escaping="yes">&lt;div class="VATBound" style="border: 1px solid #005cb3;margin: 0 auto;width:810px;" &gt;</xsl:text>
							<xsl:call-template name="addfirtbody">
							</xsl:call-template>
							<xsl:call-template name="addsecondbody">
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;div class="statistics"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="nenhd" style="width:800px; margin-bottom:5px"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;table class="productTable"   width="810px" cellpadding="0" cellspacing="0" style="border: 0; border-top: 1px solid #005cb3;border-bottom: 1px solid #005cb3;margin-top: 10px;padding-bottom: 5px;margin: 0 auto;position:relative;z-index:2;"&gt;</xsl:text>
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
							<xsl:text disable-output-escaping="yes">&lt;div class="VATBound" style="border: 2px solid #005cb3;margin: 0 auto;width:810px;" &gt;</xsl:text>
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
							<xsl:text disable-output-escaping="yes">&lt;table class="productTable"   width="810px" cellpadding="0" cellspacing="0" style="border: 0; border-top: 1px solid #005cb3;border-bottom: 1px solid #005cb3;margin-top: 10px;padding-bottom: 5px;margin: 0 auto;position:relative;z-index:2;"&gt;</xsl:text>
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
								<xsl:call-template name="add_vnpt_introduction"/>
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
					<xsl:call-template name="add_vnpt_introduction"/>
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
			<tr style="border-bottom:1px solid #005cb3;">
				<td style="padding-bottom:7px;width:150px;">
				</td>
				<td style="vertical-align:top">
					<div class="InvInfoLeft" style="width:466px;">
						<p style="margin:0 auto;">
							<b style="font-size:27px;">HÓA ĐƠN GIÁ TRỊ GIA TĂNG</b>
						</p>
						<p style="margin:10px auto;font-size:14px;">
							<xsl:choose>
								<xsl:when test="../../ArisingDate!= '' and substring(../../ArisingDate,7,4) != '1957' ">
									<span>Ngày </span>
									<xsl:value-of select="substring(../../ArisingDate,1,2)"/>
									<span>  Tháng </span>
									<xsl:value-of select="substring(../../ArisingDate,4,2)"/>
									<span>  Năm </span>
									<xsl:value-of select="substring(../../ArisingDate,7,4)"/>
								</xsl:when>
								<xsl:otherwise>
									<span>Ngày</span> &#8230;
									<span>  Tháng</span> &#8230;
									<span>  Năm</span> &#8230;
								</xsl:otherwise>
							</xsl:choose>
						</p>
					</div>
				</td>
				<td style="vertical-align:top;">
					<div class="InvInfoRight" style="">
						<div class="clearfix" style="line-height:22px; padding-top:10px;">
							<span>Mẫu số</span> :
							<span><xsl:value-of select="../../InvoicePattern"/></span>
						</div>
						<div class="clearfix" style="line-height:22px">
							<span>Ký hiệu</span> :
							<b>
								<xsl:value-of select="../../SerialNo"/>
							</b>
						</div>
						<div class="clearfix" style="line-height:22px">
							<span>Số</span>:
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
			<tr class="comInfo" style="border-bottom:1px solid #005cb3;">
				<td colspan="3" style="padding-top:7px;">
					{{>info data=kimlongphat.comInfo}}					
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="addsecondbody">
		<table class="customerInfo" style="">
			<tr>
				<td>
					{{>info data=kimlongphat.cusInfo}}	
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
			<td style="width:45px;">
				<b class="title">ĐVT</b>
			</td>
			<td style="width:70px;">
				<b class="title">Số lượng</b>
			</td>
			<td style="width:115px;">
				<b class="title">Đơn giá</b>
			</td>
			<td style="width:115px;">
				<b class="title">Thành Tiền</b>
			</td>
		</tr>
		<tr class="productInfoHeader" style="font-size:16px; text-align:center;color: #005cb3;">
			<td style="font-weight:normal;line-height:25px;">1</td>
			<td style="font-weight:normal;">2</td>
			<td style="font-weight:normal;">3</td>
			<td style="font-weight:normal;">4</td>
			<td style="font-weight:normal;">5</td>
			<td style="font-weight:normal;">6 = 4 x 5</td>
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
							<xsl:choose>
								<xsl:when test="../../SoVT = '1'">
									<xsl:value-of select="format-number(ProdQuantity, '###,##0.00')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="format-number(translate(ProdQuantity,',','.'), '###,##0.##')"/>
								</xsl:otherwise>
							</xsl:choose>
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
			<td colspan="5" style="border-top:1px solid #005cb3;border-bottom:1px solid #005cb3;border-left:none !important;text-align:left; text-align:right;padding-right:10px;">
				<span class="hoang_so_le">Cộng tiền hàng: </span>
			</td>
			<td align="right" style="border-top:1px solid #005cb3;border-bottom:1px solid #005cb3;border-left:none;">
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
		<tr class="bg-pink" style="border-bottom:1px solid #005cb3;">
			<td colspan="2" style="border-top:none!important;border-bottom:none!important;border-right:none!important; text-align:left; padding-left:10px;">
				<span>Thuế suất GTGT: </span>
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
						<label class="input-name" style="width:45px;height:20px;padding-top:0px;border-bottom: none;">
						</label>%
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td colspan="3" style="border-top:none;border-left:none!important;border-bottom:none;text-align:right;padding-right:10px;line-height:0px;">
				<span>Tiền thuế GTGT: </span>  
			</td>
			<td align="right" style="border-top:none!important;border-bottom:none!important;border-left:none;">
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
			<td colspan="5" style="border-top:none!important;border-bottom:1px solid #005cb3;border-left:none;text-align:right;padding-right:10px;">
				<span class="hoang_so_le">Tổng cộng tiền thanh toán: </span>
			</td>
			<td align="right" style="color: #31373E;border-top:none!important;border-bottom:1px solid #005cb3;border-left:1px white !important;">
				<b>
					<xsl:choose>
						<xsl:when test="(../../Amount='') or (../../Amount=0)">
							<label class="input-name summary" style="height:20px;display: block;margin-right:5px;border-bottom: none;color:#000;">
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
				<xsl:call-template name="tempAmount_words">
					<xsl:with-param name="str" select="../../Amount_words"/>
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
					<td class="back-bold" style="height: 20px;border-bottom: 1px dotted #00348d;border-top: 0px solid #000;">
						<div style="display: block;word-wrap: break-word;width: 30px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px;border-bottom: 1px dotted #00348d;border-top: 0px solid #000;">
						<div style="text-align: left; width: 310px; display: block; word-wrap: break-word; overflow: hidden; float: left; padding-left: 2px">
							<xsl:value-of select="../../Extra2"/>
						</div>
					</td>
					<td class="back-bold" style="height: 20px; border-bottom: 1px dotted #00348d;border-top: 0px solid #000;">
						<div style="display: block;word-wrap: break-word;width: 70px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px; border-bottom-color: currentColor;border-bottom: 1px dotted #00348d;border-top: 0px solid #000;">
						<div style="display: block;word-wrap: break-word;width:130px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px; border-bottom: 1px dotted #00348d;border-top: 0px solid #000;">
						<div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px;border-bottom: 1px dotted #00348d;border-top: 0px solid #000;">
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
				<table style="width: 800px;height: 83px; border-bottom: medium none; border-left: medium none; border-top: medium none; border-right: medium none;">
					<tr>
						<!--panel client-->
						<td style="border: none;width: 333px;vertical-align: top;text-align:center;color: #005cb3;">
							<p style="font-size:14px; margin-top:0;height: 20px;margin-bottom: 0;">
								<b>
								Người mua hàng
								</b>
							</p>
							<p style="font-size:14px; margin-top:0;height: 20px;margin-bottom: 0;">
							(<i>Ký, ghi rõ họ tên</i>)
							</p>
							<xsl:choose>
								<xsl:when test="/Invoice/imageClient != '' ">
									<div class="bgimg" style="background:url({/Invoice/imageClient/@URI}) no-repeat center left; height: 83px;width:295px;" onclick="showDialog('dialogClient','{$serial}','{$pattern}','{$invno}',1,'messClt','ic')">
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
									<div style="text-align:center;padding-top:1px;color: #005cb3;">
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
						<td style="border: none;width: 333px;vertical-align: top;text-align:center;color: #005cb3;">
							<p style="font-size:14px; margin-top:0;height: 20px;margin-bottom: 0;">
								<b>
								Người bán hàng
								</b>
							</p>
							<p style="font-size:14px; margin-top:0;height: 20px;margin-bottom: 0;">
							(<i>Ký, ghi rõ họ tên</i>)
							</p>
							<xsl:choose>
								<xsl:when test="/Invoice/image != '' ">
									<div class="bgimg" style="background:url({/Invoice/image/@URI}) no-repeat center left; height: 83px;width:295px;" onclick="showDialog('dialogServer','{$serial}','{$pattern}','{$invno}',0,'messSer','is')">
										<p style="margin-top:3px;margin-bottom:5px;font-size:12px">
											<xsl:value-of select="/Invoice/image"/>
										</p>
										<p style="font-size:12px">
										Ký bởi:
											<xsl:value-of select="/Invoice/CNCom"/>
											<br/> Ký ngày:
											<xsl:value-of select="/Invoice//Content/SignDate"/>
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
		<div style="font-size:12px; text-align: center; margin-top: 4px;">
			<span><b>Giải pháp Hóa đơn Điện tử</b> được cung cấp bởi <b>Trung Tâm Kinh Doanh VNPT Bà Rịa- Vũng Tàu</b> - MST 0106869738-044 - ĐT 0254 800126</span>
			<br/>
			<xsl:choose>
				<xsl:when test="/Invoice/Fkey !=''">
					<div style="font-size:12px; width:800px; text-align: center; margin:5px auto;">
						<span>Hóa đơn Điện tử (HĐĐT) được tra cứu trực tuyến tại https://portaltool-miennam.vnpt-invoice.com.vn.
						<br/>Mã tra cứu HĐĐT này: <b><xsl:value-of select="/Invoice/Fkey"/></b></span>
					</div>
				</xsl:when>
			</xsl:choose>
		</div>
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
			@page {size: A4; margin: 11mm;}
		  	* html,body {
		  	margin: 0px auto;
		  	padding: 0;
		  	height: 100%;
		  	}
		  	span, i, b{
		  		color: #005cb3;
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
		  	font: 78%/1.4em Arial, "Helvetica Neue", Helvetica, sans-serif;
		  	padding: 0px 10px 10px 10px;
		  	width: auto;
		  	height: auto;
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
		  	border: 1px solid #005cb3;
		  	color: #000;
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
		  	border-bottom: 1px dotted #005cb3;
		  	}
		  	.VATTEMP .statistics {
		  	clear: both
		  	}
		  	.nenhd {
		  	position: relative;
		  	}
		  	.nenhd_bg {
		  	background: url('') no-repeat;
		  	background-size: 400px 400px;
		  	width: 400px;
		  	height: 400px;
		  	top: 70px;
		  	left: 240px;
		  	position: absolute;
		  	z-index: 1;
		  	margin: 0;
		  	opacity:0.3;
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
		  	border: 1px solid #000;
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
		  	border-bottom:1px dashed #005cb3;
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
		  		font-size:16px;
		  	}
			.customerInfo .vt-row{
			margin-bottom: 8px;
			}
			/*.customerInfo .title{
				width: 295px;
			}*/

			/* ================ */
		  	/* Product Table*/

		  	.productTable {
		  	background-position: bottom;
		  	border: 1 1 1 1 solid #005cb3;
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
		  	border-bottom: 1px solid #005cb3;
		  	border-right: 1px solid #005cb3;
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
		  	border-bottom: 1px dotted #005cb3;
		  	border-top: 0px solid #005cb3;
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
		  		font-size:16px;
		  	}
			.comInfo td{
		  		padding-left:10px;
		  	}
			.comInfo .vt-row{
		  		margin-bottom:8px;
		  	}
			.comInfo .title{
		  		//width:125px;
		  	}
				</style>
			</head>
			<body style="width: 830px;height: auto;">
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