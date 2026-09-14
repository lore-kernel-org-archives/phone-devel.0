Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB60440A0D
	for <phone-devel@vger.kernel.org>; Mon, 14 Sep 2026 11:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384983; cv=none; b=UO/h/cZUN5RmvdjA99GEoT12eOlRRAbgox8CrBs7GXrcTIYUEL+oGBsXv7XMzCJVjOOs0sjd9R14cGSB+EYTOlX19BGHvpSgbkYdZJC5cXfQzDS+AMXHiVFjLUDHzTcjtEymQ8kbLjbWDp++0dmGR6sipuLdsaY3CxLxMeVpF8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384983; c=relaxed/simple;
	bh=qB15Tu0wQgvflvACMlEZFwV6PZUUfZT9UV5fY5oJj88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GO+Sz/g2Ph1eyItLcdU+2IZMqUhrDjWTQ57udvAQLsoJ3XCCUOpOvGtfJmQ3hupDRHIbK9ZqNu7wYDY3SrySO0V5ofUFXT2nqSKP7rsg1xx0Db2U2fDbeCsAXl77Of0dPGJvx+tx2vItayH1jqHh1+X/wlezhNptc+DjqJgMm/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6eXEJqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbSSmiqj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6eXEJqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbSSmiqj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmho0216178
	for <phone-devel@vger.kernel.org>; Mon, 14 Sep 2026 11:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=; b=V6eXEJqaW52sruVW
	KmAWqHedQKN92ge5YENWkiPjd+G4FUiYoi+rXuXHOXCHct/s2ruBO47fL403iyAH
	2SylfxfndayU9tuNs74mBf0Xj12d3kC5/2MhrMELYG8moOkZhHp5DR7YyqO0kNHs
	0Lw7qkc35AhQS+AgFCbu3IoOaFGpMQF7HP0nvezpOH9EjkcQG7/eI1EGSaOHqhHE
	tAFRbnOZo/0zdY6LMW69aKrcmdFxfdNVAuR98oQs9x/NZr3V+VuTPtOnn+xGBeb6
	5M5JFDIf2VvoFSBwfEjJixhhuEPdxOYVn7knVSt6iSa8pTvUSJQzCq5yrtQwVTO8
	3nO8Vw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9decyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 14 Sep 2026 11:22:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso7384416d6.2
        for <phone-devel@vger.kernel.org>; Mon, 14 Sep 2026 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384979; x=1789989779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=;
        b=NbSSmiqjeCKo/7htIxRiqc9gE2PcV1Q7p8dmTkl+j/4OJk2PL5tJZoj1wdGKyXYVHw
         v3C0uW7PpJASmr365zd2LqZ2BNQSLRX7li0iOZ/NW+gnMMxSVKSOa9RtNS1N5LzUOOZJ
         UQM71WGXX23r5TpXYRUYGMc8PjUP7svaFNfNsPi7bHHzE1NsrYYgjCnXTiC9IZI6faF0
         hJWKuxpAk25y7T9fcZ0lasFHS+J1Zm5OXdG0PlegJOqcDH9mC3dyda0P2dJYZ9sqZDLC
         SwKT4cZa3VWimn+mSV4C/7F3C5VoicAKLC0msKxIQxvsBSlGCx7iHWTRGaUtm9R0Ji3O
         SqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384979; x=1789989779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=;
        b=Z8rRCXuqDeJAn6YeerXi7gr2eNGgCnMRUkKb/1/TrrU9gtBxpyQX1sXNeu/ZrdloAz
         PEqiRpkaB0OL6YZLzBBQdCxnrvpqXjVD25DeoXpUutCkKPgifKPhh56kM2zk3MsJ5dgm
         OpM8sXWfcwxfeyk/8rbLi0Pgppx3wdeEsD5lx4Zk3oeoPPWmIBN0WyvtfGHsKH757ok1
         yD7gxjso4LGArU+/htcSBT5J2ZOJGP8TFCM9GFTeLDoPQDzy7aWr6x17GYrprghw68IP
         ZMN8dM95FOjSUaLR6WtiGoV2rORbNNkkJ2mzFuzcFD8r7GZIW0A4/DhiZclZ45rY3UdD
         t/wQ==
X-Forwarded-Encrypted: i=1; AKwUvBywKA4Q9ZCjDXOrk5GnnyNOVORCmWscrxUKYpJtA59smAbuFnPKsLJt6XPHGIlzB3GmTwq/v7hqPbvtuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nf0ZowN6utxH/k3y5K8NKcN6LgQn8Nzjl5tDA6b5gqUQB1qyHr
	TjUBYTAsPK9Di4N0W6eDRY1e2uE/da20bal4330Ye+CpVvkYdYnCFxGclEb2qE+Y1mEzmORbLty
	PwrrvziCxCnkhkPCj4ZVHS2X5c00N/mQwphidj6GKwopsXUj9ofEllX83jS9zRJgmFg==
X-Gm-Gg: AYBFou0/EILOBwLCFseJnt8hMMJh8wLrEDJOg1EqkTak9VCFs1PfaIofEv4SSam//Yv
	D70y+wgblGY9vWaXJ09BEd6Xc4f8b6R7waJVNzI3A2t+DzIbZIapYFtnezPt4wgVtSqfDbsyyTn
	5TExmbOdVugwiwVb4dd9Uiyz57hTbwWiXXGCPRY8/4AL+rnROik4fBm+GrBeuPoaI4a46qtBfis
	cYs5hM4k/xVQh7sQSKHveu/sR0Ug12cG+8moA7vnXnNtKxu7P0jMz0ghSYIInC6jsawNtNZK+i4
	Z49fADUepj3wTuhKiklKeMDiOj5/on3Mmlxv0DoMcbdbVcBgcrPJ3rVpAvXl34ZJgD2Z+H5yjkN
	selWwCyudphakv8eJ8jlBgA==
X-Received: by 2002:a05:6214:4883:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9122e4ccd58mr27341566d6.1.1789384979355;
        Mon, 14 Sep 2026 04:22:59 -0700 (PDT)
X-Received: by 2002:a05:6214:4883:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9122e4ccd58mr27339976d6.1.1789384977653;
        Mon, 14 Sep 2026 04:22:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594f0fasm4216719a12.25.2026.09.14.04.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:22:56 -0700 (PDT)
Message-ID: <d0d7e3d0-15bf-4850-99ec-44d429c6bae1@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:22:52 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 20/20] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX5tenPk6/w1Ow
 FOCZrMQQIpagd+GDc53H6D1/0sWfAdagCM6aOM2w0Z39DJERJR+qxbALVgSa5k0bOdZXiUbYmML
 5WNeVozE9MPGWnWd+Ryt2v4e1p7tqevPDK9sE92ZYU8gRPfwopEs8mXva3bZUZTxbDiMrvGnvry
 f95vsDIo2mNbt8aIvBRMy7jlOZzKpklKGmJTPB52ZwVk9BUYbG0Pv6U6aSNiNYklYxqHZo/p0md
 2L16TXGhks2kk3iEbTg4rBn70DMEhTjTy1oUFSasLtwTCatIl8v7remxntIKlAR/UGtJXVMJ5Wk
 8aVuKq2yiBNha9EgPnbZA3jrUED07l6nz9Xss4ariE72cmwFfuvSEMdRb09Q3xndlNYLfMfD9BT
 MC5PbqVBe0f2SS8TPyNdY22pbGrGIqRDamWFsN91j0FENL5O+8z8ZSufacvRX4WmgkU0AK4/HXp
 y867q2Hd1aT+pmzJRsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX1XG4mtrR9axY
 J2Xe57hwo/tm0jFhUWJ+o741uD6udtfshLAil59dMsHWt9aghAnXmTFexdXmWQ3z1ZOvhq3Lqiv
 D2Cs5Q9th9DOwntU96fJ7+R5L0E24W4=
X-Proofpoint-GUID: 3Lw3uPJgc4rocgezctQeehytdtiCTwAM
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7d913 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OuZLqq7tAAAA:8 a=orgwjQpZXFS75ENpSOkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 3Lw3uPJgc4rocgezctQeehytdtiCTwAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140161

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus).
> Shamrock is designed similar to L9300.
> Downstream reference is [1].

Please feel free to
wrap your messages at 72
characters, otherwise they are
a bit hard to read! :D

[...]


> +/ {
> +	model = "General Mobile GM 5 Plus (shamrock)";

It's not any "policy", but other DTs tend to only put the "pretty
name" here, without the codename


[...]

> +		framebuffer {
> +			compatible = "simple-framebuffer";
> +			memory-region = <&cont_splash_mem>;
> +
> +			width = <1080>;
> +			height = <1920>;
> +			stride = <(1080 * 3)>;
> +			format = "r8g8b8";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_VSYNC_CLK>,
> +					 <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_BYTE0_CLK>,
> +					 <&gcc GCC_MDSS_PCLK0_CLK>,
> +					 <&gcc GCC_MDSS_ESC0_CLK>;

Please align the '<'s, make sure your tab width is set to 8

[...]

> +	multi-led {
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_INDICATOR;
> +		leds = <&red_status>, <&green_status>, <&blue_status>;
> +	};
> +
> +};

Stray \n above

[...]

> +&ramoops_mem {
> +	status = "okay";
> +};
> +
> +&adsp {
> +	status = "okay";
> +};
> +
> +&lpass_mem {
> +	status = "okay";
> +};

Please sort the label references alphabetically

> +
> +&pm8950_spmi_regulators {
> +	// PM8950 S5 + S6 = VDD_APC supply

Let's use /* C-style comments */

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <20 4>; // Downstream doesn't use 21,22,23. 24 is mdss_te

Let's keep a \n between the last property and the following subnode

[...]

> +	tpa6130a2_default: tpa6130a2-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +		output-low;

Drop this property, the driver will take care of it 

Konrad
