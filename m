Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623469;
	b=00TKYGcE3JvsW6xLl0DdU/6VJsayvcmEd3RbzynrM3IMYoc34v5gP9UZHFHaDMSEOgbk
	 ff8uNYssW+U06Yw6vXSg/RwRUpqVVgtqXr3VjXvJRJyNWRCjrc3cGT02s2e9OBmqFIUj0
	 qE3AsAQmlmD+2woHuj9CB4BCFroATW2BG9lgGA4EILHEdzX3sZ6fPu1kkpfAHDF701SFx
	 LLRLOfPvHVO9a9NkVNuc6+BloJ6LGi72lwA4pBV+g3vHisywmgzfQL1iA37x2hm5zuZqx
	 KgPAs9fjl0c7+Yks+s9ikgr8N3DCW0WjB3XdJcHchMMq+55fCWmpaIzNnpC+WbGtuwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
	b=Qg+d2JX/saK/8EsJcpyNzKFeTHFC793Ub7Pt4tXg7kqlRNMnpJ8nMlgVHoFYAhUvcq49
	 DOSh5Ejvks3oR/KK4bWMUCXQn4S0VdbCm2TUhgwDA7VflKbzWSKlDMQ20PdDkL/Csp7et
	 DNwxDFJYM0wU86MEhdvNlOi+38gzPZ/z4dHhJLIFQWfAa0043vB14H0ZlznRZ4O0nJGz6
	 Whw2uvQTg2N6vRABP0EB/zo+8iX8FPM7mVU8ZXJjXhAUUKBe5Czd+BqRjhWRH/tyYwUXz
	 xZMSAsmm/gLICQieXDINMwRymyhQBEGmZsvmbXXEii5AHJjdmplcZsLTvlz7VosHniQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOioltV4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A7QlGTJT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2EB60A2635
	for <phone-devel@vger.kernel.org>; Mon,  2 Nov 2026 12:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2EB60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOioltV4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A7QlGTJT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4Sd12616321
	for <phone-devel@vger.kernel.org>; Mon, 2 Nov 2026 12:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=; b=EOioltV4rTXNoKF3
	ipmP8gz3lEBkTW5wy4eLvI4Uk9sWVyL/sio7Fh0GJKxk5fXSaL0VhZlQ37M5gKkl
	utI1djX5mcfcMR2+HBR7ym00h560mBPHQ18bsMi/7RC38I0QdVzzCaVslhFxPB8g
	WOQ8v9kMSmzZEf1Jp88whqKbJ/1aklD7VKWlFCwzgWhsfVoWp2Oiw4bKNw404hw6
	HfrnjxMrD+UPUO/PmrzmEn2hqobqG7OY2RbeXRZ+2UxMZ06IrUJGvsgmVvVdvgaB
	C2SVui3qlW+SumQ0SbJk3E6Qz5H/SzHMVgy3dcp4nnWhlThLJ6KEXmc17CFlcK+f
	ur6lYQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgbe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 02 Nov 2026 12:44:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso7946051cf.0
        for <phone-devel@vger.kernel.org>; Mon, 02 Nov 2026 04:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623467; x=1794228267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
        b=A7QlGTJTg1R7aVCIxrZBno96wyT57p9MR4SyTVob30EUPPSoSOrERvCYWxWjWVfxtX
         vRfgFikK0k5G76xM2d4jYhiJymFPWnXigQ1jPCl3iohwDdiuO2MttOCSMRve8gRyM7Mn
         nhB87XZnpJqf3ciYGDiP7t6AUdFmZWBM7hpdN4L5qTZBp45kJuVLplZ1N2q1Ar8CSF9p
         D26ml7GQzQ3RGKyZHBgso6ACO/zP+FuGRWVGvM7B7sMU8ziPFRvxF4D1uEAYX+lVnuHg
         HJ5ORisL/e2+33bdKsNvUPtFIJTRXbMwLOyRR3L4NCJsQYP/l8jLef0Ele42dGrM2icI
         ydaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623467; x=1794228267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
        b=jvqw8czhiV+dN/ktBbUNWn8XfTzarQ6oal3qeHOlWapg5QjKrY64MLmQao6A4d7a3o
         ATKN+Mn07CRBNwzjTqbXW9T3bfXBqql+hhoFAtA5gybtEB+bHxjYdiriVtfMaiecN86u
         +ROoU133TSMwbogDS8foHOu2DwmR90LU6ggmupMyE88cE6BVA8v3asEmigEW1Q5N5ScQ
         YRM5pFFu/fI86310TiO4MMsFNFvgKj0z9QkDwqA0Hs3tGI9mnnmzWE3W1YSyPDaKyMVM
         MmLjC36sHRfo5Aprc968V2R5BlUWfipAKF6jrIzqRZx+dVipEmnpV+9YerwCMyhNSEzG
         InvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDkW6yELDYTyHOqpEBSy2+Ma7rKNfq4cyBnwQLeV9JJL5jrWClP2BiKoKkGmSFqG5OgKrvp6hv295Yiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZIhHJMi90Z9BGYsUAhg2A06ZSvh3SDv7pk9lsC6nxgK7zEFMY
	kXKiz4U3JCngfRPaJHLKkc52UylDG8PFx243jDD41DAklekyWYyJjUZGVWU1kF7ZudqY+gFVEmd
	zAtQCYX4argsmQerJWpkeBnheWj3+qo8IppG83rGCVTfpjv3EodlUmr2b9FXLMTJrrA==
X-Gm-Gg: AYBFou1ToeHwMKu8rBAG54jA/3coPTwNxk0bK6ZzAVjugYjJ3cWePBaW+l6xeMuuNuj
	0tjbnlGxzqFOEb7B4vwZQendvQ8XDPZAPL5V5HxGZRPKsfAgAQX8JAuMLYH4KJaPE/Fk01giiHe
	tlu9B5vnYYkIiUHqnRktGSd+cT0kNejev2Mu1SwLXHDn6cCYq7rr1486S6oUivMMS5XA3PGCX23
	yw5hZIvwliSLZyWaLmrSbIu4sWV0b8wEO2pbxddx0Dcxw62zFLGPAGPBxb2vQKWKpJG+rlWiN1j
	Jz4HYfrOUoz2M84AtQUtPf/8PZT/AIHYeDsyPZm9xX66BOOJkt9U+jN5CGcpzhEDgluqBJFFWpV
	5HWQj63HdMCTsmPX4AXnDvQLKjjl1XxlGbxccHwa7liY29CEQC9LURo3TSZPLg0erQSjCWS0=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1564911285a.4.1793623466934;
        Mon, 02 Nov 2026 04:44:26 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1564904885a.4.1793623466454;
        Mon, 02 Nov 2026 04:44:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe101d4sm389225666b.40.2026.11.02.04.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:44:25 -0800 (PST)
Message-ID: <73f05be8-6335-4d48-87fe-71ba5fb1d2c6@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:44:19 +0100
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
Subject: Re: [PATCH v7 11/11] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-11-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-11-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfXxU46GAWj5MjU
 s749QWlsp74Kue4Vb9v9lZOetEBwnY2UUnQhbXeYbCwZL1DmLTOzRFcEEczugLt3oHAiJgnQ2mL
 iV4x723suApuZpj6dCYq8Ku5FEW/DkZ2kWL4nqaAysTB6f0FVQ2GD/RT09olbLQs5c+SE7B6t4j
 lgwyn96Mfb8LSLcVG4gyJIuQtwEFuGq2nKzaJ1Q4gXhOTSCDNoxsPtRv9FrCMswP7a0UKeE7nR3
 KOll+RCCk2pob1mmTY2xLNJkgPgeONvBf98/NlmNnOfHOC1rgAYUuX1ON87k7BFC460+zb8BOSz
 Pcf0wwcBZrJRC9NBglHBimuXXTF4i0ylUIn7f+Ol9jLIIeu3q2nmPPqUpuWQhffiaU05U/MZDT7
 d/WPuHDeOjChjWqlL0MwGbqEe7fquul5fu7IWFqtkNjetnNWSyEzipE2i0IExJZa+Qbr+Q9ChDa
 GSHlxT+DaloAf1tKYeg==
X-Proofpoint-GUID: OshqsYxaUHuVE_uSLciVIIYEzzY4QTI1
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae885ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NCdQflJRAAAA:20 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=MxLZmUXcRv2kY27zAqIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX05lO/bRYw8EY
 6oWgGhfxcQ6rWLF8vSkvg6fZOthfmKiHuaumuJiDYmev3Ap0djYwC2KqwdgP8KYSJhV5DlX/1Bp
 jbcNqq3CyH+Qx+ExiEzMX6noy0xPNBI=
X-Proofpoint-ORIG-GUID: OshqsYxaUHuVE_uSLciVIIYEzzY4QTI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus). Shamrock is designed
> similar to L9300. Downstream reference is [1].
> 
> [1] https://github.com/Asderdd/android_kernel_generalmobile_shamrock/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8952-l9300.dtsi
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
