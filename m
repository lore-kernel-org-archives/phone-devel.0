Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F4191F98
	for <phone-devel@vger.kernel.org>; Sun,  8 Mar 2026 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982857; cv=none; b=q1iLGwncRtm3r/R2cx/qMqoDZZ5BFDKXKSUPZ9slkgB64QMSyyGxW0O2x8noNDH8mTmTZK2342F65sAPbcH5GNWeotK/9RA2S+7YM82bEVysgWkjr+tV20OAGDR8rOL/kvrP1vfw/jALfKWT+VipRvwtAx4OiXBMqTMObGhzJsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982857; c=relaxed/simple;
	bh=/R9KiuwCc932s07yKhCKfSnuDTut1BiyCOcEKscpH40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ta08IxTCGfHTF9mp8wvnN57rrnd0yVxOPXuNVSGtYvQOhtGj/tQxeTl1jNtM4Xs16DtQBkgqkfq5V8bL/EGZtuUAW51JygxUg+0fgHlqi/O8NZMQG2I7L5TNaetiToZM7ucnkTY6TlTXCoW6NEwT7kX7mYDn4Gg0gr3lk54jGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dq9PsUjD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ui5KTRdn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dq9PsUjD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ui5KTRdn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628Aubfv3505423
	for <phone-devel@vger.kernel.org>; Sun, 8 Mar 2026 15:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c2gyX71uGOT28R9wcuomHiWX
	Lz5+YgMpzvWecME3waE=; b=Dq9PsUjDKP9naiYiz+d9Vz/2JoYr6nlEJGAp1XcR
	lxdAODUmeg+c2fgqPQqHGu2Ir3huJKmNtVQSVkFzc4lzOkhSQQcE3FxHGuJAyzag
	nmbFS0jkiOyg31ij+JWcry41BVSXaj2riZWn5UnB3UxmHS9PAvoRAFr8Q0oWJRS2
	pmLFjViwOIcJKWeV3fGk8OkQDeL26M8tdcv5xdYECosHaH51N1aP84/yBErHRfK7
	KywoUWqJIQpw5xU5cdKKBTLzZc5P+i2ykSsPXtRA3PPDeZDJ22pGk/1qsXtZRHGn
	C4aX7TdRCcHnoA4FsqUtQw/NmIcKUsZWxbhzUPzSBkWZ1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14tu7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 08 Mar 2026 15:14:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7f6ac239so465640785a.2
        for <phone-devel@vger.kernel.org>; Sun, 08 Mar 2026 08:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772982855; x=1773587655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2gyX71uGOT28R9wcuomHiWXLz5+YgMpzvWecME3waE=;
        b=Ui5KTRdniEy2n4UBYOXr8XXWUO7EoFEEyoJYEHiF1y0p0VEJRCYO7RaIH+3IHSwVE4
         eeg5rz6kr0syitWaOVxsTIFoYLqbLESvN3OBNR8rdVaKH/YCllHWQlMvQoHL05Ej5hAs
         2im9mbQCfqYEjLhhJELJDHL231bMD5Iy7ltbiTjzP9rUSRQHhtgYB5jZSo8GQe5f704O
         +FqjmxuEArEglGhcaConvz02rIC8e3NpLYmDsqbH1XyYTwVRatt5VMV6ySHW9xYNL69/
         3hbaLGd6VyfnLMQWa36LCzv1Jtq0kTIHpc0RPHo8VL6PGmdwtQd6WyGrG4KKmRXmzsPg
         rHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772982855; x=1773587655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2gyX71uGOT28R9wcuomHiWXLz5+YgMpzvWecME3waE=;
        b=pHu3OxyRQEnoxszZxjYHIk60OF0bgBLuzAK8fBCjbC3i0/q5CgboOpgkyUuVJlalDX
         qd+8euXFpKVukrrcD7BY7qynLBoBuRWL5IS75gl3JY+9X19r5D/RIEot+WaJ1yQcXW1u
         lZuCfVkTpKrmNI/8Kc8MVTbenuVGPIKFQnxg5PwhhNAsrfia3pJsLQrBP6TRSLvhho67
         CwoWAEt9ynOlqLeaitGrwweMLpDuz8Y3gYFIVtMqbpwfVbHlvXMWwTWc7x9UjPtqwQnj
         svSgXXyh++35Bp5EZ3Um1dnqr3b2YodNDHYtm8IStzer0Vu/5N3hlPeEmxGugIL2Bj3o
         /vIg==
X-Forwarded-Encrypted: i=1; AJvYcCXuqyBdpjSlZY13fKW/K0e1vawgMTLFnD7EaoWxmnAq3bRUzQyGapNVT+SHJovnLHiM6QBk3+dkC30nGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/GVk68MGf9oxxnEaClfqdXR1+EaWIyw1nmaJTgaZuM0TH21U
	l4+AC4BsgU/6jZlzL6uw0M4paSwHnZubKdHG7HmlALQAYvWIIGlLYkyYzmU1YdKBQANEF8ZpB5y
	gnRLkFJjb+J0rTHP1tDuZvgRqE0EfJdbLJdXJ5qSTK9UG1gBeyYDbuzEnZBy6I6NaTA==
X-Gm-Gg: ATEYQzz+3JsUb+Hx6NcrMln84MJ5XejPX8wAQ/wee2LoJ8PkAzC9JyyZsMne5VcZirH
	bHElShLBBazL7WaYxDvaW+d/PJm9sYMtkdwXZgs1kW4jqmLWBRN/J9mxTa51VWjiq08SJcF1Ex9
	GLiegWBtQ3YJGI/R2zo5J8roskysTqm4TKL9lOpCanVdG1jMQFQSaBKh26lER/ARs5X9nke8dCe
	ZY28vm2+JPAtIF7qL1wwOD7Wf/VpBLVcT8DSKIHUWsFrb9ZazRzARonST/4LdYX/T/ksal7alJB
	TmzAVHThY1XYL99fft2i3QizAbg80uJ1bU4r4aWZZ6+qiXVxYdnJqN1HcvYnILxwir4G74dyqRT
	xnRL0F5PUOgCeiMcMpSWnOI/tWNaCsmOHd1AnQtLqWmly5q7/XpH5h5dT+GtH/owwvh7ksc1s0l
	HY7Z5EikUAwbZEs5//IZiyamPQwpHtDbR0P7Y=
X-Received: by 2002:a05:620a:294b:b0:8cb:4543:c5a8 with SMTP id af79cd13be357-8cd6d36dc58mr1185476985a.21.1772982855069;
        Sun, 08 Mar 2026 08:14:15 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:8cb:4543:c5a8 with SMTP id af79cd13be357-8cd6d36dc58mr1185473185a.21.1772982854653;
        Sun, 08 Mar 2026 08:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a4203064csm11602251fa.32.2026.03.08.08.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:14:13 -0700 (PDT)
Date: Sun, 8 Mar 2026 17:14:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Message-ID: <qwrl43rbj5p7oj2buvt56shf6apmuottf7f6tkl56utaqowtaq@yfes6ilfp36j>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-6-aa2c330572c0@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-6-aa2c330572c0@protonmail.com>
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ad9247 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=sfOm8-O8AAAA:8
 a=irybvU1nrzm0wZGzBgQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: F7VGqoY2Yyrk7lFty_YQxdMCeMFmGSh1
X-Proofpoint-ORIG-GUID: F7VGqoY2Yyrk7lFty_YQxdMCeMFmGSh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE0MCBTYWx0ZWRfX6tEp03hg1nrr
 4hvaqr/DhunaMDSb8KyXEEvedeYAYrmxysTdl4sKb81c7cYnup2l3iFCNrzWG+pi7AXqdhfTXRl
 l/rm5WlAetyFGs5a/lrjMxArz3UvgWCAs/Rai2nhUPx6RficUCOdNIQ+nvz8sbCaFln0Vfwh5qs
 sOQomZ44/v602Qh4NKUaTo/wOi8VhrrrHSlqY8MUrfjOrTaF8HAcv+rpo6kDtvSFBAyjx45qRGn
 quGVCZ8RvBG2O6htoVI90bwBS+ps0EyGbFtGufPKjcA7Jt6UCXDWrJPNDKvWeDHqLQGX1Ots0Hw
 t80te77G2UYmYx7WuftiGTp905orjMyMulFYGlSR60m4sdCSx/MPjwdJ3hOmUl6hK8PQis+s4S+
 AoP36xjszNcq3nX7kqXN3p7c1S8dtwUu8VfS4TGB8rlz9rYiHDJ8wf/pY1y3MGTBdf4B3tMQ8Oy
 SmC9Xf7duhH0RkI3edA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080140

On Sun, Mar 08, 2026 at 04:52:46PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Enable the Hall effect sensor (flip cover) for Billion Capture+.
> The GPIO is mapped to SW_LID events as in other qcom devices.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> index 709ea6fc9fbb..83812050a0a3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> @@ -44,6 +44,24 @@ framebuffer@90001000 {
>  		};
>  	};
>  
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";

Is there a reason to have a separate device for it? It can be squashed
into the following gpio-keys.

> +
> +		pinctrl-0 = <&hall_sensor_default>;
> +		pinctrl-names = "default";
> +
> +		label = "GPIO Hall Effect Sensor";
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 46 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> @@ -335,6 +353,13 @@ gpio_key_default: gpio-key-default-state {
>  		bias-pull-up;
>  	};
>  
> +	hall_sensor_default: hall-sensor-default-state {
> +		pins = "gpio46";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	mdss_default: mdss-default-state {
>  		pins = "gpio61";
>  		function = "gpio";
> 
> -- 
> 2.52.0
> 
> 

-- 
With best wishes
Dmitry
