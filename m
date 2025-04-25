Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3D21E082
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614939; cv=none; b=XRyXPoGrCKhQ8j4t4Xo/rKMboNYkCUqDeYwlT7QtUXu8tcEwncevpB+nDUZIyAvna+rz6AuerthewvNEMtbj2Mrp97cUy0RtqVvlMNbIbDogPm+8LUcQQOdzU5z+7EOega2GviAd3Qo8EBnUVnrlWhvux8td0srLb6EMmH46seY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614939; c=relaxed/simple;
	bh=FoxC89tHfNSH1oVha4VRoLqPnSjX0y1D+aZDbZJvJ1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJYmIwiv2pry+xTq/jVilMrQzmRIx8ePk5OFs06B+etP+eLUJzXMECvbLg66Db41dNAHIaXTrVknCupgH0rVsHjgWa8+qH7b7PCDME27+ziSsEH0YHwawiSiv3lr8WhNab+c9oiYLHI+1SPCWSRd7TBF3wpBith7RfVDqulrUBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMbg4l+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMbg4l+U"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqtD031947
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 21:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FoxC89tHfNSH1oVha4VRoLqPnSjX0y1D+aZDbZJvJ1g=; b=LMbg4l+UfM1XN+1b
	fnn3cciq8zI/v6YHyGoQJYanBK8fzNxWOsQFQogpx6hA5gac1kJ5EI9mwh949+YG
	xkbNzzGbm4IFoCIrYeIbvVN9FUAem5kY88dAr51K6evolZpvB4wSYmNZ7xiwcjmd
	xQ86Ie2lEOWL3uy6ptC+bNCEgAQIE0E5+rzpfbPsRisyNWh+gdXNrNUv4Yx1pu1c
	cFGAo1cVmap9F0n/mttdFH9AQsx4V8g2GkWClEsEPZIBebrXqUXO4Fli+te2zZGF
	DnP7qW6Mhh2P807dKDoxoRFUk3df3QXtByclxuNBjBFT4WV2g5bqG2NPbmuyxTHo
	Jmr73w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya8wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 21:02:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47983a580dbso6179701cf.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 14:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614935; x=1746219735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FoxC89tHfNSH1oVha4VRoLqPnSjX0y1D+aZDbZJvJ1g=;
        b=PVr5E8cvLtk58KRNrROLK4u35V32MxLHUJec6NNMq/JlZhLMFptZ1hE/oQwC3ruBwZ
         mIKUYTfiEur4nuOtSLq2i6UmlyXTiG9ovGD8rtmXPOBBAc7nPFJQfeBf5Jz3Zye7udeA
         m1hP7DnUOfE+jo7GmvinR9F7iiP5yOKFbsGqVZTTVGYfw4zTvCrMaJUkx2cYHAtFwnKr
         0K1SFVaJh8X77jg0H+5tocuEFvNxhSW3YwaXVgxPm1pbp7+iO/6seauSZIptfLUgj3MD
         5bfZF1CwymXwDKn+Y/QV/0Oxz407MAkDnKnErCbfJ5JHrksJeqVBn6KlkL7uTnw4Mm5x
         S7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxvepN45oBk47ecvY5jOabnaH89Hv2HNOhhIJmmZ04uBRseMg2bhfN80suhLHH91DaMMXaQuStwheETA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFU97ghqebxrK0OPLg5x6dA7ae7/XatWLNZMe4UMbvExDxwh2C
	S15hRpAOxk1TjYdosj8JBJhEDDVcqYYbvZjAs4pgRuKXOXXtiDQoTv26ooS2pknygruj8oC/RUb
	06/WrMdkjdJKEFp/7quL8aVrTezM6iILpGgCjmC4lfQlKPWF6AuFRZlq962EH0w==
X-Gm-Gg: ASbGncuSZnPAjcUdNZ1JWM/TcLatRoOq+9uWSeSUgKxvQY5Emtmk9/p0jLAoo5ozWAv
	XHEsrYo2DG02VvMO4QYxdWV5NYRJ7IABjzfCSyy3kUDDgUK1vEiEfh8REoN5ugDsT4BAXjgipl4
	uQh/0sfiO3ZQqrr6FsA1n6qLyWxv8vJ1n0RfkKKstBWIGLBp1u+OLus9yeBaXaQkLf42GE+/q9B
	zT/IRUt/KSFv8+RdWSTG+6dM0H4SuEY68VXPsOGquJMsesDsdBv+KnAk0s++2qjk/mfD2S5/eli
	tEe2+mVmNeWgO9TPDdemFOCtsXQ6l/nnYhKOSPqzSQZPvUj3+B6uQXNnUUkgml0Bohs=
X-Received: by 2002:a05:622a:1455:b0:472:1ee7:d2d with SMTP id d75a77b69052e-4801c2c16e9mr20346751cf.1.1745614935203;
        Fri, 25 Apr 2025 14:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg0tvFhoQ0KNEBhHGLhEi7O5sgae/+O/jdTQKiFWyNNG4fCuoMl6ZMxe0c4BHyGdyFSXXbhQ==
X-Received: by 2002:a05:622a:1455:b0:472:1ee7:d2d with SMTP id d75a77b69052e-4801c2c16e9mr20346351cf.1.1745614934774;
        Fri, 25 Apr 2025 14:02:14 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed49c2fsm187099666b.124.2025.04.25.14.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:02:14 -0700 (PDT)
Message-ID: <656da4e9-b609-43f4-9afd-006698a2c7d6@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 23:02:10 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
 <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
 <5ccb39f9393b44761127717096a38a46@mainlining.org>
 <68e2c0ee-d5e2-40fd-9ca0-262ed3270628@oss.qualcomm.com>
 <31559417a92d1e1ff17d0f3add9a1ba0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <31559417a92d1e1ff17d0f3add9a1ba0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MSBTYWx0ZWRfX6t7Kk52Vr5Dj 4UU1NTNpR166PW3vRKvuCuyBnMwNtZQHBHaiX/MAjOoKMlGcaKUDqx4Tmk8gliuXOFHv8ldKcK6 iFTO7fWPVbJFGXUiv8J4/9t8/KScfvHyQnAomVtCbyEWeEneInxBEzmEiU47b5we25GCXWpoKcT
 ZnUj/5hsRNO0yueoYyDkS6ddmloT0n5PciyFo0mUxYqNlTmGNA7vHA10D0GFe86Ad00SaZI1VOy SJOSsrCJVy+EPWyaaPNAp359xtoHAYScZDC5b2+Xal7DJ1ZIq4rxssUqprrzq0vZcLYc1LtaZ43 eft6flrevPRA4PPcY1SZe/KNoRR9IcL2ClfYjcjdSGxQlitZ0q8+5B9+i+liRfJKlSmbmoiKeO+
 umyU9ipUU6N+J8GMskIVxOEmKRhnaQWY7slspDRUjn82ipLCit4Nv9OsRD3IEhwGSpIUlbFn
X-Proofpoint-GUID: fvVYB6T7o6GO2xtvt9kbQHF6xYqQhDJL
X-Proofpoint-ORIG-GUID: fvVYB6T7o6GO2xtvt9kbQHF6xYqQhDJL
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bf858 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=qC_FGOx9AAAA:8 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8
 a=BjP4FqewG5DG9Cpw7CUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250151

On 4/25/25 10:22 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-25 21:26, Konrad Dybcio wrote:
>> On 4/25/25 5:13 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-04-25 11:57, Konrad Dybcio wrote:
>>>> On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
>>>>> On 2025-04-23 16:03, Konrad Dybcio wrote:
>>>>>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>>>>>> From: Dang Huynh <danct12@riseup.net>
>>>>>>>
>>>>>>> Add initial support for MSM8937 SoC.
>>>>>>>
>>>>>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>>>>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>>> +            gpu_opp_table: opp-table {
>>>>>>> +                compatible = "operating-points-v2";
>>>>>>> +
>>>>>>> +                opp-19200000 {
>>>>>>> +                    opp-hz = /bits/ 64 <19200000>;
>>>>>>> +                    opp-supported-hw = <0xff>;
>>>>>>
>>>>>> The comment from the previous revision still stands
>>>>> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.
>>>>
>>>> Right, I have a series pending to improve this situation a bit..
>>>>
>>>> In the meantime, you should be able to define the nvmem cell and
>>>> fill in meaningful values for this platform
>>> As I wrote in the previous revision there is no nvmem for GPU on msm8937 only on msm8940.
>>
>> This seems not to be the case
>>
>> https://github.com/penglezos/android_kernel_xiaomi_msm8953/blob/pie/arch/arm/boot/dts/qcom/msm8937.dtsi#L2046-L2191
>>
> These are on msm-4.9 was moved to msm8940.dtsi
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8937-gpu.dtsi#L162
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8940.dtsi#L600
> 475 MHz and 500 MHz is for msm8940 at least based on 4.9

I'll try to get a more conclusive answer internally

Konrad
