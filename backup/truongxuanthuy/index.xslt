{{#with truongxuanthuy}}
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
					<div style="width:194px;margin: 5px 0 0 10px">
						<img alt="logo" style="width:100%;height:100%;" src="data:image/png;base64,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"/>
					</div>
				</td>
				<td colspan="2" style="padding-top:7px;border-bottom:1px solid {{cssColor}};">
					{{>info data=comInfo}}
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
						<i style="">Bản thể hiện của hóa đơn điện tử</i>
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
					{{>info data=cusInfo}}
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
		  	width: 407px;
		  	height: 296px;
		  	top: 75px;
		  	left: 270px;
			  position: absolute;
		  	z-index: 1;
		  	margin: 0;
		  	opacity:0.2;
			background-repeat: no-repeat;
		  	background: inline('bg.png');
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
{{/with}}