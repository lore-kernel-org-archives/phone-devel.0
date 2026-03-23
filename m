Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D35390CB3
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263158; cv=none; b=bO1Fs1JDDFLdfcd2+imTPm9CDShjN8v37+70R9UWUdcXgK+mbSW/heur2P90vCMRmrbzmivQMjdzAo1tguUO551y4l2Mk7BFEh2bhPy+iuD7Ghaj3ALj1F2SsjBTMZFWBBRePHtcYSgaEk1rEt3jI0VsiemcEHIbyFCmeoquMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263158; c=relaxed/simple;
	bh=63XuFVU91Dh8SfSSdrM5+ocQ7GwUchBk8bh+oStXhDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tY2wtxZ2pSIdUkd0pX2Yyf6XoSlztD1NSmmQn1b0K5lomMqg5yVW0B0mvpf2VyL2lFgZsSJAcal7Fx4BZGDPUWrWW6S139NM949DG3PJYZ1UmKYlP+ftjLawegnXGafpFXypt+xlZW1k4fMHLFSfkKrE8nvMAoIDwJVlGDwjYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4YRlTuY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dt0qTXS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4YRlTuY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dt0qTXS2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9Yod73685978
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 10:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=; b=D4YRlTuYV9+HbP+h
	C9qWOHmabtiG/YpE8C44Os+PkPwuSsgv470MvbTLBu1cJLexmJYPMSIymkxm63uX
	TniOOWimoO2GyO9WWQ07OHTMtpESEAFDU/YfHbX6Jwy+JrKd+/0fyQH4H0QoTxPc
	zgJSwZjHRTtcjoZgg3GMjz9WI2WqNpct1N/wywuChvn+8465WHsUouLIeB+hfWi+
	nOaNhy2qD/GiwKWb6WmHRzg8M/duaNFw71B/Tb+rkPzrlvD1+7ma5kMA76DNPgQs
	aFClfIo3KnpktOxBRuqqjDOF6Es/CYodGmy5iGUfwNd5mv3hBRhatZZXmZdk+Isu
	pAH/5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5w130-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 10:52:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ef8c28cso18977221cf.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263155; x=1774867955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=;
        b=Dt0qTXS2bJnydMieQWFDYsGzx1TTEBjfqqeGYnCkfe9JmOR81CoIIHLcaOtc8608au
         qFk/k8lhMNZnYf9qqzZXZ8RIk3JH4G5YYW1KaX6alv/oLVg7sGcFut9lOEMSEW/gKXtA
         h0VwH9GF5dADe3ejP6S+IfG4f2A0UB9LXWunPWizJQPgWkZPBYHdDQ/SBT3DYAdmRHL1
         ViRaKO87ZnOQR2a5DoU53Uk4ZpB4V2zmyGXWe9YhUEVOd3TW+YsakT6jGwI/mMgnvF/0
         mlWIulTVMGYHsFcooNKJDSSqwC67ZjW3ap3xyrFNrDbRbmkItWIoK1SGCsuW1uKCJs2e
         kkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263155; x=1774867955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=;
        b=kyiHLK5+C/PltPxTXVoS/CdDmMmvEuUliKe9gzKMzqqFPx3a76NANJJXal3x8vgV3J
         lIMQd5Ut+AsFG0Abzff0SBk6fsgUY1rcFGjEn/Z9P9qv0XQ6hgINL1voUOMCgDihpERA
         fb+dmf2IeSEprhGvIu6Tzb0xgRsCzSh/yO3zVTjYKrxaWf6E5MuAcM/OTVZD5MD1jwo/
         0sutV1Wvx8loGUBGsFWv9ALkBKpnchPE3n4sW3w/UTB8VLz21iC5ur0uuO+mi2Z0wAuA
         X/1fwWZjV1kWBkiqXYYpcH9a0vkyJR/Ls47OKdACctPLKv7vyvqNfLzF3sTISC0KlN78
         439A==
X-Forwarded-Encrypted: i=1; AJvYcCU2jykEkdXism/+XSHbAH4H057CfwL+pAwHkSrUAxak5ETxRdObZEK3ns7F5SiZkskCt+CucK0hGoDQvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0upmkZi8w4KUnvdh7OlHpFHXd9uDfKTyiLlLD2usiKU91HdX
	X5apHYIOJ8Zitz39b0JTUJQHwHQoSONrZuT8uXEN7JB/VcK6CvzlFoFli3i5CTWhPMMfkUz9ehF
	uPu//z6Pl8wmRHEOGM1o5bx0/PzNJFQlraAY/w+wFF+uzVoOtHbtc2zU54RKnwK+OVA==
X-Gm-Gg: ATEYQzyDWva73d1OX4LPvXjwW3+JjPrz2w6kXJ8PS88CQpJmfw8MLrpMElQRUZq9E4S
	oXDfU8L61Be9tD4iGDWb23VSkFFn0CyNQzAVLpT1AFdiC25CfdOqazdgI8VgGq41HiQzBanL4+I
	+sswQsjB8vai0lw5Hk3IrSl4+nlRPQq8mJxSTYKVTfyA9M7zGfNaKtLbneZvOkUdNmXkX83qctt
	5BouzIdA8HQGsPSkYo1egREpB04+MhS8VWc2NCRsqynH5nCHnT+y7d1sufcrW6dJImquyhTmLV0
	76xJkCV0wxaTFDgRPni05VMrtEalvjCDH7clPDgrDB1O/tB/W2p8FI4Ji98PUTECwdmUc87QEPC
	W51KtiFdUdJQXpswKLTgKI3LSBEpqEfts64IKftIzj2mF3ZcO/ytzRmmZDn4NyshTEpLAK+DbGW
	0XAsQ=
X-Received: by 2002:ac8:7fcc:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b3739034cmr137536511cf.1.1774263155423;
        Mon, 23 Mar 2026 03:52:35 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b3739034cmr137536351cf.1.1774263154936;
        Mon, 23 Mar 2026 03:52:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871a44sm484502966b.56.2026.03.23.03.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:52:34 -0700 (PDT)
Message-ID: <109d21b4-5d16-4689-8383-ecd29bbbf8a6@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:52:31 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c11b73 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sfOm8-O8AAAA:8 a=4mdWWUweJ5RzV2WhxXkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX6fioSwqwtmKF
 2498HvT2CJE5FxBcuv8+7O9H17Ff56+Y1UgnnjQPStjDszASFkpDgNTZZ78e1dQ/Cs/vn0vaJLM
 TKdjOtQQSPOFRX7Or+x3pDaKKYRFFciq+Ki9K/YIGIPIa04fUm+CttXEOjmuTqlowVnSyBygh0U
 u1fSEFxuqUAjNl8rsvO9t1NF8JpIx/dpxTkpz+OT1+JYmoq/bq42cMc0Hpa2qoYHbxhHenFCZQF
 NA/iJZM9VnyUcc6HSS3mZVvg4kx/6XH2xdUqo/C3UiIVIM6qV07jC+G1a6wFUTfvemh3KjVk07y
 HjiOCIKWedG0v52alSc5VcKHAfeG/stCnljPNtZdXe1PaCvA9eHnRwQLxuCwvdXDU8AFs+Itr+X
 4GsGAQWaR4vDnZrOJLa4PGfwh8hhRdvF20x0aJ2m7BrtyUycOGLlplfKjtB4Km8Xdfv0ya0Kh0A
 cpddAshY6P5d/2vy1FA==
X-Proofpoint-ORIG-GUID: kcQHxtTu5z4_6hO0tCYMldv2QqVDhCu0
X-Proofpoint-GUID: kcQHxtTu5z4_6hO0tCYMldv2QqVDhCu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230083

On 3/21/26 5:23 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

> +	panel_default: panel-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;

This says "by default, actively drive the pin not to reset the display
panel". Is this actually necessary?

Konrad
