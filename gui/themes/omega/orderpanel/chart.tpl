<!-- BDP: purchase_header -->
<!-- EDP: purchase_header -->

<form name="address" method="post" action="checkout.php">
	<table width="400">
		<tr>
			<td colspan="2" class="content3"><strong>{YOUR_CHART}</strong></td>
		</tr>

		<!-- BDP: page_message -->
		<tr>
			<td colspan="2" class="title"><span class="message">{MESSAGE}</span></td>
		</tr>
		<!-- EDP: page_message -->

		<tr>
			<td colspan="2" class="content2"><span class="content"><strong>{TR_PERSONAL_DATA}</strong> &nbsp;&nbsp;<a href="address.php?edit=yes" class="link">{TR_CHANGE}</a></span></td>
		</tr>
		<tr>
			<td class="content">{TR_FIRSTNAME}</td>
			<td class="content">{VL_USR_NAME}</td>
		</tr>
		<tr>
			<td class="content">{TR_LASTNAME}</td>
			<td class="content">{VL_LAST_USRNAME}</td>
		</tr>
		<tr>
			<td class="content">{TR_EMAIL}</td>
			<td class="content">{VL_EMAIL}</td>
		</tr>
		<tr>
			<td class="content">{TR_COMPANY}</td>
			<td class="content">{VL_USR_FIRM}</td>
		</tr>
		<tr>
			<td class="content">{TR_GENDER}</td>
			<td class="content">{VL_USR_GENDER}</td>
		</tr>
		<tr>
			<td class="content">{TR_POST_CODE}</td>
			<td class="content">{VL_USR_POSTCODE}</td>
		</tr>
		<tr>
			<td class="content">{TR_CITY}</td>
			<td class="content">{VL_USRCITY}</td>
		</tr>
		<tr>
			<td class="content">{TR_STATE}</td>
			<td class="content">{VL_USRSTATE}</td>
		</tr>
		<tr>
			<td class="content">{TR_COUNTRY}</td>
			<td class="content">{VL_COUNTRY}</td>
		</tr>
		<tr>
			<td class="content">{TR_STREET1}</td>
			<td class="content">{VL_STREET1}</td>
		</tr>
		<tr>
			<td class="content">{TR_STREET2}</td>
			<td class="content">{VL_STREET2}</td>
		</tr>
		<tr>
			<td class="content">{TR_PHONE}</td>
			<td class="content">{VL_PHONE}</td>
		</tr>
		<tr>
			<td class="content">{TR_FAX}</td>
			<td class="content">{VL_FAX}</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td width="200" class="content2"><strong>{TR_COSTS}</strong></td>
		</tr>
		<tr>
			<td colspan="2" class="content"><strong>{TR_PACKAGE_NAME}</strong> &nbsp;&nbsp;<a href="index.php" class="link">{TR_CHANGE}</a></td>
		</tr>
		<tr>
			<td class="content">{TR_PACKAGE_PRICE}</td>
			<td class="content2">{PRICE}</td>
		</tr>
		<tr>
			<td class="content">{TR_PACKAGE_SETUPFEE}</td>
			<td class="content2">{SETUP}</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td align="right"><strong>{TR_TOTAL}</strong></td>
			<td class="content2"><strong>{TOTAL}</strong></td>
		</tr>


		<tr>
			<td colspan="2"><label for="capcode">{TR_IMGCAPCODE}<br /><strong>{TR_CAPCODE}</strong></label></td>
		</tr>
		<tr>
			<td colspan="2"><input name="capcode" type="text" class="textinput" id="capcode" style="width:210px" value="" /></td>
		</tr>
		<tr>
			<td colspan="2" class="imgcapcode_description_text"><p>{TR_IMGCAPCODE_DESCRIPTION}</p></td>
		</tr>
		<!-- BDP: tos_field -->
		<tr>
			<td width="200" colspan="2" class="content2"><strong>{TR_TOS_PROPS}</strong></td>
		</tr>
		<tr>
			<td colspan="2" class="content"><textarea readonly="readonly" style="width=400px" cols="50" rows="5">{TOS}</textarea></td>
		</tr>
		<tr>
			<td class="content2" colspan="2"><input type="checkbox" name="tosAccept" value="1" />{TR_TOS_ACCEPT}</td>
		</tr>
		<!-- EDP: tos_field -->
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr align="right">
			<td colspan="2"><input name="Submit" type="submit" id="continueButton" class="button"  value="  {TR_CONTINUE}  " /></td>
		</tr>
	</table></form>
	<br />

<!-- BDP: purchase_footer -->
<!-- EDP: purchase_footer -->
