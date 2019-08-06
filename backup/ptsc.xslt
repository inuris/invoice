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
			<xsl:value-of select="83"/>
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
				<div class="clearfix" style="padding-bottom:8px;padding-top:16px;border: 1px solid #333333; border-radius: 10px; margin-top:10px">
					<label class="fl-l" style="padding-left:10px;">
						<span>Số tiền bằng chữ <br/><i>(In words)</i>: </span>
					</label>
					<label class="fl-l input-name" style="width:796px;height:17px;min-width: 100px;display: block;">
						<xsl:value-of select="$str1"/>
					</label>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="clearfix" style="padding-bottom:8px;padding-top:16px;border: 1px solid #333333; border-radius: 10px; margin-top:10px">
					<label class="fl-l" style="padding-left:10px;text-align:center;">
						<span>Số tiền bằng chữ: <br/><i>(In words):</i> </span>
					</label>
					<label class="fl-l input-name" style="width:796px;height:17px;min-width: 100px;display: block;">
						<xsl:value-of select="$str"/>
					</label>
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
							<xsl:text disable-output-escaping="yes">&lt;div class="VATBound" style="margin: 0 auto;width:940px;" &gt;</xsl:text>
							<xsl:call-template name="addfirtbody">
							</xsl:call-template>
							<xsl:call-template name="addsecondbody">
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;div class="statistics"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="nenhd" style="width:940px;"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;table class="productTable"   width="940px" cellpadding="0" cellspacing="0" style="margin-top: 10px;padding-bottom: 5px;margin: 0 auto;position:relative;z-index:2;"&gt;</xsl:text>
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
							</xsl:if>
						</xsl:when>
						<!-- Dòng product đầu của các trang sau -->
						<xsl:otherwise>
							<xsl:text disable-output-escaping="yes">&lt;div class="pagecurrent" id=</xsl:text>
							<xsl:value-of select="((position()-1) div $itemNeeded) + 1"/>
							<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="VATBound" style="margin: 0 auto;width:940px;" &gt;</xsl:text>
							<xsl:call-template name="addfirtbody">
							</xsl:call-template>
							<!--  <div style="margin-left: 318px; margin-top: 8px">
					 <label>Tiếp theo trang trước - trang</label>
					 <xsl:value-of select="((position()-1) div $itemNeeded) + 1"/>/<xsl:value-of select="$pagesNeededfnc"/>
				  </div> -->
							<xsl:call-template name="addsecondbody">
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;div class="statistics"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;div class="nenhd" style="width:940px;"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;table class="productTable"   width="940px" cellpadding="0" cellspacing="0" style="margin-top: 10px;padding-bottom: 5px;margin: 0 auto;position:relative;z-index:2;"&gt;</xsl:text>
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
			<tr>
				<td style="vertical-align:top;padding-top:14px;">
					<div style="width:90px;float:left;padding-right:15px;">
						<img alt="logo" style="width:100%;" src="data:image/png;base64,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"/>
					</div>
					<div style="float:left;width:500px;">
						<div class="clearfix vt-row">
							<label class="fl-l title" style="width:455px;text-align:justify;">
								<span style="font-size:12px;font-family: Arial; font-weight: 700">CÔNG TY CP DỊCH VỤ LẮP ĐẶT, VẬN HÀNH VÀ BẢO DƯỠNG CÔNG TRÌNH DẦU KHÍ BIỂN PTSC (CHUYỂN ĐỔI TỪ CÔNG TY TNHH MỘT THÀNH VIÊN DỊCH VỤ LẮP ĐẶT, VẬN HÀNH VÀ BẢO DƯỠNG CÔNG TRÌNH DẦU KHÍ BIỂN PTSC)</span>
							</label>
						</div>
						<div class="clearfix vt-row">
							<label class="fl-l title">
								<b style="font-size:16px;font-family:Times New Roman;">PTSC OFFSHORE SERVICES JOINT STOCK COMPANY</b>
							</label>
						</div>
						<div class="clearfix vt-row">
							<label class="fl-l title">
								<span style="font-size:14px;" >Head office: <xsl:value-of select="../../ComAddress"/></span>
							</label>
						</div>		
						<div class="clearfix vt-row">
							<label class="fl-l">
								<span style="font-size:14px;">Tel: 0254.3515758, Fax: 0254.3515759</span>
							</label>
						</div>				
					</div>
					<div class="clearfix vt-row" style="padding-left: 20px;">
						<label class="fl-l title" style="font-size: 16px;text-align: center;margin-right:36px;"><span style="">MST:</span><br/><i style="font-size:14px;font-weight:bold;">(Tax Code)</i></label>
						<label class="input-code" maxlength="1" style="margin-right:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,1,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="border-left:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;margin-right:20px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,2,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="margin-right:0px;height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,3,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="margin-right:0px;border-left:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,4,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="margin-right:0px;border-left:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,5,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="margin-right:0px;border-left:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,6,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="margin-right:0px;border-left:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,7,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="margin-right:0px;border-left:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,8,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="margin-right:0px;border-left:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,9,1)"/></b>
						</label>
						<label class="input-code" maxlength="1" style="margin-right:0px;border-left:0px; height:18px;width: 20px;padding:3px 0;margin-top:6px;">
							<b><xsl:value-of select="substring(../../ComTaxCode,10,1)"/></b>
						</label>
					</div>
				</td>
				<td>
					<div style="width:320px;">
						<p style="text-align:center;line-height:28px;font-size:24px;letter-spacing:-1px;padding-top:10px;">
							<span style="font-family: 'Times New Roman'; font-weight:bold;">HÓA ĐƠN<br/> GIÁ TRỊ GIA TĂNG</span>
							<br/>
							<span style="font-size: 18px;font-weight:bold;">TAX INVOICE</span>
						</p>
					</div>
					
					<div style="width:222px;margin:0px auto;margin-top:15px;">
						<p style="margin-top:0px auto;line-height:22px;">
							<span>Mẫu số <i>(Form)</i>: <b><xsl:value-of select="../../InvoicePattern"/></b></span>
							<br/><span>Ký hiệu <i>(Serial)</i>: <b><xsl:value-of select="../../SerialNo"/></b></span>
							<br/><label style="float:left;">Số hóa đơn: <br/><i>(Invoice No.)</i></label>
							<label><b style="font-size:20px;color:red;">&#160;<xsl:value-of select="../../InvoiceNo"/></b></label>
						</p>
						<div class="clearfix" style="line-height:22px;">
							
						</div>
						<div class="clearfix" style="line-height:22px">
							
						</div>
						<div class="clearfix" style="line-height:22px">
							
						</div>
						
					</div>
				</td>
			</tr>		
		</table>
	</xsl:template>
	<xsl:template name="addsecondbody">
		<table class="customerInfo" style="width: 100%;margin-bottom: 10px;">
			<tr>
				<td style="vertical-align:top;width: 520px;padding:0px;">
					<div style="height:210px; border: 1px solid #333333; border-radius: 10px 10px 10px 10px; padding: 15px;border-right:1px solid;box-sizing:border-box;">
						<div class="clearfix vt-row">
							<label class="fl-l" style="margin-top:0;">
								<span>Người mua hàng : </span>
							</label>
							<label class="fl-l input-name" style="width:100px;margin:0;text-align:center;font-weight:700">
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
								<span>Đơn vị :<br/><i>(To) :</i></span>
							</label>
							<label class="fl-l input-name" style="width:100px;margin:0;text-align:center;font-weight:700">
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
								<span>Địa chỉ :<br/><i>(Address) :</i></span>
							</label>
							<label class="fl-l input-name" style="width:100px;margin:0;text-align:center;font-weight:700">
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
						<div class="clearfix vt-row" style="">						
							<label class="fl-l" style="margin-top:0;">
								<span>Mã số thuế :<br/><i>(Tax code) :</i></span>
							</label>
							<label class="fl-l input-name" style="width:100px;margin:0;text-align:center;font-weight:700">
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
					</div>
				</td>
				<td style="vertical-align:top;width: 407px;padding:0px;">
					<div style="height:210px; border: 1px solid #333333; border-radius: 10px 10px 10px 10px; padding: 15px;margin-left:20px;box-sizing:border-box;">
						<div class="clearfix vt-row">						
							<label class="fl-l" style="margin-top:0;">
								<span>Ngày :<br/><i>(Date) :</i></span>
							</label>
							<label class="fl-l" style="width:210px;margin:0;text-align:center;font-weight:700">
								<xsl:choose>
									<xsl:when test="../../ArisingDate!= '' and substring(../../ArisingDate,7,4) != '1957' ">
										<xsl:value-of select="substring(../../ArisingDate,1,2)"/> / <xsl:value-of select="substring(../../ArisingDate,4,2)"/> / <xsl:value-of select="substring(../../ArisingDate,7,4)"/>
									</xsl:when>
									<xsl:otherwise>
										&#8230;
									</xsl:otherwise>
								</xsl:choose>
							</label>
						</div>
						<div class="clearfix vt-row">						
							<label class="fl-l" style="margin-top:0;">
								<span>Nội dung :<br/><i>(Subject) :</i></span>
							</label>
							<label class="fl-l" style="margin:0;">
								<xsl:choose>
									<xsl:when test="../../Extra1!= '' ">
										<xsl:value-of select="../../Extra1"/>
									</xsl:when>
									<xsl:otherwise>
										&#8230;
									</xsl:otherwise>
								</xsl:choose>
							</label>
						</div>
						<div class="clearfix vt-row">						
							<label class="fl-l" style="margin-top:0;">
								<span>Theo hợp đồng :<br/><i>(Po-Contract) :</i></span>
							</label>
							<label class="fl-l" style="margin:0;">
								<xsl:choose>
									<xsl:when test="../../Extra2!= '' ">
										<xsl:value-of select="../../Extra2"/>
									</xsl:when>
									<xsl:otherwise>
										&#8230;
									</xsl:otherwise>
								</xsl:choose>
							</label>
						</div>
						<div class="clearfix vt-row">
							<label class="fl-l" style="margin-top:0;">
								<span>Hình thức thanh toán :<br/><i>(Payment by)</i>:</span>
							</label>
							<label class="fl-l" style="margin:0;text-align:center;font-weight:700">
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
						</div>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="calltitleproduct">
		<tr class="productTableHeader" style="border-top:1px solid #333333;font-family:Arial;">
			<td style="width:27px;">
				<b class="title">STT</b>
				<br/>
				<span class="english-font" style="">Item</span>
			</td>
			<td style="">
				<b class="title">Tên hàng hóa, dịch vụ</b>
				<br/>
				<span class="english-font" style="">Description</span>
			</td>
			<td style="width:70px;">
				<b class="title">Đơn vị tính</b>
				<br/>
				<span class="english-font" style="">Unit</span>
			</td>
			<td style="width:100px;">
				<b class="title">Đơn giá</b>
				<br/>
				<span class="english-font" style="">Unit Price</span>
			</td>
			<td style="width:80px;word-break: break-all;">
				<b class="title">Số lượng</b>
				<br/>
				<span class="english-font" style="">Quantity</span>
			</td>
			<td style="width:200px;">
				<b class="title">Thành tiền</b>
				<br/>
				<span class="english-font" style="">Amount</span>
			</td>
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
				<div style="display: block;word-wrap: break-word;text-align: right;  overflow: hidden;">
					<xsl:choose>
						<xsl:when test="(ProdPrice='') or(ProdPrice=0)">
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="translate(translate(translate(format-number(translate(ProdPrice,',','.'), '###,##0.####'),',','?'),'.',','),'?','.')"/>
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
							<xsl:value-of select="translate(translate(translate(format-number(translate(ProdQuantity,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
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
							<xsl:value-of select="translate(translate(translate(format-number(translate(Amount,',','.'), '###,##0.####'),',','?'),'.',','),'?','.')"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="calltongsoproduct">
		<tr class="bg-pink">
			<td colspan="5" style="border-right:1px solid;border-top:1px solid #333333;text-align:right;padding-right:10px;">
				<p style="width:200px;text-align:center;margin:4px auto;">
					<span class="">Cộng tiền hàng</span>
					<br/><i>(Sub total)</i>
				</p>
			</td>
			<td style="border:none;border-top:1px solid #333333;">
				<b>
					<label class="input-name summary" style="height:20px;display: block;margin-right:5px;border-bottom: none;">
					<xsl:choose>
						<xsl:when test="(../../Total=0)">				
							0							
						</xsl:when>
						<xsl:when test="(../../Total='')">				
							&#160;							
						</xsl:when>
						<xsl:otherwise>							
							<xsl:value-of select="translate(translate(translate(format-number(translate(../../Total,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
						</xsl:otherwise>
					</xsl:choose>
					</label>					
				</b>
			</td>
		</tr>		
		<tr class="bg-pink">
			<td colspan="2" style="border:none;text-align:left;border-top:1px solid #333333;padding-left:90px;">
				<label class="fl-l" style="text-align:center;margin:4px auto;">
					<span>Thuế suất</span>
					<br/><i>(VAT rate)</i>
				</label>
				<label class="fl-l" style="text-align:center; width:70px;margin:4px auto;">
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
				</label>
			</td>
			<td colspan="3" style="border-right:1px solid #333333;border-top:1px solid #333333;text-align:center;">
				<label class="" style="padding-right:10px;">
					<span>Tiền thuế GTGT</span>
					<br/><i>(VAT)</i>
				</label>
			</td>
			<td style="border:none;border-top:1px solid #333333; border-right:1px solid #333333;text-align:right;">
				<b>
					<label class="input-name summary" style="height:20px;display: block;margin-right:5px;border-bottom: none;">
					<xsl:choose>						
						<!--new-->
						<xsl:when test="../../VAT_Amount='0'">
						  <xsl:choose>
							<xsl:when test="../../VAT_Rate='-1'">
							  &#160;/
							</xsl:when>
							<xsl:otherwise>
							  0 <span class="summary-unit"></span>
							</xsl:otherwise>
						  </xsl:choose>
						</xsl:when>
						
						<xsl:when test="../../VAT_Amount!=''">
						  <!-- fix new-->
						  <xsl:value-of select="translate(translate(translate(format-number(translate(../../VAT_Amount,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
						  <span class="summary-unit"></span>
						</xsl:when>
						<xsl:otherwise>
						  &#160;
						</xsl:otherwise>
					</xsl:choose>
					</label>
				</b>
			</td>
		</tr>
		<tr class="bg-pink">
			<td colspan="5" style="border-right:1px solid #333333;border-top:1px solid #333333;text-align:center;padding-top:4px;padding-bottom:4px;">
				<span class="">Cộng tiền thanh toán</span>
				<br/><i>(Total)</i>
			</td>
			<td style="border:none;border-top:1px solid #333333; border-right:1px solid #333333;text-align:right; ">
				<b>
					<label class="input-name summary" style="height:20px;display: block;margin-right:5px;border-bottom: none;">
						<xsl:choose>
							<xsl:when test="(../../Amount='') or (../../Amount=0)">							
								0
							</xsl:when>
							<xsl:otherwise>							
								<xsl:value-of select="translate(translate(translate(format-number(translate(../../Amount,',','.'), '###,##0.##'),',','?'),'.',','),'?','.')"/>
							</xsl:otherwise>
						</xsl:choose>
					</label>
				</b>
			</td>
		</tr>
		<tr style="border-left: 0; border-right: 0">
			<td colspan="6" style="border:none;border-top:1px solid #333333;">
				<xsl:call-template name="tempAmount_words">
					<xsl:with-param name="str" select="../../Amount_words"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="addchuky">
		<!--<xsl:choose>
			<xsl:when test="../../ExchangeRate != ''">
				<tr>
					<td class="back-bold" style="height: 20px;border-bottom: 1px dotted #00348d;border-top: 0px solid #000;">
						<div style="display: block;word-wrap: break-word;width: 30px;text-align: center;  overflow: hidden;">

						</div>
					</td>
					<td class="back-bold" style="height: 20px;border-bottom: 1px dotted #00348d;border-top: 0px solid #000;">
						<div style="text-align: left; width: 310px; display: block; word-wrap: break-word; overflow: hidden; float: left; padding-left: 2px">
							<xsl:value-of select="../../ExchangeRate"/>
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
		</xsl:choose>-->
	</xsl:template>
	<xsl:template name="addfinalbody">
		<table style="width:100%;margin-top:10px;">
			<tr>
				<td>
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
									<td style="border: none;width: 333px;vertical-align: top;text-align:left; width: 40%">
										<p style="font-size:14px; margin-top:0;margin-bottom: 5px;">
											<b>
											Đề nghị chuyển tới
											</b>
											<i>(Please remit to)</i>
										</p>
										<div>
											<p style="font-size:12px">
												- PTSC OFFSHORE SERVICES JOINT STOCK COMPANY
											</p>
											<p style="font-size:12px">
												- Acc No. 008.1.37.0647014 (USD)
											</p>
											<p style="font-size:12px">
												- Acc No. 008.1.00.0647004 (VND)
											</p>
											<p style="font-size:12px">
												- Joint-Stock Commercial Bank for Foreign Trade of Vietnam - Vung Tau Branch
											</p>
											<p style="font-size:12px">
												- Swift Code: BFTVVNVX008
											</p>
										</div>
									</td>
									<td style="border: none;width: 333px;vertical-align: top;text-align:center;">
										<p style="font-size:14px; margin-top:0;margin-bottom: 0;">
											<b>
											Người mua hàng
											</b>
											<i>(Customer)</i>
										</p>
										<xsl:choose>
											<xsl:when test="/Invoice/imageClient != '' ">
												<div class="bgimg" style="background:url({/Invoice/imageClient/@URI}) no-repeat center left; height: 83px" onclick="showDialog('dialogClient','{$serial}','{$pattern}','{$invno}',1,'messClt','ic')">
													<p style="margin-top:3px;margin-bottom:5px;font-size:12px">
														<xsl:value-of select="/Invoice/imageClient"/>
													</p>
													<p style="font-size:12px">
													Ký bởi:
														<xsl:value-of select="/Invoice/CNCus"/>
														<br/> Ký ngày:
														<xsl:value-of select="/Invoice/Date"/>
													</p>
												</div>
											</xsl:when>
										</xsl:choose>
									</td>
									<!--panel client-->
									<td style="border: none;width: 333px;vertical-align: top;text-align:center;color: #333333;">
										&#160;
									</td>
									<!--panel server-->
									<td style="border: none;width: 333px;vertical-align: top;text-align:center;color: #333333;width: 35%">
										<p style="font-size:14px; margin-top:0;margin-bottom: 0;">
											<b>
											Người bán hàng
											</b>
											<i>(Seller)</i>
										</p>
										<xsl:choose>
											<xsl:when test="/Invoice/image != '' ">
												<div class="bgimg" style="background:url({/Invoice/image/@URI}) no-repeat center left; height: 112px;background-color:#DFF0D8;border:none;" onclick="showDialog('dialogServer','{$serial}','{$pattern}','{$invno}',0,'messSer','is')">
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
								</tr>
								<tr>
									<td colspan="3" style="border: none;width: 333px;vertical-align: top;">
										<xsl:choose>
											<xsl:when test="/Invoice/convert!=''">
												<div style="text-align:center;padding-top:1px;color: #333333;">
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
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="add_vnpt_introduction">
		<div style="font-size:13px; text-align: center; margin-top: 4px;">
			<b>Giải pháp Hóa đơn Điện tử</b> được cung cấp bởi <b>Trung Tâm Kinh Doanh VNPT Bà Rịa- Vũng Tàu</b> - Hotline đăng ký dịch vụ 0913759468
			<br/>
			<xsl:choose>
				<xsl:when test="/Invoice/Fkey !=''">
					<div style="font-size:13px; width:800px; text-align: center; margin:5px auto;">
						Hóa đơn Điện tử (HĐĐT) được tra cứu trực tuyến tại https://portaltool-miennam.vnpt-invoice.com.vn.
						<br/>Mã tra cứu HĐĐT này: <b><xsl:value-of select="/Invoice/Fkey"/></b>
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
			@page{size:A4, margin-left:5mm; margin-right:5mm;}
		  	* html,body {
		  	margin: 0px auto;
		  	padding: 0;
		  	height: 100%;
		  	}
		  	span, i, b, label{
		  		color: #333333;
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
		  	font: 78%/1.4em SanSerif, Helvetica, Arial, "Helvetica Neue";
		  	padding: 0px 10px 10px 10px;
		  	width: auto;
		  	height: auto;
		  	font-size: 14px;
		  	margin: 0px auto;		  	
		  	}
		  	.VATTEMP h2 {
		  	font-size: 22px;
		  	}
		  	.VATTEMP h2, p {
		  	margin: 0;
		  	}
		  	.VATTEMP p.name-upcase {
		  	font-size: 14px;
		  	text-transform: uppercase;
		  	font-family: Times New Roman
		  	}
		  	.VATTEMP .number {
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
		  	border: 1px solid #333333;
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
		  	.VATTEMP .input-name, .input-date {
		  	border: 0;
		  	//border-bottom: 1px dotted #333333;
		  	}
		  	.VATTEMP .statistics {
		  	clear: both
		  	}
		  	.nenhd {
		  	position: relative;
		  	}
		  	.nenhd_bg {
		  	background-size: 100%;
		  	width: 200px;
		  	height: 265px;
		  	top: 65px;
		  	left: 400px;
		  	position: absolute;
		  	z-index: 1;
		  	margin: 0;
		  	opacity:0.15;
			background-image: url('data:image/png;base64,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');
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
		  	font-size: 15px;
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
		  	border-bottom:1px dashed #333333;
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
		  	margin-top: 8px;
		  	display: block;		  	
		  	}
		  	.customerInfo label{
		  		font-size:16px;
		  	}
			.customerInfo .vt-row{
			margin-bottom: 8px;
			}

			/* ================ */
		  	/* Product Table*/

		  	.productTable {
		  	background-position: bottom;
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
		  	font-family: serif;
		  	font-size: 14px
		  	}
		  	.productTable .noline td {
		  	border-bottom: 1 none
		  	}
		  	.productTable td {
		  	border-bottom: 1px solid #333333;
		  	border-right: 1px solid #333333;
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
		  	border-bottom: 1px dotted #333333;
		  	border-top: 0px solid #333333;
		  	height: 30px;
		  	}
			.productTable tr{
				border-left: 1px solid #333333;
				border-right: 1px solid #333333;
		  	}
		  	.productTable tr.bg-pink{
		  		height: 32px;
		  	}
		  	.productTable tr.bg-pink td {
		  	font-size: 14px;
		  	text-align: right;
		  	}
			  .productTable .summary-unit{
				font-weight: 400;
				font-size:13px;
			}

			.productTableHeader{
				height:40px;
			}
		  	.productTableHeader td{
		  		text-align:center;
		  		padding:2px 5px;
		  	}
		  	.productTableHeader .subtitle{
				font-style:italic;
				font-size:13px;
		  	}
			#imgCancel{
				width:100%;
				height:100%;
			}
			.english-font{
				font-size:85%;
			}
				</style>
				<xsl:text disable-output-escaping="yes">
				</xsl:text>
				<xsl:text disable-output-escaping="yes">
				</xsl:text>
			</head>
			<body style="width: 960px;height: auto;right:16px;">
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
							<xsl:call-template name="add_vnpt_introduction"/>
						</div>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>