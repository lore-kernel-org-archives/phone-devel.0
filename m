Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E9B3C1F46;
	Thu, 30 Jul 2026 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402928; cv=none; b=FcLxyT9aOiNxKH93JP7ZpepbJnKy2AciQyyj1F1bah1h4/fjThetVIlAXfYNTTpkGOKdtOlgZXXu4a/k/wS+iFfspNXPy1KviEkRPWIuwDrckryL7dGQZLf4pKYnfBCc85F7blKxXP0AQ4D04ybTRHUWStq7gNAOVNP8pRHfcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402928; c=relaxed/simple;
	bh=UmwN+WTJEJE7oKulH1Yg0C5zd6Y9t88c1da4+WxIRLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXLU0OGV+6H7aBPHBRQyRPCQpE97jHkqQ9I3WttXTC/WW6I8dMK6LEQycFd9pCXShlgGn9SQ8yHKt+i8HsHrl+JE0dl0x0Penb2HbP+ou/G8Ss7EpGRovhSAy5QAKuvSrs0Wq/5B38e9iJmgTycehxSpqU2ffWfSV4c7mO1moy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=bFrob3te; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="bFrob3te"
Received: from [172.20.10.2] (78-80-17-116.customers.tmcz.cz [78.80.17.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 4E01153401D8;
	Thu, 30 Jul 2026 11:15:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1785402919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N+hma7a5kVC2Y5gdV6R4vjgQiSTBA8PLN2bcB14p5/0=;
	b=bFrob3te3onucFY7WzPjAAeVNTL2d1dTRXkuHXKFHilSYM41Y5PmdYb5vKqosSy13EaJtt
	RBtYQdRiIm9/GD+C5qhYw39Ue1fls2dvMoyVeq4Zm5diK4BFyYFNOJP6qMZcDQt6sG6AKC
	aNUHnBzBFpr71qyNPnXYaKomQAlQfeI=
Message-ID: <3648ba47-fa2a-4e2d-a3f2-040cd9568ace@ixit.cz>
Date: Thu, 30 Jul 2026 11:15:17 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 6/9] media: qcom: camss: csiphy-3ph: Add Gen2
 v1.1 MIPI CSI-2 C-PHY init
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
 <20260729-qcom-cphy-v9-6-1f8d9fdab037@ixit.cz>
 <ampyJ9FmwKmpE0YW@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <ampyJ9FmwKmpE0YW@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2026 23:35, Frank Li wrote:
> On Wed, Jul 29, 2026 at 10:20:01PM +0200, David Heidelberg wrote:
>> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
>> Gen 2 version 1.1 CSI-2 PHY.
>>
>> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
>> mode.
> 
> too much or, according to my understand D-PHY use 2 phase,  C-PHY use 3
> phase?
> 
> The PHY can be configured as two phase (D-PHY) or three phase (C-PHY) ?

Yes, I'll address the wrong wording in the next version then :)

> 
> Frank
> 
>> This configuration supports three-phase C-PHY mode.
>>
>> Acked-by: Cory Keitz <ckeitz@amazon.com>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 78 +++++++++++++++++++++-
>>   1 file changed, 76 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index 5c07aa9d19c51..83de89a88dbb1 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -45,16 +45,23 @@
>>
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
>>   	((offset) + (common_status_offset) + 0x4 * (n))
>>
>> +#define CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(n) \
>> +	(0x0100 + ((n) * 0x4))
>> +#define CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(n) \
>> +	(0x0300 + ((n) * 0x4))
>> +#define CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(n) \
>> +	(0x0500 + ((n) * 0x4))
>> +
>>   #define CSIPHY_DEFAULT_PARAMS		0
>>   #define CSIPHY_LANE_ENABLE		1
>>   #define CSIPHY_SETTLE_CNT_LOWER_BYTE	2
>>   #define CSIPHY_SETTLE_CNT_HIGHER_BYTE	3
>>   #define CSIPHY_DNP_PARAMS		4
>>   #define CSIPHY_2PH_REGS			5
>>   #define CSIPHY_3PH_REGS			6
>>   #define CSIPHY_SKEW_CAL			7
>> @@ -141,16 +148,17 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>>   	{0x0460, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x065C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0660, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   };
>>
>>   /* GEN2 1.0 2PH */
>> +/* 5 entries: clock + 4 lanes */
>>   static const struct
>>   csiphy_lane_regs lane_regs_sdm845[] = {
>>   	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
>> @@ -215,16 +223,82 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>>   	{0x0608, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>   	{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
>>   	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   };
>>
>> +/* GEN2 1.0 3PH */
>> +/* 3 entries: 3 lanes (C-PHY) */
>> +static const struct
>> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +
>> +};
>> +
>>   /* GEN2 1.1 2PH */
>>   static const struct
>>   csiphy_lane_regs lane_regs_sc8280xp[] = {
>>   	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> @@ -1169,18 +1243,18 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>   	int i;
>>
>>   	switch (csiphy->camss->res->version) {
>>   	case CAMSS_845:
>>   		if (c->phy_cfg == V4L2_MBUS_CSI2_DPHY) {
>>   			regs->lane_regs = &lane_regs_sdm845[0];
>>   			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>>   		} else if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> -			regs->lane_regs = NULL;
>> -			regs->lane_array_size = 0;
>> +			regs->lane_regs = &lane_regs_sdm845_3ph[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
>>   		}
>>   		break;
>>   	case CAMSS_2290:
>>   	case CAMSS_6150:
>>   		if (c->phy_cfg == V4L2_MBUS_CSI2_DPHY) {
>>   			regs->lane_regs = &lane_regs_qcm2290[0];
>>   			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>>   		} else if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>>
>> --
>> 2.53.0
>>

-- 
David Heidelberg

