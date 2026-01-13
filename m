Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3D3176F8
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295064; cv=none; b=YLrBVAU/m67sWL+yJYyVCbN93hXJe++TcC+X+zrDUxJowMmpyy4wHgBe6S+J+ed5PxE/DtSr2DJVhyMySXaHBwlW/3bKQm0yZoR1Ku6fK+u15X3U+Ce0g19mrZf9fd/n6y1aQswVOdj+7DDQ9vPLWnq8cP18iHUx+HnO4P2tNms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295064; c=relaxed/simple;
	bh=cAiRA8VnHy8NpbdBHJfFhImwLZhorozI/fCXrTGU8DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhZw5+2waTtT7SKY1y24Cgg8Oe36j1QgXsUfyDmG3My+6yJ60tzOxzFxqQH1t5MeiEAAytMgOdFOezF6fDt2bicNITEddF4IKhH7exhCySOAgiI4EZvmPzXQcMSusTeqFJi0KeScw78MOIBbqp6DUjEqtC9KcHUp5uMQHeEs4Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j07oL6bb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWnc9bTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j07oL6bb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWnc9bTx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7BChB176979
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6U2zzx+CM3OCN0Nqvjy1sgA23QBGijn2sPKVe71GUo=; b=j07oL6bbqowPGQha
	w760vPlnsuEd5fgI4VVeM53emhmwb0hcccytCMvgXND6ajRyLput6uu/Std5o0CS
	1uw8EF3wpcv92NkDgLRbB5We4C4bP3ezcv4EdoQ3IzHQ/i2o9Kh7Oq8jXE9eKqEj
	bJZ8GLFT10z1AMUCcIbAx4nPCJW5d4sz1SaaVpYzoxXb5uAW+CEfmA3hWuHRMWc8
	pmeLPljEqYSoNo1NHvifWj/+iumagZ7HFr4+I+Gr6qaQKg8eb9JbTK3ju4161tMK
	Ef/z9rW7K9tffrWod3JAsDNl1dRya9xDhgPzxNk4kZrUDzI9OJ1fgj+xqItRDpe1
	vDpEdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f2gva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:04:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-501423e1faaso173271cf.0
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768295060; x=1768899860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6U2zzx+CM3OCN0Nqvjy1sgA23QBGijn2sPKVe71GUo=;
        b=GWnc9bTxwGTmadfE94dLs/RGNGL/DgUU0n+OX7orn1Exsv228t9YNS/iIFa0iL9XPK
         Mx8NlBrJ+3L/2dylePXaR+q0oWSbpMM1IiLNH9WzbiqFcqhSuY5RvqMZJbtvci+3Y+qO
         XLEbmgUPTTzRvSDR04OEuKWQCgOGpDgfIDLmwVqgNGZqDV0UVPcEYYx3xmoNUUsKbGGB
         7QEDUk5dJ5j5VJfCgYu993vCX00O09AmIseUpH6/6c/LQb9e4pfuBx/7Ag/4g0nQII9A
         o9mdYJdWsENQ2dzpj1UQNVRd/AcYosPQYDBXBN4SuSRyLYfEp6hiFHBSmiV31yGhupKa
         jywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295060; x=1768899860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6U2zzx+CM3OCN0Nqvjy1sgA23QBGijn2sPKVe71GUo=;
        b=q3+YzYM+aqrphja2UTeo2N9ntf0Jz5D1+pKHj3bVz/X1DOrJWD+URI2e8E2mMrviaD
         PJXVLvfo/m/jkzZTGx9jUTxMMzP4z2lhOn3H/yvlkqS7Hw7xHf0I7z7lLgyV/PXvSh7R
         pSMJFB0r9QqN0TxxVdkYqd16tG3REtklZDaCKDr7zMOhXVnfJMWo6dh3l8W3sPLuQtXq
         EFufeFBQzh+m5VPX0Zf+jC3JSW2iw/DOxv3ahfiS8W9rWMs87r3UrMA3et9N+JMp2u6g
         hzbLjHKy1krUctBf2YCt9kuDUgbseE6/6C/QURcoa6PlrM2EMOw3BgW0tBh3hczLmshU
         I1lw==
X-Forwarded-Encrypted: i=1; AJvYcCVy8+38P7w5HoPNguBvIFESLiKm17Ah1LDt2dEy5L+4qCCRyyndYPPLyVTygxkCZOTluKu0PQEciQFAAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycFnsQo+0LmHZoYE35VnUkbcRXtJLI6+iwKJ4Z80ro9hSD1WeY
	/8pB2K3738vn2u8sTxMojjkjv4VIWHSFXDIAkbko/CMtIajy7rD4auyktzzjXlyEOdJybbpIMT3
	9vRuW4Z1+I1NIPIci749JMlZ6LVu0OOVFczy/DOKYLlrP3RQIdzCud1FRQD8Bz6WJghhCKdqTjA
	==
X-Gm-Gg: AY/fxX4C8kE7Qcc+54Tds+l3U8c8bIBjnnAjM8K7cfDXdzTEoZv5fYXMdLHdjwobUkr
	aOkct4TE/W2LBTT7aBsoYBlr/RwrDlrTZEOQB4znwrIVUTLPsEXClb7JjEt3t9GhlBjOS62c1GG
	lJ1ORjxqxgYEMCRwJ9Rj7wQ/m2i2P5uJsh0L7Fc2P+Zw5u65yJrUdg3GX1QxAbHAZTqN5zO93Em
	lrbwDVjiiZIw+1JABDr5Bwq9qwiM054LaTLh+DGtQxjfmKSP4IE2JbDHu1et/K+GKMg7i8FDGkS
	O20EvJ+QGuZd0HFWt/d9wu0dlp6mYeO27rVlHbaUX38fueB3mWABR15f3KR7urDb2bls9hHJG8o
	jTeC7nhZYap5MsHJtK4bMRwr2QxGSNp1/JD9ZmWH19AF8IWKljdXHTqFLa0QwWndAJ9Q=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr228904291cf.11.1768295059921;
        Tue, 13 Jan 2026 01:04:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG81zdvgtfuPU0V4bzWJ16GCidU6hrc3kmSP3yqz3p3XSCqaYyFKOMhzqc96T1a4+UOy/D7HA==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr228904071cf.11.1768295059548;
        Tue, 13 Jan 2026 01:04:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm19638250a12.32.2026.01.13.01.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:04:18 -0800 (PST)
Message-ID: <ff8fbdb9-dd03-4811-b9cc-4ec0dabf9353@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:04:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX6zPy19DoTMjw
 oE9vxUn24V0B9MANn1s8sw0JCvwpRUfLGl1L+hJSXOBg+0SDASqKSWiS9f0CqyzJt7j1wBwLWmU
 atE9HG4RrC4LjuH6ItztqL6E8JnYsd02dGQpwazl7Gm44MnzRw41L0Qj+DAGsmfmmB1Jps7HyqN
 NEJN8lkz7B8QvQTs6A7k8FYbJDsoqaHep0gK+pSghyEVsUkXDUksMYD6TCdpS48ySAfUUPxYPjU
 Klom1f6EAYiOPkcEqCz/nCYQ8Rxr4dbLwdZ/zlboeb79JSKULbGidwO17L/893hUCDFmUHSh9A6
 lnZQSBVrbBEUWTpZuuweyTKHHFpEPcojDtN5cUDO99katbT/8QkQ4af2ojb9/zmBM/12kLpxEVU
 vxnhciCwgxzZFLjIVGiXdgoyKMxKh7Hq0J28bmm1DHmai4lKmd7BnPO/RdY3hlFySK0xzlsLi7C
 7OtuOiXaXkml6VF8Gqg==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=69660a95 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8
 a=xi4TU-eyaB6qxKV2EVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: P0SLv2ParjOHzSy60uW_OIrP_RtPVXZC
X-Proofpoint-ORIG-GUID: P0SLv2ParjOHzSy60uW_OIrP_RtPVXZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
> the only difference is willow have NFC.
> Make a common base from ginkgo devicetree for both device.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> index 163ecdc7fd6c..70be19357d11 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> @@ -1,304 +1,12 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
> + * Copyright (c) 2026, Barnabas Czeman

Is there a reason for you to remove Gabriel's copyright from the 5 LoC
that remain in this file?

Adding your own to an existing file in a commit that mostly moves code
around is also odd. It would look considerably better if you did so in
one of the previous commits that fixed things, as those contributions
are easier to perceive as non-trivial.

Konrad
