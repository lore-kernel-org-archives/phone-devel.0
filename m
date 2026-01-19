Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B148F3396E9
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818493; cv=none; b=EZghgHXnov/Lm4pAqv3MnA3dSyUS5MVV4s1bN5DQgCO6YdkY4KZLstAc7dkjHX8/T6MsCg4cEB3CasZk/FKiEkUnGMCHRQiDeaNnMoWxtHsyyR8SouYiFTWjoTfgXzXxzA+ul9h+WPD2Do+lrMDLXIWZd/Y5fboOeArPj/GXGw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818493; c=relaxed/simple;
	bh=1TTWxLD//vavcXET3qSN3d3YFlnSmRQXg+2dMp5AMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fl8IukrBaxD2rUi9oCalz8XQJFCSX4RBFGlq3d+sdpJ6hSBiofVNdcKHjMUPMm1gcarAlrOgHW0kfHdri0twCOQhCDvqUtr1qzpmHCwe4wYV52OoIpsCcbDcuauvXR2oT0B/0DN9yRCiwq9prSH7S/vOFSyJ6QDtw1JzTQl9EGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJ6EYiIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bneaf11M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJ6EYiIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bneaf11M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAJj4e1531258
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=; b=KJ6EYiIBH9g/wBvf
	blTbe9NYeUJNfqqFVn4I9dtUNpR7ceqayuliLQUyXH+o5DhTGup2z2bKdUyb7YUr
	VQRF7Ji2GLwn4GyvBpQ/+IH1sw4NVSCHk7RqM++uUIsC511cuc3PEqodetbcst4N
	Yjk+h7qvvlzqWndVNmdn2PHY2R1FtZNMN95i8gpeTCdejeWIcT93gkT3W+naKN4p
	CdcN/Zn35rV0TtyHKHDqaFbJ89S6MS4XTJhut1/GMmLBOFTqONuoo27JCm2b5Pc1
	aK65wS0t8JJAxmuecwsyznaWBnwe6hEzz/EtEBxOfY4702nikrlcLU/7ZoAA8FQ3
	bskqtw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxr0wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:28:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88880bc706cso9198586d6.2
        for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 02:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768818491; x=1769423291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=;
        b=bneaf11MsD4AxTKjXsR/L8WOZRHN5Kxpgq2iq76jzJdKuoY5rwHnj4HUOAO2OG+8Nr
         8Os7eZjFGVbW0HeM3eDZHSAjMqiEvXVNbB3jcuYHgq97yjZhA2Z9+pwhwNmpdYkO6MNN
         /8Uevkg4/rL4d4mhUYKCOotyoh5cZzjv3JpHsclS22W0c5KAdYFaX2/4adNQjuUHS4QI
         +mBu49hsNJo5h+30m+ZQT6AJZfvu7H+CKWb3tG3Kc5LA6jTZilHG5/1LgVHoKpCEofF1
         jPyAnjwZ8lqjPX5Qz3fiZWESjPaDCKAEjF29fga17t1rdvq2R61ofCw8pFqqyBIVgix8
         VMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818491; x=1769423291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=;
        b=RPiJkehEe4oSYfGzFpE3z9ISs4v+DzZ0Grz5n/B9BdQ+dsjbq9oHhkyfe5x6EBVsUi
         Wrf8v9aZU9jny8kAF6yMeJa541gJGprJgLPR7hijSaZS+vimocwZTD9zUohaFGAFuvqg
         eW+HW5q25emIREoEx4SpgOLhMUraMOhZHRT9iGM30weTs8rHX+DL+HDc9XtgFHQy/u7W
         aKgMn5a3aR7eIdpleRrry3Fr99s/crMHyqThhZIl7+93gimQH2tyWsIOKffGJ1/REWBZ
         YXDZjPoxASAuSdAUdbGyKpc6fBksMgxtaJ03z583BnKqAVSBUTvNP8yOUTaotRZzARVG
         LxnA==
X-Forwarded-Encrypted: i=1; AJvYcCXpRXZ29E/kolvNVTtG1K8zcfZe7SvLOEmZ6kmoAQtmlcTYGl6y47aPDhUZr2Xb6WiGpSUQu6YWIG7tqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhkRxxQpo3TsEt+hLtNzO6luDi22IfGISD4mfyW/vTwQUpP7cv
	7POfRgFYWti/PM48rcdUM7kKoOHnpF/0a5Z0NmXamsKXqBcZGs7rgGlf0KlWbcVlURrGo923QMc
	Y8X/xx8PdLTN5j2tpVGPRnReZ5/G8BQ1eZazN8LASVvagRRxsmiAGnIgn0I1zXW97zA==
X-Gm-Gg: AY/fxX5L0d8fXfCzUFcIX4TdCXiyVTTZx87ExtizCnTlwKZGSfhny7ou2me9HLANbh6
	YlItaVOPzDHLw585Gu4XyDeqPu/Co2S5R3WO035V9ysBmqKDUTcn52OLMQkjqKFR/W/aCm8+vLf
	7oHZWclyF06bQ663+bTmANGO2/0W4PsXn2fYjihMZL03jaObz4RtzUk7SXgo2L59zXkdFxXoRfI
	4wHxXiCDnJ0PC406zAN26IzhY/qDbBBQ6aS0thx0hbUGJTXrMkphCACGsJK3V7aVt1RzQm5wBnF
	c50wAp9gEm2+C5Js6iLbUB4Y1KaFXx7HJAXg5PNEsxVaSqQ4OBsRcuVUg9RnH8UL3xHu7dIxjgd
	hZw1fBWnCrmCYwjFL28+blxoPuZbbTsY9i08IT3RijW13b2lEhJLbnQlNr6AHA9GDohY=
X-Received: by 2002:a05:622a:1794:b0:4f4:b372:db38 with SMTP id d75a77b69052e-502a1603f71mr117659181cf.5.1768818491056;
        Mon, 19 Jan 2026 02:28:11 -0800 (PST)
X-Received: by 2002:a05:622a:1794:b0:4f4:b372:db38 with SMTP id d75a77b69052e-502a1603f71mr117658901cf.5.1768818490586;
        Mon, 19 Jan 2026 02:28:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm9920707a12.10.2026.01.19.02.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:28:10 -0800 (PST)
Message-ID: <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:28:07 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NCBTYWx0ZWRfXy4A2zc5tT8e0
 0LLlDV9lTguTvm0aSgbPCenC2wFgVIEEvWSf/gXkNAieYLV5JkYcPKWbTbuLAEkvU5QIAjS1A8W
 ItcuwDbiERQ0l7b2Fda178/8qtnUFEyyfEJSk9eZoReLCrIiLFos+ZFy2UwJdHoKzRkGHFbPFFA
 d9fDNhf7L6VYQlS7UtI37hw8Qr01Z7R3YLVpQi0xA53os6wKdXGmH3xr0ZHzvF/7TS3tMdSkcD4
 qf8cFR9bN9Zbl+ndu3vtjEf8tz7kjur0KUFH5ofjsrSW89GzXu8CCxlo5bM78zPTwKl994lj/D7
 Ez0wJpX8yhU/d6HXkqKsVJtzoN6cC7CmphTe417OlcIiMTMZkWZjZe7H0qUdd+0h39jSdvBduWz
 f+tKfGhiXQJ5CT35a+/JUa8t42Nwj4jFMkAB3HIcUL2oE531BVQSUZih4VjKyKVVRsKDM5bnp5S
 ldanbdGRRZo+tlBXN/Q==
X-Proofpoint-GUID: wjm61QId1dtw_TBf5P6qYNf6VTpKrxFW
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e073c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RTbhy0NO0nWS4SIPpYQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wjm61QId1dtw_TBf5P6qYNf6VTpKrxFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190084



On 1/19/26 11:20 AM, Konrad Dybcio wrote:
> On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
>> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>>> Document an interconnect path for camcc that's required to enable
>>> the CAMSS_TOP_GDSC power domain.
>>
>> I find it confusing. Enabling GDSC power domains is done via power
>> domains, not via interconnects. Do not represent power domains as
>> interconnects, it's something completely different.
> 
> The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
> 
> For the power domain to successfully turn on, the MNoC needs to be
> turned on (empirical evidence). The way to do it is to request a
> nonzero vote on this interconnect path
> 
> (presumably because the GDSC or its invisible providers require
> something connected over that bus to carry out their enable sequences).
> 
> Taniya should be able to explain in more detail

We'd have a better chance of her responding if I didn't forget to
extend the recipient list, fixing that

Konrad
