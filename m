Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503E3365A1E
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294340; cv=none; b=oCBhsILfx2iQdwzCqAtK6KmQvtEwLsqfHUGrB0uv5OspbEf2zWovUiWMHAHfb4JQydrwJ/LtMLCZt5imMW88TMe3+UQzB1gDV441U9NuWiqhF68dE4PETp2tqRnznTJBKSU42Evf2ALETOZEafiHDpTquGxKWI+AsFMVwXeDUoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294340; c=relaxed/simple;
	bh=YzbNl+xbvpUyD5ayuMrcbo/apNH7bMHu6PHtHnLxoYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWe1qU1pfbXqlST9yWbEicsbY2PT7AwUX6naKQI+49e/mG8k90GCXEZhdX+YpIPmmeeUmqNb0jVBpT7RXJKShOySixdbW55QFAHaWJYN5sK84676mVyk0tJrKbawcQxZXisc/Q3PZjuIapqgNZSesVOUqqzpr3kQO4mz9dNLIEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LjIkdpla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHkWHkU5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LjIkdpla";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHkWHkU5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D58xTW2834936
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 08:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lQXOd1KKTc9ZUkBgQZvbAmGnYcheIgsNLhqD8IWc+E=; b=LjIkdplarapmzQwz
	4Dwt73rSX22fVP32HBuAYLrmu9ts/KFyP3Oy9YIhTMqSLP8zUP3hUeb2pH4ES4GW
	sHaIJaCI7e/5uHPtaVCMQz0Otb1aGF469ALcM7yl7BnbxzBKs4MTIUF/Kxwo6qu2
	67yUCtAv8jel6qwAzRcxubuRA5TpUhJTDDvr+M48hOfVz9fiSNovUO5HyGcDqgbC
	b0NQba5BdV7kTCmmCT5jC4XZuFLmoK1P+U7yFO8mrs3bZ3ZgrpRSprBN5/ZZuOlP
	4emz4VOn5rytBfpEuA0ip2+iYlRQOArWmHF9YaZRiuD7HN8OjZEUaQv/PvVVsDzr
	oDtliw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9rkt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 08:52:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso24652351cf.3
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 00:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294337; x=1768899137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lQXOd1KKTc9ZUkBgQZvbAmGnYcheIgsNLhqD8IWc+E=;
        b=dHkWHkU5O/EvIy105nAZgfjrwR71SnaKWJ3agVFwnL6NLFqkj/yWOAfFfQV3almPhd
         /SXzMTF3ANnhSm/wD30H3fJvJBvbrFF1UT0XTzSqum3cfW2OEnQl8mSMal/9Jrr/IQAx
         DKNNeMJBAWdUzetdotTb+zKb+itGCXKSDzTHtUQ7qXf7W25vHXBhCcYsHie+WiSnfZz8
         bGz6Gt9eidt+WlYQ+2fjE4CdeoYnMTs8QxERp3HiNIvQtj0nV7lg96W1d8elaKC6QI0B
         MDU0jQ8Ab6kBsCbXR4Cxzl0KafBR/L5RzFzWRqbUFw6dHchrLMpej6ujSY2LDvLjzn9b
         aVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294337; x=1768899137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lQXOd1KKTc9ZUkBgQZvbAmGnYcheIgsNLhqD8IWc+E=;
        b=X39Dx7rH632CvTP5mpmySxbYxbDtcem8mMpY6t0eNSxtg0sTAs49wUMda5NBgMQorY
         +kjMcE75p4/Y7iXLd3h0Y1vsnBhQy/Yn/ZpoP6HM3CV9SkhuGoxqdgsWr0Vz1a1gR19A
         pJktwv6dPnzQHoYiZkn4ncJr/+UPOeez0NbUHcD+GVcRUgJHmMJMT9oEnOp58Nmp7FGY
         1N3otmAqb29AqJIcTi7KqyRyQ6oeCCtOBwk/eKIR8kBaA2Kbr9Z3XQ36yelfR52E/xI+
         J3Gi+r1y0c77MtGim+HPD0VJPxW4nXER7gPsQH7PTWNGZwtnNhAqjScGYFD3e+D8mgt+
         9/ug==
X-Forwarded-Encrypted: i=1; AJvYcCWFBK9Ibv1mqzi4+/8L0xu9I0wXLnNV3+c1zE55CH32ijJHS9UWG6Zrfw8f5SO90Z31uvm5tuibP+A8EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKeWKHIBBseaXtZFRZBLAngnEF3YIKPgafv7KiNWUl0N9/pHso
	Gbom3wBfwhMdMohvEe68ncbyVwMTHmtDxG9mTc0HC+UXrDBR6/UfEzAyRJu2WiRspa4HraZq9eB
	2SZLcPErW3ITkm4wfK3D9A2WBYmFOcR41Kz5QIz7AG80mbWGsMwLoneg/9ULrxx/OtA==
X-Gm-Gg: AY/fxX6QjmSXFW/xwX7nsRyX/Hzj2GnW2WBgcEvkF7U1KJbNq3dLZld8REdfJaLGDDy
	YSuzg/g+z2sSZPwFECSNdo+3stx2MWfsav9KI+ZkiUyz6YQkItuTIQ4unUadgRXjt/uRVvcTLPM
	iPoiCadMAOb2atPQPUBDaZhT6LXMTRWvC+O3ECLir5xLqnI4n6cH9GfVSex3g/9iN4NAcvTduq+
	abn3zAXC/876Oy2FuQrCAODtEz/oszi6gf/mZAIYfsUEJfMNNGKoyZ45Ohpfpysdh2S99548FVv
	FH7grU2unci8168MRtN3K80yoo3p1AYgHawLXh5Kjmw0Jwd0Pb0xhjsJs3l+/fXdFAa3RzCW3Yp
	PrKGGmmQTQ2ghvYZ2R9ykm6+vOGqzNDHChX3E3d3qyGRQ3da/JE9fjeKZNr6uSVJhrOY=
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr231896201cf.2.1768294336586;
        Tue, 13 Jan 2026 00:52:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETc6GdkVdeaY5/4I3Jcs/tlWW0K4PJHocn3Se4hiY8tlHeYxeD0etiISmOVNLOKDw8XBRHhQ==
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr231896101cf.2.1768294336208;
        Tue, 13 Jan 2026 00:52:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe76sm2137792366b.40.2026.01.13.00.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:52:15 -0800 (PST)
Message-ID: <dc0d8efc-2cc4-4d37-832b-f4cb3c170722@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:52:12 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
To: barnabas.czeman@mainlining.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
 <aa8d5d6f9301d94b56af4580210ffc88@mainlining.org>
 <nrudictx64m24ydh265c4ma7txfdmmncjqfl4xq6zxvk75lkzq@wu6vnehc3dqu>
 <abd31188336b3322b9322f1e6791320e@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abd31188336b3322b9322f1e6791320e@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WxRZ6NyfYI4ei_Au0VSNlryNZveUhAmY
X-Proofpoint-ORIG-GUID: WxRZ6NyfYI4ei_Au0VSNlryNZveUhAmY
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=696607c1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8
 a=dFmOiwFbY9cOzGFAODQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX3loseN8OziwD
 zax2DF0A3O4fAx+u89UPjBwH7SXal2QTnRU44YK85ircp/BQCDuW1BJtNwie6D+ClScSHUUXf/A
 YZ3CYyEWw4aNP0pmijb23yTI6blpt6FFqkhhAZMlYp0we3eIsIrXpHCEGu39Tp2M04Rpq1aGBF5
 RRrtXYfIZIhEpXgnhc6+5kmOPskWirynfsQV621KPQo6dbPiHgHPDixogIY2p4E9dknbV4/OCej
 gLXFNA03U9JtgUWY/XzlaNMEqB8pIt9HD0O8MJncxSlve+x//D+5U/+N+t7rNhXJwS1hWW1Gi5/
 hIzoSpsUFey3lj/DHBfyA6en24wOf1Yj+XSr6gKO+OjzEGXO3HY9UEx1SVP/aCJrbvgLUB4GM8n
 XIwUUXf2S17qA4ky1e2FJPpVqzJ7HWhCqsSnjVFZcPlH8YAigjgNCCwqrIaPJdOYy9NF0+krqXD
 Z6tG8sPrmkelfKXCmig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

On 1/13/26 1:49 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 01:22, Dmitry Baryshkov wrote:
>> On Tue, Jan 13, 2026 at 12:41:43AM +0100, barnabas.czeman@mainlining.org wrote:
>>> On 2026-01-12 23:15, Dmitry Baryshkov wrote:
>>> > On Mon, Jan 12, 2026 at 09:13:29PM +0100, Barnabás Czémán wrote:
>>> > > Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>>> > > the only difference is willow have NFC.
>>> > > Make a common base from ginkgo devicetree for both device.
>>> > >
>>> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> > > ---
>>> > >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>> > >  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302
>>> > > +++++++++++++++++++++
>>> > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 296
>>> > > +-------------------
>>> > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
>>> > >  4 files changed, 318 insertions(+), 294 deletions(-)
>>> > >
>>> > > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> > > b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> > > index 163ecdc7fd6c..70be19357d11 100644
>>> > > --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> > > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> > > @@ -1,304 +1,12 @@
>>> > >  // SPDX-License-Identifier: BSD-3-Clause
>>> > >  /*
>>> > > - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>>> > > + * Copyright (c) 2026, Barnabas Czeman
>>> >
>>> > Hmm?
>>> Original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi this is a new
>>> file just the file name is same.
>>
>> Following Konrad's advice:
>>
>> Would the following addition to .gitconfig help?
> No, only until i am not creating the sm6125-xiaomi-ginkgo.dts and adding it to the stage.

JFYI it works on my machine (tm), the part with just additions is turned
into:

copy arch/arm64/boot/dts/qcom/{sm6125-xiaomi-ginkgo.dts =>
	sm6125-xiaomi-ginkgo-common.dtsi} (98%)

I'm on git 2.52.0 if that helps

Konrad
