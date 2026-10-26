Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027086;
	b=PGyFGvMG0+3ivJOdJnMtsW7Z8WWOr7wBPr88Dl+UhcRZMceeSkrIBhSLq+QqDckj8ofF
	 NI0Eop+s8n4BKnzk9l5APHgmkwxNacUx3CwehoucTSBrgq1LSXhtlZiGqLxFEbvhCCXxQ
	 LFo83sAkwbn0Jv73g8eu43L4r0twtm3hrqYyWVh/39W4vCM/h69+Y2qzvlIvVmo+RZz/R
	 jBbpPSlPHP2To9BeHjp4dsw+rV/tRiaE6GY11qCq+YWqsiugvseBacDgK2EJMiEJgqj3m
	 HJEixYk04AerI5IqPSYDeiDFVjkgT6Rk5htcumd2cpMvVdZf1pkbdtw9VWa8G7AdZ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
	b=angBuZIpsxe2Iem+nYXFUqOGLqEiQfWDXy70C4dfmao1oDuCwwNEH1i/9AdLkf5fW91y
	 3g7CXX7Ra4CO543M7l1pObV2wgFIcWNzhbfdqquqpcYvMkV+xcluKK4dT2/PmDCvGO1p2
	 YN2WzjSXLB7Y9qXOyrq83Y/PFJLOriG1yJMV+ePQin7a2rPNupDs/Vm1QlVbBV/1fD8P0
	 Cm7INaeqPFQwnjEl9JsuNKnp4H/H7wt3E3AuRg33P1r7BCKCNhfNx0+EZEbtq2ByuEGgu
	 4AGIsfbjyUcJQWUSOoC/zpwNh6crDPQnkDe1oyAG5azeWfxKt6bowNsl3hp5ZNQMQyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQCM+Rmp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hi3CS/w0";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083F606A33A
	for <phone-devel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6083F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQCM+Rmp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hi3CS/w0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwDD13584926
	for <phone-devel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=; b=MQCM+Rmp+OZKHlj/
	ciKNByeD1VCOEeHm/cod6l/pyvN2YTQHAFlhorvZqwiKHrUqvJkCMMcy5+8NzsJe
	dMMeh21KUtXzbdhwyWnjSTWfoqDqaz+ua+npTwqYYVPbVaR4wcuIPmXxaV+Z0Soj
	7bvziDtshD6feN3rD3xS4cQSlN466v/4zq9C1aaPSG7sL5YezH66fQWFD4B1SgW2
	ANjibawOqc4WYIMXjujy6A1t0z72lzPVBkAtQJQnbGl+/fMMAOcyHF6r9cpgBhJE
	oDxNwtLwXz3Hw58HMTyQswM9SIaYHH9TunVE28H5F6B9VDmUJRw/Q2bHUg0ZM1dv
	zrVBdQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddaqq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:45 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5190bd05881so552077b6e.2
        for <phone-devel@vger.kernel.org>; Mon, 26 Oct 2026 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027085; x=1793631885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
        b=hi3CS/w0VZhpnvpAzVfNK1wzX0z9QvpV8ZWs51pe3ru7ISKFgRpjPHnnoGHumVU6qr
         f5DOUQt00G4rL0bQe/BEXfvgBFAzug/jtsdCOuYpn+lRZyDSeX69OnetF74gB/0AGby+
         Su3o4a4D7xdrMifOcemeeE/7vPf6hs2cWiDdXTrNugPCICgLLWn0BQxJNodWyEz6KItf
         UpkItjM+H52+K3Hnm6ZZJrSIkbG1ZnCWArtwtseSLBifS8j02eVJVPVJgNW7vi10dQ/l
         UiGUBjCFqpV4OSARb8Sydc8r3QEVh/B62xeJ31LO0ZsZW1t6OzIkXvrDfjCIjhMyEt/C
         jQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027085; x=1793631885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
        b=hRVCl33XgccSRmiCurLvEtpZK8d2PVSScpRUmzcG/jAG/J7IdyDdL0yJGcWlNJJ1r/
         VzTA94G9j2Tqfg2KOlxdWRFJ/4ggfs1iMap6sP11bosuAPzY/Au/VY4WyS5Y5AzX+Heu
         /kQ81fXGAStUX5xQZLr1VV1rjiobNgBagy8lA9F7VIYLp04xkbDavk0pwQyYPcrWjhGI
         ytwtcBGTbF7nzDcpn7/cROgRJt99lRG/G6kbq1wvB+XuPQylM3AnNxHUHM2rSA+eSb3f
         1hTy16XNuf+0uVmAQXAiDc2L6tsRZJBvb10ct3oj3Bg3vIVfcj/QHKbtsOqzJdG9hMWS
         EUrg==
X-Forwarded-Encrypted: i=1; AKwUvBwMRkLOXomj7SUMR4v9iMXMU3LMbVkuo/brY3WVHLpiQ/DmL/d8Iv4fqiU9PtDfYokL+qmIUcvAiRXqzA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnP3hm1y9aw6M5u/+b2zbrnZjHOmyYNM4GM7v8UihPwyCqqc3k
	09gwvMdhuy6xmD3ur9mCyitelk5qSmgVJrAfhnIpkJRmGA3gMkY4rRTWmEVQVoieveB6SgeIEPL
	XM+KamMnRLJ8YGK33sz/+12ssQkS3/B1kiRA0L/fxQoHCLSsPqOfA/4bX48Nyjwkjpg==
X-Gm-Gg: AYBFou2y2lWX6TMZI9Pcj3FUl7JvgeqCbtEFn+OyXZ6byycTjbvh4FjPyM3Ai/31s55
	yHJS/koT9h658uIGBFkrZAnF/AadXucRtbkSxqgsfvnei31PDOB+kHZy4Ubib8fLg16lsZ9qtHD
	XW4cTTI/SNDHf7XkPZiUUM9IX60FZpSbpbQnWoGItbuCdQR2JWA2K9vwkHMqsi6o9s1oRBBlR1p
	rpaYD4UeyuFlgzxCCyARFFPROCOfYEXj0K+ARSrwJ5g15WVeCbpX4eQi27HPrgSt5M5AqqN9y/v
	toVS9rEhhmYr6vta3wcC/1z2En98athUxa8NqB93Wz/d/33GnM1HDAr3lZ3huFuPBfGD35yGkEi
	eCZSuyfQO/laroDKpI47ikQ==
X-Received: by 2002:a05:6808:30a6:b0:549:e9e3:9460 with SMTP id 5614622812f47-55bffd26cf3mr6808479b6e.0.1793027084565;
        Mon, 26 Oct 2026 08:04:44 -0700 (PDT)
X-Received: by 2002:a05:6808:30a6:b0:549:e9e3:9460 with SMTP id 5614622812f47-55bffd26cf3mr6808389b6e.0.1793027083999;
        Mon, 26 Oct 2026 08:04:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e70asm3844350a12.9.2026.10.26.08.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
Message-ID: <2d4e66f6-7187-4642-9371-4385a46bbfed@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:04:38 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org
References: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
 <20261011-msm8952-initial-support-v5-7-1857074992ec@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-msm8952-initial-support-v5-7-1857074992ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hwPlZ_ADDNBt4YMgOJBuZDodqwqpjB4e
X-Proofpoint-GUID: hwPlZ_ADDNBt4YMgOJBuZDodqwqpjB4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX8RcB4ArQT0pI
 kFdr946Ok5Qge0Sfs/X0n05JxfIJQCqTaNmovDHk+k9BLvOJQ2myb8Btu7w30X8ATDkuzMZlnxM
 vXhaSKWmNKkQaRgiokEaJvsKwiFc36Zyco62Ddb235vOudSLZayQ9GBECpn5ZBMq18e/lsGosLM
 HNBsW1hPJmwLlYO36z/izCWA5I7BXFUDesarISA7S8f4UqibEc7ckqTMDzzBB9hBR/REbHxvYgO
 Dfu87Lr2w+1TblZyDF8UIdXFH1Hiq8tP2Jig4ShVHTjgT7kmwFfzunDE8V1dixGnDUQgCOQYUtT
 vBhvgSwsREsL3inidCZ4roKYrpOYYS53uCYIuZx4yMaXR+irQrUvUkgggB7p8iT2b9aPyUZFct4
 VR6uTEVkKzzX9t3eqgnLyJMovjoeaE2eah+xIgjqNFIhExGxZ0DH7iRzMslvtn2cepkhbWXKGHG
 YcG5I/32Ta/dmvrONfw==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf6c0d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NCdQflJRAAAA:20 a=OuZLqq7tAAAA:8 a=CrGEZSrvnsKXYSFoqd0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=efpaJB4zofY2dbm2aIRb:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX644hIqEHSeVW
 cOUbHnUVegQnfJeP0tNweLbeXswOHx6UnGttKdBiz0jUEBtWW3jkqPjyH8LgdXMaUZxLdlt5ykB
 2N7e3IrREjKbIqUGjgrKYDv8MjjjghA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 10/11/26 6:51 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus). Shamrock is designed
> similar to L9300. Downstream reference is [1].
> 
> [1] https://github.com/Asderdd/android_kernel_generalmobile_shamrock/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8952-l9300.dtsi
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

[...]

> +/ {
> +	model = "General Mobile GM 5 Plus";
> +	compatible = "generalmobile,shamrock", "qcom,msm8952";
> +	chassis-type = "handset";
> +	qcom,msm-id = <QCOM_ID_MSM8952 0x0>;
> +	qcom,board-id = <QCOM_BOARD_ID_QRD 1>;
> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_2; /* SDC2 SD card slot */
> +		serial0 = &blsp1_uart2;

You need to enable this console if you want to use it (stdout-path
also points to it)

Konrad
