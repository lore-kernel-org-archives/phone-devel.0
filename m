Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7378138C2C3
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531784; cv=none; b=U/ViVW+FLwHMzD7VsuZNv2Co9CQ5ff4q/eXErmLhz7Bu+0XWU1/JQxAPIMX778JMbIIz7gICD6hdIGc2iAqs5zM9LsiUzb9ChSyEmAQLum86ivAe9EXtzr9fAlG+M0BCASnAdHiTA2LdU1Q7lFImefXugD+755AI4Z+rw/Ozjr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531784; c=relaxed/simple;
	bh=jAqjFZ1cVljCe046fBFPJ/ldGEkf19iTq1wr8cQMmOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShPxBBGGZOJo4/T3e0p3I7gkEZG0zxADWa6QU6CA7X++E3FAW0skkr1wVRMkGcuV1EcEBOsse/XhP5zZpjBEU1ZH10DNHtReGiDQ9j5BGAMScrDjYZTJz5lFx8b3rYuXxDpSfdJ/tgtoawUdAAVYLheal41tndnu0ggNCeBbEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsVNi2gX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsVNi2gX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso49298085e9.3
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 01:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531781; x=1773136581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ4zYk7rVbgDrmP0BB3MrmvGdOwTNgKEAmJ+HRQXJxs=;
        b=LsVNi2gXhm8X482hlGbVJG4adPpi8k4iZ179m3wjWA7mgIs9QBfJrhXsy1PoPy6wGt
         EfbvSo2tofXgamK4IrasnZboOt4xMYWiDqRe5NkTePs9t3xTrW/NsX0a1LOu8M4hOqCy
         R9kk2I2+Yf5smh/F3A8e4UhdHYoLV1Iwqy7oIdPHwjVlsEOXn+6f6cS8aAKBs/K0G85X
         RiSNNdhMzmZFZjfMte0RzhH+6dGa8qo6dP0oMwcb1NYKzLYZUBC9Ed/LvS/IWWHm8vcp
         4pMly472anrHT+MYHuAUPG+fQrHM5AW85Nq2/YRaCZ36zGZahSqZLSy10wV2xY/utI1w
         FreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531781; x=1773136581;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJ4zYk7rVbgDrmP0BB3MrmvGdOwTNgKEAmJ+HRQXJxs=;
        b=rEuIplEd0MyJbV2DFD+GwLziSE7uezJxPRKAMCFh3cnRjZJx7+llxMGbmKG/NYQI3H
         2rf10oCOHxhoWaE5m5f9MOk219UvJVlyaDBdwoxmBJpHbMqQt3XaFvYyrmz3s0nr9quC
         opouUHejwPo940m1IKIjF8gBKzcR1n8kJSlqWpXkYAO8WnkQynrsWh/XnDRovf57ydTU
         0ft92jI9g0ZJ18CoRLOpmmtgHQOP+48xxW7joeoufdi35FeFGpaTZ8nHVGhZoHsTYre0
         FyyApv8ZmedLq3p2ekTH9AhMlV93/R/MGa72DKVZDks+ZxhsXPIy88+lyZwhFKLR8kgG
         0E2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWILSAvKxhEOr/QwV5zApABbV3ptGsQnJBn8UV7jjH2tv0FF514FxQb0Qb7sYwmdMXfx1EYn+SA+5187A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt2q5t9AJ1YUlLG6ZD9hGjnQ2SN6y1OVGDDzMZTo0hKWSlqstK
	uCXzmxsFNRcdr8A0K14BNsemc+saNo9Z/uOmB24DII5JVj1RhomCl6ks8yjGFyxqJCE=
X-Gm-Gg: ATEYQzx+xSb7CABgAhQFGOK2QYAmFTMdmjc4OE2bVh2CZZLDL5gAGG4H6q1znEKbnzH
	rxqdQmKCpiF5Cj7/lSCCogid5OXdk/+PXzZddHM0SrGXfi0XGepANVn2TqSggjKtuT9zXULtb1j
	Hdvpug8Om6GUCgzXJACOI+/+l+6Wkd1TLPEAkHcdRzlXyN0+s1iCBSVDThjWRqkdVRT15rwNKbT
	kWoRPPh6ThsSEWveQvXlsi8ZMpvMlrBImNWdEKkpl6yh8VQ7bWhaJRMLksEflchl8zfpRcp0itB
	xbv6fSBkXdMzPRPCNJwO5DMEzhGNn/CUi9R5wSfEYr/LJ566s33adaszFNYDjOEwMQK7s8Zzp7G
	YGvWySRa9AYcD2VhHKIkFRrIs1q0tcG+4lS/x5b6N+jVwxToZ9bgVJFdojzBc7Y+Q0BKCqZs1Pw
	GLxWvH/NLKMEOq78D8ln4LOvyOo5qoS8S2CZQY6c7HUgWVnGzWuOWzgPzKHlUR5PIr
X-Received: by 2002:a05:600c:1d0e:b0:483:acd9:bd18 with SMTP id 5b1f17b1804b1-483c9bc55ecmr267450835e9.1.1772531780790;
        Tue, 03 Mar 2026 01:56:20 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335e1f9sm15442435e9.7.2026.03.03.01.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:56:20 -0800 (PST)
Message-ID: <4156dea0-924f-4577-bf54-d5d8928f7adf@linaro.org>
Date: Tue, 3 Mar 2026 09:56:18 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 7/9] media: qcom: camss: csiphy-3ph: Add Gen2
 v1.2.1 MIPI CSI-2 C-PHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-7-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-7-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a PHY configuration sequence for the sm8250 which uses a Qualcomm
> Gen 2 version 1.2.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 112 ++++++++++++++++++++-
>   1 file changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index c612192ee727a..e48f5c1290173 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -550,6 +550,113 @@ csiphy_lane_regs lane_regs_qcm2290[] = {
>   	{0x0664, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* GEN2 1.2.1 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sm8250_3ph[] = {
> +	{0x0990, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0994, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0998, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0990, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0994, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0998, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x098c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x015c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0188, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x018c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0190, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x011c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0124, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x012c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0984, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0988, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0980, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x09ac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x09b0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0a90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a98, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a90, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a94, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a98, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a8c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x035c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0388, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x038c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0390, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x031c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0324, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x032c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a84, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a88, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a80, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0aac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0ab0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0b90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b98, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b90, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b94, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b98, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b8c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x055c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0588, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x058c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0590, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x051c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0524, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x052c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b84, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b88, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b80, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0bac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0bb0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 2.1.2 2PH DPHY mode */
>   static const struct
>   csiphy_lane_regs lane_regs_sm8550[] = {
> @@ -1134,7 +1241,10 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		break;
>   	case CAMSS_7280:
>   	case CAMSS_8250:
> -		{
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = &lane_regs_sm8250_3ph[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250_3ph);
> +		} else {
>   			regs->lane_regs = &lane_regs_sm8250[0];
>   			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
>   		}
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
