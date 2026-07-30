Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E403FFABF;
	Thu, 30 Jul 2026 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403341; cv=none; b=cytPQJ9VPlKe/rND10/oaE7YeXejuetpQdVpWZ/DDu0mEznXyhc7qCuubaZ4WUZ1puiomYsDJNEBCluLSvgwD2j123mw9fDAu3TR5ek0PYsZWwchR4eHQmwPqffHjEr15HnZ/LLhlwz5oBj+VxTxTqk9vRfl5hBbk4PkePynciQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403341; c=relaxed/simple;
	bh=cs2czJ6L3Hm3J0RCGZuds1IMtFRnYH6ybz0tK2i6rig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDw5xewgFdWbTohnZLeKGniC2QiCBK35+KAI+GC3g4XQnt4hvii7WfHjZ7THZLqxc+JlzE/tx1sK+1T+AB6+4CaLXZlCa+Lu77lHPNUHCA+2di59LHhecqTfTH43iypCm3lRxFxWIM7FMvjdFns8nf7ZHN/zJ84XEbHH3yImHXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=g3yZbcYl; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="g3yZbcYl"
Received: from [172.20.10.2] (78-80-17-116.customers.tmcz.cz [78.80.17.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 9603C5340200;
	Thu, 30 Jul 2026 11:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1785403332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JEyzl6lt8ai9G4Oxiag+VTZHxXQe60Ayevig6+mQcHo=;
	b=g3yZbcYlvEx7FMl0DBUQuwj7R5/DZbqRocjRh4b0xPE8Cjxnwak2vG4DyI2haUGejY/ric
	aHmxb2dAijRYkSCrazPSeCz+vCVY3VNKEYHiwPJgf5tpy80Hu1+wD1LrKt297FHtBsBLZu
	P3upRNryF2M80JGnVRsDB6DkRN4jhJY=
Message-ID: <0afc1927-e8bf-4976-8744-50089e81b331@ixit.cz>
Date: Thu, 30 Jul 2026 11:22:11 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 8/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, Frank Li
 <Frank.Li@nxp.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
 <20260729-qcom-cphy-v9-8-1f8d9fdab037@ixit.cz>
 <ampzggsXYEZ34ieJ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <ampzggsXYEZ34ieJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2026 23:41, Frank Li wrote:
> On Wed, Jul 29, 2026 at 10:20:03PM +0200, David Heidelberg wrote:
>> Ensure that the link frequency divider correctly accounts for C-PHY
>> operation. The divider differs between D-PHY and C-PHY, as described
>> in the MIPI CSI-2 specification.
>>
>> For more details, see:
>> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
>>
>> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid.c   |  6 ++++--
>>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++++--
>>   drivers/media/platform/qcom/camss/camss.c        | 15 +++++++++++++--
>>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>>   4 files changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>> index bcc34ac9dd212..c8cb6f1a3d3bc 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -535,24 +535,26 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
>>   /*
>>    * csid_set_clock_rates - Calculate and set clock rates on CSID module
>>    * @csiphy: CSID device
>>    */
>>   static int csid_set_clock_rates(struct csid_device *csid)
>>   {
>>   	struct device *dev = csid->camss->dev;
>>   	const struct csid_format_info *fmt;
>> +	const bool cphy = (csid->phy.phy_sel == CSID_PHY_SEL_CPHY);
>> +
>>   	s64 link_freq;
>>   	int i, j;
>>   	int ret;
>>
>>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
>> -	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
>> -					csid->phy.lane_cnt);
>> +
>> +	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp, csid->phy.lane_cnt, cphy);
>>   	if (link_freq < 0)
>>   		link_freq = 0;
>>
>>   	for (i = 0; i < csid->nclocks; i++) {
>>   		struct camss_clock *clock = &csid->clock[i];
>>
>>   		if (!strcmp(clock->name, "csi0") ||
>>   		    !strcmp(clock->name, "csi1") ||
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index 539ac4888b608..a136cd27880a6 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> @@ -139,18 +139,19 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>>   	struct device *dev = csiphy->camss->dev;
>>   	s64 link_freq;
>>   	int i, j;
>>   	int ret;
>>
>>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>> +	const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
>>
>> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
>> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>>   	if (link_freq < 0)
>>   		link_freq  = 0;
>>
>>   	for (i = 0; i < csiphy->nclocks; i++) {
>>   		struct camss_clock *clock = &csiphy->clock[i];
>>
>>   		if (csiphy->rate_set[i]) {
>>   			u64 min_rate = link_freq / 4;
>> @@ -265,19 +266,20 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>>   static int csiphy_stream_on(struct csiphy_device *csiphy)
>>   {
>>   	struct csiphy_config *cfg = &csiphy->cfg;
>>   	s64 link_freq;
>>   	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
>>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>> +	const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
>>   	u8 val;
>>
>> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
>> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>>
>>   	if (link_freq < 0) {
>>   		dev_err(csiphy->camss->dev,
>>   			"Cannot get CSI2 transmitter's link frequency\n");
>>   		return -EINVAL;
>>   	}
>>
>>   	if (csiphy->base_clk_mux) {
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 072c428e25166..66171069057f8 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -27,16 +27,24 @@
>>   #include <media/v4l2-mc.h>
>>   #include <media/v4l2-fwnode.h>
>>
>>   #include "camss.h"
>>
>>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>>
>> +/*
>> + * C-PHY encodes data by 16/7 ~ 2.28 bits/symbol
>> + * D-PHY doesn't encode data, thus 16/16 = 1 b/s
>> + */
>> +#define CAMSS_COMMON_PHY_DIVIDENT 16
>> +#define CAMSS_CPHY_DIVISOR 7
>> +#define CAMSS_DPHY_DIVISOR 16
>> +
>>   static const struct parent_dev_ops vfe_parent_dev_ops;
>>
>>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
>>   	/* CSIPHY0 */
>>   	{
>>   		.regulators = {},
>>   		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
>>   		.clock_rate = { { 0 },
>> @@ -4619,29 +4627,32 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>>   	}
>>   }
>>
>>   /**
>>    * camss_get_link_freq - Get link frequency from sensor
>>    * @entity: Media entity in the current pipeline
>>    * @bpp: Number of bits per pixel for the current format
>>    * @lanes: Number of lanes in the link to the sensor
>> + * @cphy: If C-PHY encoding is used.
>>    *
>>    * Return link frequency on success or a negative error code otherwise
>>    */
>>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>> -			unsigned int lanes)
>> +			unsigned int lanes, const bool cphy)
> 
> you change this function argument, can you direct pass down csiphy instead
> entity
> 
> so move
> const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
> 
> into this help function,
> 
> to avoid dupicate such logic everywhere.

I tried similar approach in previous revisions [1], but it ended poorly due to 
this structure not being initialized at the time when I need it what I recall, 
thus I ended up with the cphy param again :(

David


[1] https://lore.kernel.org/all/20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz/

> 
> Frank
>>   {
>>   	struct media_pad *sensor_pad;
>> +	unsigned int div = lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
>> +					       CAMSS_DPHY_DIVISOR);
>>
>>   	sensor_pad = camss_find_sensor_pad(entity);
>>   	if (!sensor_pad)
>>   		return -ENODEV;
>>
>> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
>> +	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
>>   }
>>
>>   /*
>>    * camss_get_pixel_clock - Get pixel clock rate from sensor
>>    * @entity: Media entity in the current pipeline
>>    * @pixel_clock: Received pixel clock value
>>    *
>>    * Return 0 on success or a negative error code otherwise
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index 93d691c8ac63b..12b14ba8fcec3 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -164,17 +164,17 @@ struct parent_dev_ops {
>>   };
>>
>>   void camss_add_clock_margin(u64 *rate);
>>   int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>>   			struct device *dev);
>>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>> -			unsigned int lanes);
>> +			unsigned int lanes, const bool cphy);
>>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>>   int camss_pm_domain_on(struct camss *camss, int id);
>>   void camss_pm_domain_off(struct camss *camss, int id);
>>   int camss_vfe_get(struct camss *camss, int id);
>>   void camss_vfe_put(struct camss *camss, int id);
>>   void camss_delete(struct camss *camss);
>>   void camss_buf_done(struct camss *camss, int hw_id, int port_id);
>>   void camss_reg_update(struct camss *camss, int hw_id,
>>
>> --
>> 2.53.0
>>

-- 
David Heidelberg

