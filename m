Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1342B368941
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522890; cv=none; b=XId+mA1fr0G0G2FDv3BYX89OWrR78HC6IsHAi/VzfFg+85MggCAhW46CjPbeF1+wBIpOv13NFA0ez3ZqJPr2P5rtOT5Q8GVDLyuIeVyLT6LtHtWwrgjIhUBTwn/iGmWFFI5Zefx69YHuYDBUyHlYZwDE/UsjuQNfu3fqCqQ9gIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522890; c=relaxed/simple;
	bh=cDaY57qKIm9pIDy7cQO/mh31CNZBhQYkCGOhhBSUbv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljTM9om3yO5I5Fgiwh/WF4Sw1WAuuRzNz7mWwjDRe1fyLdc2Lmq9zBxJIZJOXjDZM2R5nSlYjTSLkrf94aYskuP9SI5T40VsCZMCHzS+8WPGnZ+1A58net07KEp6p2cvj6BWcx/IPQOr/i3dp2BEn4hXQXnXBfQOLwqsg+++oEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6YyJQzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zy9yhvzs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6YyJQzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zy9yhvzs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6sehH1062113
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 11:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/Y8amr0VtrBzPYxQ+o9DK37io1izH8toJT61N372kc=; b=F6YyJQzE7+q02wN6
	KXupMiSQh26bfdKkPgK6VlpzarxoN6W7akyix8e5j7ewXh0kbC9LUdEZuc+XETzE
	LLvBHfWVrbw1wlmVyyOIGCbi07lfvJaax+10AcFXultOMhx6F4l7RxhAKmWAWoDi
	FFfeplXtUbPEJ3QqyacEIVzyuG0TT4VELuHxlC6wIkycQ9nLxRR06Gth5EDH54dM
	rNtFeF4to6Oj7XiAYQI0/Po+7ZsvLbKvwOdmBf/9+P7l4z8AQ+mdrI3yKKoGCiWE
	0/T9AE09gQKnrpnvJuUaCYIrABav1zSX6kSTOS0zKZOC0MTHzwCtFJdYtdxCQ2Q/
	GjshFA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkstbf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 11:01:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffeafd52e3so40178137.3
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774522887; x=1775127687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/Y8amr0VtrBzPYxQ+o9DK37io1izH8toJT61N372kc=;
        b=Zy9yhvzsCRpbQI6ym/seJn4MsQfdXD05bHRpzL96bhT3VpuBU7rUaxrrFdB0/AGzKH
         K8pFPUuaYnWAuZga7/C93kOoVNhJ85EfgFCra+JalIt4xnEm5UoctyDYjzy9ZL8ozzdG
         q0iIO7275oWeGHU+XR1sByGg8XxYglScCZ7rZorF12SQEkoF4PX1tT4uBwG2nGvIEV9z
         mG5f3is/g3V1BSCkX1hfhWXc7u3YFw9DOkv1IZsRJVrJLJKYodI6A/9lgoc7KofeeioC
         jjlFuT5UgZke1d72aXryumEVlQeHRvLyVjI9ZAZcAtgP1xycfPzye2jYyuzzE/AX/oQp
         gu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522887; x=1775127687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/Y8amr0VtrBzPYxQ+o9DK37io1izH8toJT61N372kc=;
        b=jLU9wN9qzl/10ghU+Twm15GqILucyr0lTrF14KZIXLbFc99veubgmOShC+KacSsr6t
         B0xclKAuySmHrQh1tKX9ewnDvLoN7UydG+q8YB2WHUsOk/3WMK/KXdVj/OimJjh6rDc1
         WmeVmY2f9+Max2Pt6+FJfQDbiVij8KpYoEm8YSaFPvQFF0OewfSeqhAIaEUPt80ZxOyU
         yUH4FinZX6SctjnDTkZ90RLqyngJG8B1Jek0OdTP9i18nSo095ZB9Wo/niDocvjTn3na
         btAIGZpAttraQ/G8ZNz5dgji+CpllT19Zxl0rCnHu0P8sszrMWYeDd6WHgkgbeQqbbOc
         N1tw==
X-Forwarded-Encrypted: i=1; AJvYcCVqOsJytQ4sTYIJ7lyzweEfRYWA3K7bJOigD9GgfrlvujamUba/5J2+hmygLZBPmCJeC3ktRRiFjsROPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMASIHTdMHzL0O61WLqwGcmFg3vkA7ByjpJ74OTW7rEuaxFklS
	uhU1SCuTDelsPdiiqrzSSsNFoe26ljr/9HlF/OozzhvFgxepCwA//wKUnnZdjwgh7d6J0p2dnFF
	xAILwXRm0lFO8Jyr/wQMYSONmoC3EpBzQOujzWrUo5cyoSxyZ3PhJ7aWBsbHj6OJYsA==
X-Gm-Gg: ATEYQzwVVWGQjQJJJ8ZOSuZ1c08yssGpZc3WYNnZhXzPQrpChn+43zFGgmzv+8h7CRJ
	M6wur85HKuwjNu954L8esR86rvIbc1o4mF8WGgaKYet4qlhwp2wlrD1VmP5SxymlBLPTDlvxzrE
	dhTeFLcrteYXZw1AHnV31owTbZUFxDiUoPfUeCCu0/kfUfBVdfexMxzanvZCt53uK7J5WkeDbsS
	NOz7ke5b73uYbCFn9D6uBZJsLU5RKWjBXT+Ss+cfM/mQRBuVW1TEWHvv3GYCbDZXEHT6Uk4KdT0
	dH92MuxGG8H1xp3IXywTIGECEFbGg/OALQzM2URfbJaWR5qUmmViTLzgssq5vHna34CmpfBjaCk
	HPtHxgpPuUbngXy5n0HewlTPG6ItwU1nDslOCJb4dJ2PgIG9oKLWt6HS4I8IeHIZj2wcXANShEM
	a7kro=
X-Received: by 2002:a05:6102:2910:b0:604:e850:92cf with SMTP id ada2fe7eead31-604e850937fmr121289137.3.1774522887260;
        Thu, 26 Mar 2026 04:01:27 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:604:e850:92cf with SMTP id ada2fe7eead31-604e850937fmr121241137.3.1774522886657;
        Thu, 26 Mar 2026 04:01:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c0cffsm103374766b.35.2026.03.26.04.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:01:25 -0700 (PDT)
Message-ID: <ed0c8b2f-57c9-49d3-963e-a6d4b6d242fd@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:01:22 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: qcom: pm8921: add labels for ADC channels
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
 <20260326-pm8xxx-xoadc-label-v1-1-027805dad4db@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-pm8xxx-xoadc-label-v1-1-027805dad4db@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NiBTYWx0ZWRfX/QERDyk17dLL
 1Cg/rKXr6vILd53e+uclAzqwq+dDdMGnoFaaIuA4hyyhsmZjtQ+kJtaYqF7ntuM0PdoOs4nS9iS
 U1EXeIm8wAZBG9cLfl68pYyYx6iMUiXtV8Bl+KOZJm4qZE7+eIDClKKGOkph6vcjHnKcWalJVaX
 MNtpWnxcsA0emYeotfTm9TvKki3U9wyriZOiii0OGBQ2qFnaXjM3laMg/qxgLX8n6M6sy2k4Ge2
 GzMHEpgQZ+lOYsog0BMyraxqV06Jw58AkieYdqMYjiAp2cm1cvBBeK/cnv66AWWgfAODwMIOYEH
 Hi9Fr7bK4P4VQIlIPRtI54ffBYiHK/XcKORMld9h28kgdk3fD0pSXwqjhnr3LiYsb6NJbSrDqoI
 VTclaYDBDzhKb5ZZ1EAsDQFl04INeCIU5zbgObMxPU3I8rt7P0rE5nI9OmWw4RWocVV+w2VVggH
 G7AfHweqP5Jljy1eRoQ==
X-Proofpoint-ORIG-GUID: ALJBKn0zJAZLsfYeMaDen_K3IRTdL1Ov
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c51208 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8 a=Ke7W15zrM9QGlUBYRRsA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: ALJBKn0zJAZLsfYeMaDen_K3IRTdL1Ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260076

On 3/25/26 10:02 PM, Antony Kurniawan Soemardi wrote:
> Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
> device tree. This allows userspace and drivers to identify channels by
> name rather than relying on datasheet name.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

I can't find a reference but these look reasonable

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
