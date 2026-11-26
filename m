Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702024;
	b=uu1yNQTrTUwgO7BNya6qyKjrYe5G6O+MoSY8oGDPvknPFqXJmo5PMSiD77CjDEXSGgoJ
	 +e3GDdP0Pw6aiYUjQ8TcXtXosXvxAr6dIrWjoBWwZzeptYxc8G/M0mUV8r7skhCx2SwVh
	 oQ4w8venRta1NoifGeELwPvApgSLW8qwDQkOms0pvt62KCK0JCp7LRr2NY4HdBYG/SoJC
	 0au8clw9KZsqnK5JkK8kx1mJH+ZSZmEepYOlwG/2SqSlA6o1ajJ2mGlZPyksOvG2LPijD
	 PccPmNUXeCXPJC0hitGjlTCuHvsk9sUT/W4FZh68K0DVlARg0AAUuUMJ8kjL4Ot82wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
	b=egXNH1lTi42sw/tYaUNogOXs9rA2Xbrp7YgBsVA+T3syddsaEnLY9ib/hf8FieqtQso3
	 3uamEG7EF7TRc68mo3COeCLALB1YjgX+b6DCHMel6HR00Gl19WShqco52kxAfZAKr1q5p
	 0qBCKoCehv3NQQWnsJqeQrsg4UCQEgyLJyIshFgnOheIfb8YmKBmTmM0x3OVfVMe0fd99
	 nJKAMIddpvIF9Gdvm66vc0R2mVSKQO46G2s1dPej7gaqr6s4yvN1kL7hb4I9NSY4r6J78
	 U+P+YBuvWsr7Jl++yPbnn4XgC47ISK3ISVyx0UoBBtfqI09U0L1x/RMPFcnSH16LCFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sw5kGqNw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3PNFDfV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B5606A32A
	for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 14:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B9B5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sw5kGqNw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3PNFDfV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVRaL1497063
	for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 14:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=; b=Sw5kGqNwFaTKAS2L
	IZeVisiDBKK82mwemBnbAy81qlmiMN1AUImIrNYT8pIEECDfD2aeT8YbyKZClQBA
	YPFS1RIHxSQhwZU7QiDamzxat9Qis5zBBXWhy5Nel4I7GOepm+pL0a9nktatsEM1
	XQZY+WwB+gtFisxUW19/+B4nWWimQdJGjV5v+U4hDbes6QmjOR41MHBEISAFQa9s
	bLhJIwwTvK2lad0UlA7DHEyihXQKlAMKkpE6FnUOwUTssr6HoEZMPgQZoGSf1L+r
	ifwv/DD2adf39rK5CfjoZHc+o8ACMdFoTcLRQD6b2lkKGInx+YUM/BfV+Vz+zMU/
	B1JthQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3c0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 14:07:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e2ae86687so157348241.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702022; x=1796306822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
        b=X3PNFDfVk4txNkaGXm8Ur1KS/Rr6/X4nwpcMwLVIkM5utJp45jZUoie9WC/Y3cMkqT
         CxSn7WN/irAy4s47D9aWm7PMsnnwui2W1mEg9dQhROoDKSWEFk9w5DZht7t/ftwXWBMx
         rzu9mf/m5CQRi2ebafUdOj4YuyE7BFfi7wzzCBs4BM04OLF0jeDy/flhl4d3LGgwN0t3
         Gg8HbLH2ShmjTvNYZHbvFkTYFOvJcpgR+79Mo6G3ZRyVeUJbNbXFaYtNKqTmdDsy8Kiy
         T2Py/fN15gKUXYH3Y+Zq+rOGE4WXPfBEkFN8eNj1B1kuB1qp+jzWBTJiLjlOtTL9f+/l
         pNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702022; x=1796306822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/PZHGfGIFkdgNf1wrqHkIre2ZwvIEblkzjiciZb8Xs=;
        b=K1+IK4fNex0+Nik7rujEGMgPUO0citmYfEkvsMXIUPoH8O2DyIGzCyvNdOwtOPE022
         UPVHS3KiF+98kQzu8FO1mf/kEpdy8MfsjLkLTtnvu3zYHZVLO4Xs+SWsHDWAe5dCgYWf
         6qZz0YzJN348Q8cBhnY++AT0Gsou/M0zq1RutZYx9PyzoOj7OVX9PfgZTS10zwCBTAug
         N/QdoTAUh1fjOupYlbvyx1+83FIEoi/0XCJ+x6e5L9RYhsD4am/rtbY6Lf8E/y2BfMAh
         rStoiK7g56Wzmp6E5upBJodLbXvAgZI/wmpVy2jlbSdHkkD8SHW6JD1vYGEZvAsOhAAw
         n9jA==
X-Forwarded-Encrypted: i=1; AL+hErHSRHNe5mAVSdNF7/iNz5F8eLp30IHA3nexfuGQie7h5roPRiEN1WAAibQzFqbn7oUYqawFK5o9lkN2tw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+e3nGb60ocDpQJVjMPQmyHZPHsFlvw6rHUA80G91LCOSI4SAZP
	Y/ZwKeiyHCW59igen0yhlN581FHQ//pJ3TTxFelUfRUq5oG3CH4pgO+b3fOLmbq6qUJKyiDJt+q
	4SI+oyXpQDo1EJgjy9sSjZYNQY6WtkxoW/zpMdG46s/h5c/EDFxk+BkIqzzrQLAhRHw==
X-Gm-Gg: AZFdTZfRshVmgc3eC2SseSZ/RHot1n3+kEbnFXcXQiiafic/Cu9aGGEzCQlcce5GX59
	x3uFAVvn/UvSwamZqCvPl2LAw+M3zXd1Ih4YXsiVogt//7HNIqM6Gw7WcERUtY33+DVcrdp4kNG
	j9i+y3LFq0SBgf5O74EarVzStU4xoHrQrR5tg/gakAPpVHkjz3ibbMCtn4DYaBuTZvIeAxPK40B
	A2hwfcQVg2pIsaacSUQlziqrlIjhy1B/Ci700eQ5/9bJ1Wf/BjwQENcxwdVhZ1EZJ/5D8KOsL28
	xf3bHuZSlFIOnqV1Nl7g36ZVWKPvWDcUOiCfkzIGqCiV2rGXEr6zd0+U6hG+lJwptNu3aWobKbR
	OGxQhFSpBv3/iQlSQ6u8gkgPS/i/JI+7VNS5Q4qWiimSVaQSAfUmnUFuiokwnqCjcmKjtdu3fp7
	Kw7FwvhLs=
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr13218602e0c.5.1795702021785;
        Thu, 26 Nov 2026 06:07:01 -0800 (PST)
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr13218529e0c.5.1795702021169;
        Thu, 26 Nov 2026 06:07:01 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm364063685e9.4.2026.11.26.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:07:00 -0800 (PST)
Message-ID: <cbf38851-d20b-4242-95b8-28eac985d21b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:06:58 +0100
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
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Molokai TLMM driver
To: venkat.yadlapati@yahoo.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
 <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX8lc8VI8qBubz
 7cOUROa91xvVv8x4r0rSxDczusWA8hPpmycSfEvXHPTETYMYTMObhTch3Vd+Q1A99pMb6Hguhrr
 a5W11U39NFqe4LcGCqIIAmokrCmHzzrTCyaabP4JPvAnrjUl4YIHXNkHMHns2WDmrBI9vSaBVIo
 n7kBeak9vB1WvbCk2UmxFofmzEjR5+bF/UmLZd0d7cY5iU4VOOaixLbFOdnhzfbTWxQq6r/jOSQ
 wS74/N7W+Rkddqr3u2bOqtjEHX7CErrgegddiM6YsQxIkMkPSy4cXzawRSfP4tlR88FOzQEz8uG
 n8odfUrM1ay4ikVY5w6vXexssgoS6YkT7d1d96FZCGu6Gzy8GXT1irBKXEip/Eu2t6DFOY3I8pR
 fW1mTXWWNn/AIHR7+h9OkOYEoB8Ve8h5KkxUDUYP8Be5q27GBk2zFV/kJyAyLuFvA4O8Dyn1mW5
 Xxp1F0Dk5UcY0HVqFrQ==
X-Proofpoint-GUID: KBl7wEWx6jg2SyHjGfVdshkqmA5IbjbV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX/LUBFtNaD+rY
 tohvIzhmRWDgwudWaOH52dnIOU93fg3SpPcd8BIfYQB9lP0V4Sw9DKP3jz22JXaRSH8yba29c/+
 +tl3tqR3gXcTpqHB6yKNVpicyFIz+M4=
X-Proofpoint-ORIG-GUID: KBl7wEWx6jg2SyHjGfVdshkqmA5IbjbV
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b083d06 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=CjxXgO3LAAAA:8 a=XEbodZ_ldB3zFuGnKb0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055



On 23-Nov-26 17:03, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 35 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

[...]

> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

Please drop this comment

Feedback from an LLM with doc access:

- Add gp_mn on GPIO127 at mux 2.
- Add gp_pdm_mira on GPIO35, GPIO146 and GPIO147 at mux 2.
- Add gp_pdm_mirb on GPIO63 and GPIO72 at mux 2, and GPIO88
  at mux 4. Keep each mirror route under one function; do not
  create per-lane functions.
- Add RFFE0 on GPIO138/139 at mux 1, RFFE1 on GPIO140/141 at
  mux 1, and RFFE2 on GPIO142/143 at mux 1 (Konrad: maybe
  let's keep them all named rffe?)
- Add grfc on GPIO79/85 at mux 1, GPIO138-143 at mux 2,
  GPIO144/145 at mux 1, GPIO150/151 at mux 1, and GPIO152 at
  mux 2.
- Keep qup2_se5 on GPIO17 at mux 2 for function qup2_se5_l3.
  Add a distinct qup2_se5_l6 selector on GPIO17
  at mux 3.
- Keep qup1_se5_mirb on GPIO202/203 at mux 1 for functions
  qup1_se5_l0_mirb and qup1_se5_l1_mirb. Add distinct
  qup1_se5_l2_mirb on GPIO202 and qup1_se5_l3_mirb on GPIO203
  at mux 2.

Konrad
