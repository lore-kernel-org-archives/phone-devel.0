Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A72673BD
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862331; cv=none; b=OXY+lLxpvwFAFRwU/gmt/Wyry6SUpSE3BgSDe2SKPTevVtTTWg9uqFFgFWxn/JEqahz3y6LStslAMnmkjWU4Xc3eb6UzD5bMt7IsberMgB0UKgOK46F5/mAf26kYnVvdAy2lgKP1kua2VJnCi7pEEw4JcMzG7kCqJvr9M6zx9bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862331; c=relaxed/simple;
	bh=gUCK5ZPtvm6MgHUIDv1wxFAc1ecbFd2rMDQC/jqlAuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8qmWgl7hnROHSfTyAHDe5nrIBe5gcs+wsj2Do64OYUFSSJYqqUL62RCWXFt7VcGfJBE86CJVmjFJu5bhWbiVOMWuz98bEsfBLeaYVKxCSVuQgbHsI4iEFOn8Yt/bi6y8UFAgmQl1HNe90ASW3M51K1ypbUqgXk0Bso4WXRuuSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ky4Ffp+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ky4Ffp+Y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB4Pt3001124
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyp603+DXROKlY8+1tRFEeF1aiIPfGdpzbAJfdYnfMY=; b=ky4Ffp+Y8DWJ5sga
	ATB71pj5U7o5cN3QB6T16JQmjj9MVT+way4qI2/Jnj/Bq/MVAyK1OeaP0n9T1lsG
	nYFZroUkLr3jSm4w2xC4/5tpDKeth0qamfd4HVCm671aUtqZ9txeItoWat8IPjuZ
	2zXLys17vwfBwPHHcAxyy+fdYMxni94WDpwmBRkWcFyZY/4sNf4iug5HnkGDE9io
	G/WnjXSB8FAkJYqH7drWISk5RktaYC0S4QOykHl/T0tPfdjGsqLoKtjtAGZpCasv
	HrhG2PqWoVhlMDa1QH2fv2l1Hn8eYWKj3OveQhgK2IDivLOiIsbTg9NNaMwKxGqJ
	WuP4LA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1xta7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:38:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5ae436badso14503911cf.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 07:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862326; x=1751467126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyp603+DXROKlY8+1tRFEeF1aiIPfGdpzbAJfdYnfMY=;
        b=uLfBrwK+leDY7IWjTfyIvd8KTF1DDlJ3C0hLhB/0sUtCCxxROHtfmrXuYWvlh6Cz8a
         siwfnRHc32FbLduRrM/TRpvGPAW9GTwc4miI4VW9G7/Df8e693RKQxikUnQtFUZ28O1V
         7CxC0tNZkeopxkbLHQR60fk/kM0C23+gCO/9ehT8BnyuR4yyRIhHB/aps2a0yBk2DfSY
         eS0zyK9+UVgisETo+VzSS6B/LBFeUOGE2fb+sdclnwiAsOKmVEenezV6ve76sxbTwJXg
         ec6BjNRY26arICC9mbAa8Y0km1q+CeCcqrOWkQ+RUPeJbIgfzyxPWj6D1nFmJErvN0St
         Tg2A==
X-Forwarded-Encrypted: i=1; AJvYcCWxV8Ao97Gena8K7sati9OjvtpCzrGODz/sVnUeOy3ujYezmDvGsASUxjxnJnfPSX/W3p2o8ztau2qi+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXLsgsvrIg3eF8ZIwVApS07SrazkLb+L8q0+mDi1zRV10ltEMU
	xu0NHBt2wDEdVRt52MwNCk2Nk3d2XPZnULskXDI9nHKvSgHt2MJWPSQ+iu5vMQF/Km67I1DWJeL
	sYc/CS0e88S9LZjh9Iwzs4e9R+jxDyW1BHphM37MfmHiKOSpy9l9fjNuD2ewbP5MZ8Q==
X-Gm-Gg: ASbGncv7qhFWDpAU+mfCCZ9OHVharl+W8ynEc/sJ3UekZJUSDZuPfhSQEMLk17lOG3x
	PcLl1V4ybt+hrYEQWukm9p38zgiNHeUQVsDx8L/9A+QzI4fLn/EHpNbi8PA0NzaCojPiAPNc7eb
	o/PyDfO6mHkW9VuQ01A2EZ7Dut1FfjZEEsv0jSFynNHQ4O9nC2bxHMqvzRYNJwozLzLNChRc8de
	AqXfmBaXQWk5RgKzsdz6an6Xu0XWwn8Ipi7wQ0ItdjuegxrA5gO8vescl3QZqpm/AHaWmAiaDMB
	KihskEw7MiwWAT5LhKNMziIme0Tkz4h46ZZN1efYod7y0V9iGIQdPvx7+LvuhyZBB1I/4AQ3umA
	pw6A=
X-Received: by 2002:a05:620a:4713:b0:7d3:cec3:3ff with SMTP id af79cd13be357-7d4295fddb1mr179160885a.0.1750862326365;
        Wed, 25 Jun 2025 07:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHsbOpyUO4OQKuHvZNG56/kH2wg/UDN88jgkkkppU/y2V4JJtDrErgvtJkUii1DRKOsax2AQ==
X-Received: by 2002:a05:620a:4713:b0:7d3:cec3:3ff with SMTP id af79cd13be357-7d4295fddb1mr179159185a.0.1750862325910;
        Wed, 25 Jun 2025 07:38:45 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4cdcsm1076068666b.56.2025.06.25.07.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:38:44 -0700 (PDT)
Message-ID: <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:38:39 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: qcom: Add The Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c09f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=gOtRruwUTqeMBgDD9hEA:9
 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Zvp4RsOXcTtia1N9l3GvIgL3cEOCdEug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNiBTYWx0ZWRfXzj/9eadBfut3
 rFvEzraaQw8/K7yMsFo0S/BqT3Twey5bBevFNFgASwHBGpW0Rw+HfYLJ9jkAVHffvAuKlC0/JYa
 7sQnd9F8uW02/nud6FHN+yftlM3YYnzqH0ONh5or8jwFT/Yx6qUFZOd5C4PvMJOkIjbqcL9w1Qo
 2P6HQ/SsJncL35obNecxzmo9qj1mbo9d8i//xUOlU6W9RaXotVNs6fcYFnN6vcbVd55dHNjfu4s
 dT0ekMO06hyb9hykLD/X66PP44RKyYKv8oBSiRYOAbU8CmLqVBEG6Leot2dieLOAtule3EHLXYD
 V1rQsCH0wSh4C8qUkP0wUerr9ImsDxY7XbWXEht8KmBhIkQlZTLB7DDgEt5icrtXMnv+SYkOr5U
 z/cogkHVfHPagvzonYJYsgQVzmlAHNKWz2xjj2ZFyDFnKxe1NCo7QK7PjssVOYJrEWONSKvd
X-Proofpoint-ORIG-GUID: Zvp4RsOXcTtia1N9l3GvIgL3cEOCdEug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250106

On 6/25/25 11:23 AM, Luca Weiss wrote:
> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
> on the SM7635 SoC.

[...]

> +	/* Dummy panel for simple-framebuffer dimension info */
> +	panel: panel {
> +		compatible = "boe,bj631jhm-t71-d900";
> +		width-mm = <65>;
> +		height-mm = <146>;
> +	};

I haven't ran through all the prerequisite-xx-id, but have
you submitted a binding for this?

[...]

> +	reserved-memory {
> +		/*
> +		 * ABL is powering down display and controller if this node is
> +		 * not named exactly "splash_region".
> +		 */
> +		splash_region@e3940000 {
> +			reg = <0x0 0xe3940000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +	};

:/ maybe we can convince ABL not to do it..

[...]

> +		vreg_l12b: ldo12 {
> +			regulator-name = "vreg_l12b";
> +			/*
> +			 * Skip voltage voting for UFS VCC.
> +			 */

Why so?

[...]

> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};

These can be enabled in SoC DTSI.. it's possible that the secure 
configuration forbids access to one, but these are generally made
per-platform

[...]

> +&pm8550vs_d {
> +	status = "disabled";
> +};
> +
> +&pm8550vs_e {
> +	status = "disabled";
> +};
> +
> +&pm8550vs_g {
> +	status = "disabled";
> +};

Hm... perhaps we should disable these by deafult

[...]

> +&pmr735b_gpios {
> +	pm8008_reset_n_default: pm8008-reset-n-default-state {
> +		pins = "gpio3";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-pull-down;
> +	};
> +
> +	s1j_enable_default: s1j-enable-default-state {
> +		pins = "gpio1";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		power-source = <0>;
> +		bias-disable;
> +		output-low;
> +	};

ordering by pin ID makes more sense, here and in tlmm

(and is actually written down)
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

[...]

> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

\n before status consistently, please

[...]

> +&tlmm {
> +	/*
> +	 * 8-11: Fingerprint SPI
> +	 * 13: NC
> +	 * 63-64: WLAN UART
> +	 */
> +	gpio-reserved-ranges = <8 4>, <13 1>, <63 2>;

Please match the style in x1-crd.dtsi

[...]

> +&usb_1 {
> +	dr_mode = "otg";
> +
> +	/* USB 2.0 only */

Because there's no usb3phy description yet, or due to hw design?

Konrad

