Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E654652
	for <phone-devel@vger.kernel.org>; Tue,  9 Jun 2026 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999181; cv=none; b=lIQXhJ49UNRGGD+f8RtpkHX0zCVxQnxz8/v0XppwNweLt8BUBoHzKXDevqivU6BjK5YKKIW9iYRXDB63vee98ug6WsMc1xjobk1dEOckY8Onjuc6qI2LEBgzbOoZwWH3gpz1HZR70Fj2kLq+2ZyeTP6BjJ7J1LroyOoCl14f/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999181; c=relaxed/simple;
	bh=BnrDNf0KyblpDzK8RL0uKrkJf8wwscJiCPoMZoRQgEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ih8QyWfCTxOSw3aGYzW/Warw0N8WMSCm1yM9ozfTFUZNbCbGaEwZsVOCYRpL4/mY42rQLdABmceZLKoK6ytNLnA6GB66zH+Xq3Xq/R/e1fGhWSX+/2p5dGaR9olJkW/OWAXI4gLJLeBKf+M4SYTzQuS6DRUPhC18L+HDx8WQbc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3wuP7ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clowVXH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3wuP7ik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clowVXH5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vCdu1800475
	for <phone-devel@vger.kernel.org>; Tue, 9 Jun 2026 09:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=; b=N3wuP7ikpeNn4yvM
	y0oN9DfEotLoUMt6HJ06o0iGXDd2nxVSW9XV2lyETljaSvQHNfxD1LXoxl8yrPH9
	LxbygrHDj8/PF15RlitMEZ1bUu3Bhgu3g+BvhoQkWPtJ4i4AhvSXa2dsKz/IWs7Q
	mm8L8krl5fb1UfTQAdtgeBlR1wRIiJLJDwcUYWMgCef83GLrn6M8WCR1U9QUrenw
	6YATZ5yWxMq8V2QB6zcZAnGLyIbsorNC4OITD4sy5mVC/pWzx4yb3eJlfhIi6TpZ
	5l2llhF+aa0NshNZeKbRymhbkg7IeLn6EvLAW2k7rkaK/sYy7quGALY/DWjNl/yf
	GPg3Wg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8j6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 09:59:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf0b7425bbso105727695ad.0
        for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780999179; x=1781603979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=;
        b=clowVXH57ZBdSIp0ThuvUqp5FpAZ3Yl4Ad5X9zGU5UIflU1h8/sxTGWxEI2GQHWaIl
         wD3yYsqU9cSJTSu2ZxwsjZ52lHYwg4Bj9oVnaa36XPJclPetFYsKom1isHljVRHlRFPt
         k8h8d81Ox1aQ/FRN5ftpxByVYFeIDEqxtT1lAAYKJx3GFW1FpHr8XkYhCsfaC4XclxF3
         eYBSLXeqnZCjfZRuWtnZMuzGXsON8aIK1hQF8b9jiaBoldcyZ+H6wLwU10BoVDbFZrGV
         PEnJHuhut8a2aC3vYwb1JVHsd+mIgUc2InVNgKD85ADP4cPe2jug12RXcP+0QPVG4KKQ
         ANcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999179; x=1781603979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=;
        b=KBqdwucTWBFMuL1FOWHd7L6ChSBl5fxlTg63p6/4H0xsK6VUMCdmUBg6t68YkQOL6r
         eaecNKLabnyTcdkPpO1CPFTmqe4sxEHVzUz9FcJtRxqn5fOaVpzDuwsgtlZ7W2praebS
         EL1V7HMxdVav9v5EuoWcnSuPAYFyMSpl7CwprV8/9XunhuJasNWkEaB1975HcF2VzOll
         YIwMnZlGQpQK/FjC6Ieon9Vc7CEC1zVqnRTq05gx1YQF333G/7xn/90Z3efYvZoRdnvO
         /hNlo7dJPPG3BL5CJB6Ro1R7DDnywqpQPU9+EscANcG5Rrvd+49NeJ8tt3YTpq5O1WfE
         OjCg==
X-Forwarded-Encrypted: i=1; AFNElJ+HbNRrY5eA+ol6YaLiTplhaQ5nGDW4371K96tQNoUm/dYmVhwe4ZxhEMn3Rl0W1ezk2riFdtduovLDVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySEQGGZdFHPDD7lzWtufHu+wqttt9dPAeI29c+JR1zEdEkSnNL
	BbHM28tWu/UQUpO+dvt3XojvIn3atu7iqW6Qv4O1cX8SxHIXDx/6jvOw81Pc/sx6nlc5LCUpgL+
	4sbkMeNJZ5zRX4SUY+XX9jfUyjNHvOERcoUj5pwLEeMINv5Qn4bqL8VO47JRzGChbWQ==
X-Gm-Gg: Acq92OFpXrMhXl+kySE4CJlWy9hqGrxRhbOZvqJUr/p2Jt27VTwVKrBaqZQ5yI1zihU
	+K3vXj+GKHN2woYY5/5Ygg8UNlVZb/23VupnIWFeFxAOHqlw3ycBOXbzrkshwR9nZFaaY0bWZIl
	8hr9Bzk8bx+WV0q/hYCJyJS/dtTEk3MruDWDxfutP8N+P1PFFcqGQqgKLla9vm12KrbctBUnTQS
	jQOyu5D9DSjPrhNq1VQU4wDAEem4s9s24HbiLArF6r8nBMMtzWpW5W8o6toAalcsk6WQ8yvl8Ah
	+QFTnnp7bw1LW8/2cd3K8xdC/dZ/B8hJZcFub2rxlRaZGTT1XvcSgadKXA5XjXPVK57qCOqZrpX
	VWDfe5ftZtSr33RVuim8ojwYmS8uSWpZCnFZKqtr5SnDdxuuaxb9s8r7NdRYyuA==
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr197066605ad.28.1780999179143;
        Tue, 09 Jun 2026 02:59:39 -0700 (PDT)
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr197066175ad.28.1780999178703;
        Tue, 09 Jun 2026 02:59:38 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm205544425ad.67.2026.06.09.02.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:59:38 -0700 (PDT)
Message-ID: <399bd375-235f-43a2-965e-e86e041a5a7f@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:29:31 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eB5zlAwHDrg5_4vHCTzPIqfhlxFkhWO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MiBTYWx0ZWRfX+ahr7I8jqfhB
 cTOHb3L5+E/8V4zD272Pq6wEammKYv/YXUiwazVS5kw5Drj6PXFIJj+aGM3blD75KQrXbI/Nc2u
 JUINyJF6hkcL0xbnmd1EA33S0xbqBbtJ73IAS6t24Nk9j67oNJyvvvU1NL2kUw4Bkf4KM+ppEBa
 qgtez0NhOgc8u6lwtBY/o+DAPq9h25OckoXBFlKzHZ7t/h6kYhyYJQes55lMypXFYiT9XO14pvA
 KpOdZqJMOZN11Qx2Rs8XpTseJoWLkdz6QnCena0HkYPAgYYdy2Q7UrnpoHrRpykpBDq0zAi4j/u
 9laPtIndD7AON4405u2NPVDa8UzaPqkxkyHXzIcT61LX1RVD2y3RUBEtB8scmDWHNWZPezWoMqv
 m3QBx0ef5SJ5be3BCzh+jnlN9jPP3c6rnPqZPuTc368t/sLV3deHdMUjPrdlfC3h0BumqujImwP
 tKJJuyXEgiMfR6XgmzA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27e40b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Yq6uI0ozdmgzgeLbScEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: eB5zlAwHDrg5_4vHCTzPIqfhlxFkhWO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090092



On 05-06-2026 18:44, David Heidelberg wrote:
> +		offset = 1;
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +		break;
> +	default:
> +		break;
> +	}
>  
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +	for (int i = 0; i < lane_cfg->num_data; i++)
> +		lane_mask |= BIT(lane_cfg->data[i].pos + offset);
>  
>  	return lane_mask;
>  }

csiphy_get_lane_mask() uses pos + offset but the 3PH hardware encodes lanes
at pos*2 (D-PHY) or pos*2+1 (C-PHY). Fix it as:

lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);

>  static bool csiphy_is_gen2(u32 version)
>  {
>  	bool ret = false;
>  
> @@ -1155,19 +1165,32 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>  
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>  
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		WARN_ONCE(1, "Unsupported bus type %d!\n", c->phy_cfg);
> +	}

Also, with above fix in place, lanes_enable() can reuse csiphy_get_lane_mask()
instead of open-coding the same logic.

---
Regards,
Nihal Kumar Gupta

