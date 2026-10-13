Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1631618B
	for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886229; cv=none; b=o+BuiNUx4CX2nO43lp+2bNK9d7ZDlIPhlcleWrH3Z8g7HFRZ4VwBLH8HW7fGXK3NgrZqgJeCUFEv6LNiwy4QELBjTBmLQ4k9iCCMGDlCAN6JK2F/CSH19BbaQr+2V9xzZWReyVdzchZ3h0NDXhKjHgkzjVAmC9hp1nVGaE4Ms6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886229; c=relaxed/simple;
	bh=+PMY/81rPpy21yXKZXoy0/UH4FJLtbQW777OaKV8tHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auyv8DhyArcCFL9DsOcHwvTGZ/TJ3YxKDOBQcvxEBvOJqSPifbKOA3PwCMUMpK4L0Ywr09EpNlaOSRibR9h66oZF6Aop8nQPaPpB/PikFSSqS+0QfIAP5RofXnRG311RnWrse5x+h0DvLI8LoRYilQf2sO2WfAevRa2LfCehCw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2tYKyr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biLqTe2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2tYKyr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biLqTe2i"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CQck949222
	for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 10:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=; b=f2tYKyr8upCq+Mcc
	2UPh3aLmC+nVXmBww/2aIzDlz5igVDv7ahV1ouVe2dOJfzr0iDMTih/N/apdPHOw
	T/Klz6WE8c9gOERHjh1Dx0qqdquyyR4AhHvhsY/q+hOvKW9P4kgcepMbKI6uo6x/
	YpnXLiwOoaZmg/MGuVNNJUhJQ/Fv9DM/ZJzshTvEP5IMyF32V+kyWgLS8V853jJ2
	Eup1HI/4yBaH5DbmSTDRvFHlBEWc2ioRLc9qiFHmMoHuwXS0oNyN5zHDn6SpReOB
	AeLxDS4WC2aLnxGhGHLqo3qHoMh1xzOrYTLxpQ9yfd5u886XQ7q7dTtPHLfXPtS5
	m/e64Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628yxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 10:10:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso44104885a.1
        for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886227; x=1792491027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=;
        b=biLqTe2ikpLEyLd6DJr32gw3hSB3wIzMVIwEN5CAro4XqQ6HURnH0DYsJ9u7jVp0tZ
         QJUz6aaYk4g1vjio2qBm7zwMSgjYyMP1yUQ+MXF3aNiOd1o2cZXhqYY97VXt8arnYPlV
         egmwgHXV7KHpR8effcXWHClEZjBhGdVUmr8IjdKqkA3HPzvnOwntIh9J+FJFYVwW15IA
         QKpUX/JzBc8rh0QwdpZzLl+LysH9kMPBKqgO1enYC5hLapU+0/iGE5v3oKERkGZsg0a1
         /VU5OtdMYXdrNGa44QdvSJbeCFxBU/OXOV1Z5TLqzJylds28UdC5os9xJu6yO0+Vr4sn
         DlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886227; x=1792491027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=;
        b=a4jRVZQTjJo8ffakkqr3OLTcmopBCY8QBSR9ePNJccE3PbJgmr9nc7Rt8CRPD+npvk
         rn2s6cLrc5Z3iq+iS5TSLfW4die3nESGG9527Fnv1YHdv08hWWWSPE3e6DIAl+XZpx1K
         FjEEK5BNmNBlMrxq8Ug0A7mNaWId9fdjEsIJ9O6ORXdfEEqgcd+pdyYSKnRCEDx9XEmQ
         cS2D6Z/8gsTO8zXEGkk7DgqpGJ6Z+dn5DSy1wOpnwhWc+ba9vV5DNzGgligtRiPg+z3O
         S3GdXawjVm+N07f3Vw0/KxlRW4AyuoAFu1GaxbZUJ5PvwJdQw9oredtEbc0jCg/NyUFN
         0MEw==
X-Forwarded-Encrypted: i=1; AKwUvBxIexQ35JMdeHzlIVvKT/ozVJOzD+1A1wP+FHQ1wTLG8KmZuwMZICF0cf3UUbOZw5FZn/xrclL9MmJ9PQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJT90kes5jWjLGiuGj16NDZsqUimnfvcrUVLhWqsp/U30bJ6vJC
	T/YiGvlmObodF3gKYFqEY7NGSe6T9QSaN4e48LoUfaKdAlPF3Wkr8yPVTRoHWAkkGWZffDc+cXk
	Z2GjTv4mdVxlYhu/TPptoAzw+XAKrFDBIsQYwttMhr/m8nC3Q+dqKoQS2lJti0Uaqdg==
X-Gm-Gg: AYBFou1pyrqLrkA5P3NoSOR2uvbxPWcnJD4o8krWbKFf40wgMJquyPvx6IcxOXptlTs
	mY8ChFtIOJ8SfWp6S5IIvE8JRoS9dxtFHlF0cGHZqchMdyN7QYO4o4RXn7tti/LZpu1Zow0tNc8
	f87BnoFiFsntYw/35+4SKszpdW6gCZtKTGtdU6oa+zteIR/yRr6rAqQPxR6EPkzeQ42TQdhjVBx
	aT2tc7tRd46tkjbV71YAd4LdwvlG+dLVvt1D44I4Ny/aDawRUjEBXalz0RF/QOSfjCMxxYUVjr3
	uDYbpumz32fFQ1eWri//dJMg5AKN6QWBSJq+EoLg+df41ZNyhqOxrkFd0sdZ5NIc1KdRKxo9nCa
	XulFW+dZMNbxFhCSyG55qkA==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2138497085a.6.1791886227038;
        Tue, 13 Oct 2026 03:10:27 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2138494285a.6.1791886226526;
        Tue, 13 Oct 2026 03:10:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3350fcf309sm353463166b.39.2026.10.13.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:10:25 -0700 (PDT)
Message-ID: <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:10:20 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0393 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=RY9Homj74iP04qnvyqkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX9uAD5n5IqIT7
 KA4rUaPvJOBFhJ3Xpu02cMeyUkK+EGsF6CGyjstr8YrOvGNfVCPeCbO3pWslx1M4vvas3yB2VnT
 5ImUWRlniUssPEF8I6epVXsTXlwAFuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX5eo8/L/dVj2A
 fg9I5cL/u4TnRAJOFXkZWC2YDqr0eeA28vI1uKZfGNab30UyDaJb3Udz4jMzh1rP3jE/sKTvmle
 rdfHZq8uJB62RF0TY92s1+MOwLDUHdZy9IiMTNTVf9OJCRwfyfpG2I7MkzxIrHPswp1hcZoun22
 IB4iJHm6GAVX3G0JNh+RioljQ3kjUdDpwyUT+ELPooRyxWCwQ1BCMl4Qft/Jop4GGG2d3lua/4P
 IBBw3f5PTmTtIFnGh/PR6zlDG77/Pw2XIC1uYy+8yPbj81s7fK1qhI5FMH4Mnw3SaSHffRXP4Rh
 9jzI8HnjtSu2m44VsihIFCXcempgmL8bfWarKqyFmGAx8KloIiu9TGSBs6/Y71B2XVccj/nlOe9
 1Et0u6unajhabBQyPgsT6PnRnFVS8NOH/Z2CWbHqZh9wtU6kIARGGZi1MzMOnn26twuLn42xmJU
 kBypiUGvoIjzWbkBiCg==
X-Proofpoint-GUID: MuxFpEGTRAaeawrAiwjTtIECYkPgbD4L
X-Proofpoint-ORIG-GUID: MuxFpEGTRAaeawrAiwjTtIECYkPgbD4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

On 10/12/26 8:11 PM, Luca Weiss wrote:
> From: Jasper Korten <jja2000@gmail.com>

[...]

> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Good to see the Lucas are in agreement ;)

[...]

> +&pm8350c_gpios {
> +	pmic_lcd_bl_en: pmic-lcd-bl-en-state {
> +		pins = "gpio7";
> +		function = "normal";
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		output-low;
> +		power-source = <0>;
> +	};
> +
> +	pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		output-low;
> +		power-source = <0>;
> +	};

Drop the output-low, the consumers already take care of the state

[...]

> +&uart7 {
> +	/delete-property/interrupts;

Let's add a space after the '/'

> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;

And let's wrap this line

[...]

> +&usb_1 {
> +	dr_mode = "host";

Does OTG not "just work"?

I'm assuming there's no pmic-glink on this device?

Konrad
