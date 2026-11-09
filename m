Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222497;
	b=yc5Shf2N5y/H83fHnDZheunt1iwp6MgWB263n2v8kqDY0cr94ZqFdZCAOdAaiTxP+RVh
	 059MZGFEQdSp6fM8QB5G/9nm6EQuscKymuvG8Wvrk+s1p9EQD4F2cN/7nJn6MDJM1w5Hs
	 sIJYkU0HdK/SHo8D4D8Mr29OaMNjHDV/FgzhmnLtRRHumKlovttbl6KcoY1v61bW2jxV9
	 WKiQMGNnmRmpxXFBP7oak98sOzfgNAF7i8Q+0XOeX0LMMHPYab/VnPowPx+Ymkm+3Y1Hv
	 0l+wfWyLxN2PLTa7FD/EFKrtAbaiynBvD1lGH+wt7ilhglII5E6Zanvm+AqudoRQfpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
	b=hEMKtx2XcxeP/n5JdmgpmFGwOzlBDdcVI1l3NuJH0Hp8BHkuHxU5P+BuY/O3KpZEWFjt
	 AkuX/5IREnmDaJSa61yETMS5P2LY8R9Nd1XaYADmIOaZ8WAc4bDJSQrOmd7IbNPf9RC5O
	 mkJ6JfUFg2kBzcYVCGl8s8CeFEZc6VLwGkxAlapuCmixJrb7iHov03LV2ZdjROda3B6YQ
	 HY2DE7uiiiPQXe9dg1vEMzSA+FMtFg9DaIeW2DfY/AMB9+gs1R3MyGYlRUjfJt7vkAhu1
	 y/a4WsXQ8u6/yLX9hlcLpDEnr/Acqe7d9poOWI/63VMoy/kUVo9+8dmqDtgG1aS+7ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LHo7EinQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b/q6LzJQ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39BB606A322
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 11:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39BB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LHo7EinQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b/q6LzJQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ulrM4130921
	for <phone-devel@vger.kernel.org>; Mon, 9 Nov 2026 11:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=; b=LHo7EinQJg9ARF4n
	xexAhH0K5D+x4kWAJSUylb7Smu9iPfa1I7dmdhZ+0cPSsH+wPyUt4j2t7la1iHH4
	VddscktFCR5IrT93cKxXOOku1kni4IN3y7NU7yRAoWTfouT5r8XYbcRprBD8uI62
	vnwFDLlxYvkMOSVgH8fWk3knoIAtryLKT2MaA5NMvMGNXG7I2Ui0nIlU4n+Fml7T
	qg3Fuy7zLNHDbYLnV03csDxAYDixGN1eCLXj1BvyBlzI+DFLxTbMJau4XcVtbL6a
	Mc19gRvhksR6JkjeI7i5el+MilEp4ZT9vcJNZ7ItjQX766j7C4HWF6IfNmdtM2fO
	RS95IQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2hcdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 11:08:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9460411fce4so12353385a.2
        for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 03:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222495; x=1794827295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
        b=b/q6LzJQv6U8+LiGl8h2+VgYxDAiT7j6UQXWvU+MBWPOAKMDSLvC3BUuRIkIPDewZi
         i+ID47LhK7CZumhzctS4SebuBUzxPsFcu1qnz7+9FjzdkPUTUZDv3cw+L5bUaT6ZOxJu
         SxHIFZLz1G7Ux0HbWpndvNn4By57WeFtGU4yYeNJYW9XW2M6pt11p2+jiboRZssAnD/J
         8JlH+UNuVofoTm0TLhRhf6obeFX/75W6cnQyNjvukyztIP1ed0Ghlu61+3DYnEb0mYSj
         lZ2h5Gys78HnnUHdN/nbgMY1S3RS/M7jau39El03nL9chC/I1Q/aUiWoq1OXGJKxTYqf
         wnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222495; x=1794827295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
        b=j2EH6IxryBjLSnJ0r1Ci+Prw/X/djDrq43cdZjWyvdNKplI0bkqpjBquSquWRTSMZc
         CFDY6D/axkYJZ8MQ7z9qBAB+esQlh0SmaiDtwEdEtD7kiYRHnp6iBoo625XD+nQRLyj0
         aSbJtHnqSoDflkoPqTdsB/rO4EKQO7W2MNjsXy8mLZOD4EILIpdyzlGZfI80OhjjjtrN
         gZIgdW39re2rintU49vjXm0Vs7HDriQv8iycrT7vfhpaSv7ORgSneZwBdKvPtwOiiW9/
         zENZIsI5ff4eEt3I5039gPjc+ryKAje2XdUqzs0QoTZn2/EJNn9EtzmYSCcY9O66jNny
         wmWA==
X-Forwarded-Encrypted: i=1; AL+hErEkuTgRQRj6mpt8B6vUXIgsWNzXtD7VBL0NbyNmn2FuX/LLIpHocXAiIp1DmUg1opgniQNf65QDelQ4IQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jZb2J8Z2Z5wtCmxpBQOh9gUNVjNGl/Nuj35lk9Xi/G95JNDfh
	HNHr1gaO0uhaxOJO+KS/MFrRoMWDzLSVxgOVkiMh8hJjQiZmrrEtnChCoy87RsJdWJAqedy2Wfj
	61F+QXvTA2UeRhfb+XE5HIrsoSjDIP+Yu4xW+fbwLbzyuSoCyFgN2gpH9ifytt7q7ig==
X-Gm-Gg: AYBFou0hJW/YTy0+nnMUtXNjQKmz2QtDjtn7Q8wgcSHStjvtgpvBBdN61va9oJI3dhZ
	XC1axa5iGQGce5bEv22KkmmUGovtTnHJEGBw1GjsjJCZJXblMKEBho+Z01uVqo1oppNxLo/RvRV
	hUjYjMmeyafxVWUrpj+NEOClPu9BYhui+8NxG7sf6f7DFMbkDofwXM4b12pdSoOHMsX/UwyyDcM
	l/MumqPMe8WpbjzgvOpxE5pcSEdU4t/3K6/Hc+MDQ5ky7q+o3dzkWusjAs4f32Tc3CNMbQPb1SW
	AUTEK2mIoYJHzhPtdPJatuwyQIgcQelRX+LE/8rX94qc6GING8ab/dTXZtZb+o2HZkXXOak8Jph
	1zYqzkQCcvA05mXcEevp2QzoBnqDRYV7NBxX1r0iSQVL1HaYAdfMxBP2U+7aNA0XTXGRosw==
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr515074085a.5.1794222495268;
        Mon, 09 Nov 2026 03:08:15 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr515069785a.5.1794222494798;
        Mon, 09 Nov 2026 03:08:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f94805sm148341166b.26.2026.11.09.03.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:08:13 -0800 (PST)
Message-ID: <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:08:11 +0100
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
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1a99f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=0q0syt3hQrrWoPH5w1IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX4g85xQi89YNU
 AWD6RPO1rRp02tFp1DUyQDzcxs6LRzKNdLqW9ROkfau3eXdJrvMQYMlPqi3hy5+wfIvZDEguW0L
 RNw7obhskn2OdRF+ZbUGzZ48GKVnDoLUorjGZ0C4toKD+oYmFXe/6FnlN/pmELiHVUZc52VM84j
 yncY9Sis4NAYjR5e1urnw3kvp8zrLpF4SlMoqlAysBh8mNhKB7GbQ8jATcP12vuxMsSfv0h++Nu
 HYVeDLX07nCQZNQ73fulB5PCHoXS24eTQqSQYlbLQlhy3+8D/+oEWR4HldKeFwYCv0+LMU0cRrN
 KIv3QDtx8lKZd49e19aD4JSLp7/puZJQiidWVuX3nRQc6txPtVBOatFnShjCxGXB+zEdxrfRKZr
 zdqxuvcfMrU4oGO6WSR3HYaWT7vHLRFRmjfPRJbx97LrJJCGRhh8ZnBT9EuRrpxU86ZT49Vo2rL
 EOiZZ0gxRa+0KvjSKBA==
X-Proofpoint-GUID: kJjFT0ECl0oQrbXoKUFu8GHzPFW2YTvl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX6Jaradxyl9Eo
 c6jJ0FmxsE32RFp/ztb93YYypAoJV/GRnoFA82N2oqstD+PAtxJt2yUxdnr05ZaWW5uvKkdGUId
 cVUc0MNK3CL7ZUu2fWZDputjafb21Tc=
X-Proofpoint-ORIG-GUID: kJjFT0ECl0oQrbXoKUFu8GHzPFW2YTvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

[...]

> +&i2c2 {
> +	status = "okay";
> +
> +	pm8008: pmic@8 {
> +		compatible = "qcom,pm8008";

No PM8008 on the other phone?

> +		reg = <0x8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;

interrupts-extended = <&tlmm 112 IRQ..>

[...]

> +&vreg_f {
> +	status = "disabled";
> +};

I think it may be cleaner to move the definition to the other
phone's DT (are there just 2, or more?)

Konrad
