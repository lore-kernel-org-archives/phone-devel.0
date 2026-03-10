Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E03BF690
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148128; cv=none; b=D2+ywW2cya9TaHEW0gpmBNHWBPE+90cBXuEHIH0B/4Wpwv4ekcbffCQ5lkhim9wV3vCT/Jj3sp89XBEx+mZ4IW2leO5//royCIoCorBCZL7UJ6wLm9JOT82WICMlAzdsJnk9Izc4dsu4at0TgSFiOTm8KMBMYW/s1vJDJkBQWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148128; c=relaxed/simple;
	bh=stHxacrGV9KcZ4zqvwZhJDnTd1vC4ABYqp/A+JKkwRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE2i3FPOeRCD9x8EC+MjJhUKE6+BINupa4a6sTmakC+PjVtWKJhbyrQDFrWhymljff7LHFue0VB+0jRpnNCx7pvjC2S12CjcMTKahnPZNJrsNOaR0n1UFcVLNC466oe0A0xVVhWrNZ9RtobLcFJz82UMwyrhmarX4vbk9r4kC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkRo8HVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/fzimb0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkRo8HVJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/fzimb0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUrI963315
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8L7QotNediNGV0w65apbqeaG9lSdLcK+7UQkqiJf0ZQ=; b=TkRo8HVJ/OdwumuV
	b7NJ0vZ1WRCQVVOlOk5E9TNZIsr6cMmBG0uKzqGarvC44Xb3qIULBifw6c/WuZ+W
	HsSjggXpd5Dwjqr/1qcgO3e9wMmWQRyBvoSqYpHgqKtNFBmxps6ZrHIZpXtIk+ZA
	xmCCL7aR39KxPJ+l4xHRqFJTItMuTRdiCdfbqBogBmUM6Mq2rPDUHd6CJDv07Z3Z
	ArD1jeAdHfS/GWyMEmO+QIqtLpHUTOshxOLUfs7sIWRL7XoErPy7+UftOu1i52hj
	wwN7+W2DHY4nm0zG98aIyh+luKMaCfzpkcgHEm5s/a6kEzrvTgsumUWX6pDUfnX5
	Vf9rEw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477k9k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:08:45 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ac053469dso950442241.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 06:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148125; x=1773752925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8L7QotNediNGV0w65apbqeaG9lSdLcK+7UQkqiJf0ZQ=;
        b=d/fzimb0aJMQBXdxafcsrZXwJsGOn00vdWpNaHZx7sg0k+5M2h36hSCbspwr0Q+PsN
         2WR3lBmpEg+4Kj7PlYxhiD/azVfBY6Jfr4RIgTAi5A9ueZvecTLOQ7eeilJOk3ojoRxz
         SR5UBwA//LmP+2hRrZVaseRtajVu88XdVcWGVtI5SA0aYIwQDPdvpWQVZ58K3k2bp8zX
         UPdWHi3SSGHtjVV6wYpJYo+/2yQ3LNGkSuH7Vg0nc/yZsNQNHjy/KutW4bxtkKHJYvor
         dTabqnJefUN5g4PfQsOA8YMap68UohlSpNfxzN4VvtZVifeXJtDJMgO8lZY/OPzEko/x
         B1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148125; x=1773752925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8L7QotNediNGV0w65apbqeaG9lSdLcK+7UQkqiJf0ZQ=;
        b=XZMEsJ1A0hCwdA8hYh2wEZQI24BbR9ILP4gVZa9O1IWxdi3zKrTRfYEn/Wi+paqkTZ
         KzCP5Xben3Q6nfSA6koRnaiWoxc0x3S1LfuXqC7bU4phzTOuMDOoglSF+STuNBSK31za
         xCcxH+EOipbSn2SzCbLkQYGXtGcEdIBeK0XspaG8QQ1kQ17LCMYwpHvP19yT4zasZ3ZB
         zYl16VmH19MYaRBuXdGik40NqFepM2As0QIR6dcpiydqwl8stqlN5uyu+2WIvIF5kZTV
         xlyDRXbP1b3fBPOq3I3wXuPuusX4CtATMIrIQzLdTN1maLZA2fpK8fEAACDD1/iN+xQy
         pO1w==
X-Forwarded-Encrypted: i=1; AJvYcCV5FHzKboXvayzAKxG45Ro4xBSRu+38/y6uvrELM2t8wVYOhrzx3azlRlXCiR+m+kzzaNdpbeaTIj5cJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50/WOIULkfdYUUpaXfsSx+N1S0t2HxV+1+tM5jh7LOcTE1bLy
	tIxx0mgR7qz/HpREJA6k01begjiFZDQN6qB/ByaJQEyqGFcESElfAFsCMyhzVhapEOmQ5zmxymY
	cggqAJnZUgyoa8GzNS46lxECkgNLFLGwX4D93IJiC080q9R6eZ8BVNR/J3ubt99BwMw==
X-Gm-Gg: ATEYQzwg7JH+Qge0pJ2aS6IBRLUixQGA4oUL8j/7IYnMqFpfkG55LQZxpwXNwfiQql6
	8M2rdP1snk+kNFu1TwH/ECY/Ay2M98U9HfIq841guQAgL1Ky5SxQ7tHrh32+kljZ0pqFIjzJ9de
	tFpjFbRELBlURdXko5IEXnv62NKjgSACwZ9U2YMgNxFhuhnc5mmdYG7gR/GHN0nSORmSPL32F5/
	vHnmznR4Hh9UlwVIJZl2f4RHQ4t82WTG+ZiUL5W/0A6+QvR56T3jBdf8Z7hqrz2Wg30u4kCwam2
	PfRdc5rCAwD60QX9cUqrBW3oRXedzezZ+r7SticBwicad7xDHwBscAh8sJNqBVU2gYWYQPV3I4E
	oW0de9kA/joveXaAiHuPVlh+uQZsSQTpJVbZboTZSD7IYRMD4/iODkA0dsHrfnpivsKRp0umMXj
	FYXaA=
X-Received: by 2002:a05:6102:50a6:b0:5ff:d7be:fdeb with SMTP id ada2fe7eead31-5ffe6391715mr2638051137.7.1773148125406;
        Tue, 10 Mar 2026 06:08:45 -0700 (PDT)
X-Received: by 2002:a05:6102:50a6:b0:5ff:d7be:fdeb with SMTP id ada2fe7eead31-5ffe6391715mr2638044137.7.1773148124886;
        Tue, 10 Mar 2026 06:08:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f139e24sm488542566b.38.2026.03.10.06.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:08:43 -0700 (PDT)
Message-ID: <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:08:40 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
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
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX8369MeTxLhxo
 Z6Gu0U9hJkPpWwqjhs82mt2fFB56nXgbdSnWAxXK28bpSzRhOf2wqYu+/BfX+CrE1LxGB5mvaMy
 bmWwJd3xJbi6fHiAmBm89bmVMD5dhM75fDB3SChYivNvAsDY100D2QEU7PSTz+MprBSTwT7uZI6
 1Rgi4hSHLiBzj+36ZzEM1AQq3WMF/nkIyh8/Mq/pGEam77iSVWi55PSap79+Vl6rtpW2I/u5O8f
 sC+0PqOh4YrHHXVklZQ6mIpkdJMGuCtg9JWo3CD6M1g1un8sQfUm+A55K3it9PF3SpGBZRN+VeD
 nI++5WI7StrVyv9wA7e9pVU7q1oA6EDFX+ead8CnRrq9+ewrr6nUjTzIWMy2wz1Tor61p8DZ2Cm
 0WraDtM7Wd70oslVO5o62/eXX023//0nFJQOcUud3U8hRzgBhInoqjrHh2PLqU/rJtSo2xIQ8gd
 7uEGioRGaztP5Cg7FFA==
X-Proofpoint-GUID: O1SzUcf61swc1JAWX6EG1N1AB7oJE_Up
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b017dd cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sfOm8-O8AAAA:8 a=SwJZ1EMs1T1tlsjO-F8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: O1SzUcf61swc1JAWX6EG1N1AB7oJE_Up
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114

On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> Add it to the device tree.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> index 7b2849405462..709ea6fc9fbb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> @@ -94,6 +94,31 @@ &hsusb_phy {
>  	status = "okay";
>  };
>  
> +&i2c_3 {
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt5688";
> +		reg = <0x5d>;
> +
> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;

interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
even consume the former. Trying to read through some of that, I think
it's on purpose since the IRQ GPIO is repurposed for setting the I2C addr
(which nota bene doesn't match between the comment in that driver and this
submission - perhaps that's just a SKU difference) during the reset
sequence

i.e., does the touch work any different if you drop the above?
does /proc/interrupts differ?

Konrad
