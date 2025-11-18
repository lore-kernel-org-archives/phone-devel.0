Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BD3016F9
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476334; cv=none; b=sWHJl3g61HNVugDAmIAlOoemvlZw+HuMDgdEMaKJhKbR8nkLxd/54fMEJSqMHHbjJhsDII6QEQAedvOXPZw8yyzU//NorTIyMfo04bM6/Ndshm4gfQxTiF3X3IBLHtSo/+2lk8UORrlprQgToVsGAGik0ht13cC+nlALtuOEs5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476334; c=relaxed/simple;
	bh=h50v9D4MuDGYwnwlloL4REEg6nMDf6fIvjUYpab291Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FoB+FlOqNcCc5vB2nB9Wx16c8eTAXvmH/X1fL8pWnuLEzs0i0M1mgJJ9JzuBw2iTHbTUjEICBRRjawjS65tkpDFJkXnpCDlrz87JJSGbIv1P7Bmm2MyI1Wu7VeZv3P08SxjDPnNgZzlv3dri15wlHSZf9WYIk0aXeJzWvMTzWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlO/a+2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlM9gKuW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlO/a+2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlM9gKuW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIATLfc375768
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxG+6rFr2MQQNNAKsMfjte5F10Wv1iEFkjS3sDTQEJs=; b=SlO/a+2zQdtw7Syo
	RW/annFdnysvbgpPdyGEVuaflg5oTX5DP9OQMkyNWI+D+6X2tibIP5TjYvdxmeWx
	Gbmwl4CEkV3uSZiokziIjcoZPXaEAHz1WJOBwvIsyPYQxNHLB6E60KuO7y4vF5QA
	53bTBXOOnzSGg5u74Qmeqw+mbEAxFiNg/AIKxg8dL0nM4kIGw8lQ3p1lVklGyMQC
	RuwJGVbTtytJJXtI/JxaV83OlSrHI1AhpLWEStJMpPdpaNtchfjeOpq4zMEv4joU
	9i4oihUJU4QubE12XKZeeJxLEX+5e4daq1gcqi/rn1x+qdpqRQ0+4iiwa5zg2Llt
	AZQRlQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nkdu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55976a7c782so674829e0c.3
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763476332; x=1764081132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxG+6rFr2MQQNNAKsMfjte5F10Wv1iEFkjS3sDTQEJs=;
        b=DlM9gKuWhXWNNpDiY60Q7hb/uBmFj20EQcFkJZ+OmFh14nTI8NWFdwBNSo/bMDUXJH
         c5MOKuM3+328vBfd17LjY22y39v7+59/vH7XRIghBduzrFhst/xv1LXgy3pE8mVcN0eC
         EJz44jfYv+edlLeCt9K0w3Ff+zoaLm5g5AhrLMHEpAgF4J2+39v5vn+bChon2dda5pW1
         BOyQgFePO0UE/L+aGVsiegzAIpkVArbrQq0Q49MvUyYyvBogG0bEkkCofA1dCE4qDqD/
         3wIrkOr/x1ws9mWE5H2Tv2WEjoVLUbqkaKJgpz0ZJ9iL4NLKrvjM7bW0KnR/Cdexww9S
         PvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476332; x=1764081132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxG+6rFr2MQQNNAKsMfjte5F10Wv1iEFkjS3sDTQEJs=;
        b=Hk4Eg8tSWya/OsKyEOMjK3qw5Ou6LyjTiOrvwvMM5D8RQuYO/NTzdXedP8DS6uNJxp
         dptcfSRbgmGiRkdSPCU96+wEgL305uPo8bZyE3xGe80R8F+a21SLyh+ValdSABdszkWn
         GB0xrU7zcudDXkjUazhTSq9H0CImdvrGQTMT35dvH6cFdM5G5uZatlhdo1odQrdnAw7I
         igjyusvJVNBU6KDDc7eUemF1dfx1biOcL46wz9Tvnq6hhBUkuF4qC9kXFmFEBrMF9c2u
         2MpfBhjwQizaMzA7Cj0NaIgkDI//VtZnTPVbWsiT6aov3ezlwTrRKp5NjziO9O2jXEuQ
         8w4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0jMEUxysPUSuiG/RhRcfm7Ui3DVkgRRpsj5pXnPw/eWmSQt7xsPPrVmPdFqhml0l2EzCjsP5M/Q5O/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAnz7F0q8iCDgnd9WzKnengrEI5hHnQEW5cmaxoibi8ThG0wQA
	1cH8bOxAnGZFb6QeSqsAAR9jPA1hdV1ZWNqm81rTgjjNX2RRwARtBulq+3Sb1M0Wuf8fA1wvvdG
	WNrsOtBAR/zig47jZD5tLILQRXjJO5BIwF9xKW0bSoKwsyr5GPtMja+WgvTauI7qf5w==
X-Gm-Gg: ASbGncuUocTynVDM9TI6/A6AWeUdOzF5KtQzr53mR9vwXNhHDQ8w75oqlt7nV2zDjpl
	qmEEn6PSyIdC33rvClFlD6Pzd9iQz6A3tOwmh5FXnAaDi3xc2J3Jh+9tpuNNC9BDG/SZSuvsLDH
	JGU7AHo8dNBJpXc6ElNNAQsVtErWCG6AA2upXMvzsvfHYQYirMZ6aBJafJ3vQyExkcxb0+iZ3TB
	70sl9tSc6OSvxsGU8hSkEPl52icD4csH1jj9Okny0pGaMCOX1NYz/o6cy2FRW+3KTkrPDJ9iCM8
	qXOmOLeGhThwI3hTumvFSOYPVE+CPqFv+WxZ/tnuMWhW7+7FLGt6R5Nlv43lwyZ15/QluQDLuTv
	Akp/mZ2e9M3YdmKmMM1dzGM1viwiZy0tGV3ljKM+MulWLVZfQf6r3RMouBviIu8OPz/Y=
X-Received: by 2002:a05:6102:5245:b0:5db:f0fb:2704 with SMTP id ada2fe7eead31-5e1939f710emr423980137.1.1763476331581;
        Tue, 18 Nov 2025 06:32:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCEAZrw1Dxy9Q4fo/SAgS5IBE3ZPVHQRDrYGS4oM7NCvaf5YYAgBS06mNNTeXTjTyLO11SXA==
X-Received: by 2002:a05:6102:5245:b0:5db:f0fb:2704 with SMTP id ada2fe7eead31-5e1939f710emr423950137.1.1763476331024;
        Tue, 18 Nov 2025 06:32:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed9d38sm1383993966b.67.2025.11.18.06.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:32:09 -0800 (PST)
Message-ID: <1ba91adc-5011-48cc-838e-7e02cf8b6d0b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:32:06 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-oneplus: Don't mark ts
 supply boot-on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
 <20251118-dts-oneplus-regulators-v1-1-79fb2f0f253b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v1-1-79fb2f0f253b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNyBTYWx0ZWRfX1lHewxYGDVdZ
 IoAIIGU9wWuGQikFddnFM3ESSALt0FUVVk1dPL49q8G4egkWRuNHzWQCG83ytinmgAvxOjsQNAk
 nj1uW4hQyKeWuwZrSxy2FZpRQ37pEa7vsACgd0aMHDfNssy8WJpvB+Fg3/R4sZjnJ2ANheWOWJO
 aMTIa7vKbV7E06lXAqVxIn8QmiQ5i7kxJhQRPhYwU4qLjEmNxg0mCKJMsMocetyE5z+Yb4JwEqC
 z58K4/Mdy96Tc4VCuZ1iRARP38GyJ9sUJHoGEXAAcm7lfxuyxdQ1K0vWDiQFOeYxxpoNHqcEF1y
 clsYqANJ49UCapAkqfoYDWSandLClsoe2GYGZS0ctPFjuL0+OesW+X1uqPlHI/iuIc/TwZtzuw7
 aQAXo2ibFeAve5v14DNbWjtmqFrm+g==
X-Proofpoint-GUID: lpZBqxz35PfxM_tmu38GBp2jIUQJOeKN
X-Proofpoint-ORIG-GUID: lpZBqxz35PfxM_tmu38GBp2jIUQJOeKN
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c836c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=_po-8MkxtPHzYxMzuoMA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180117

On 11/18/25 3:11 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The touchscreen 1.8v supply doesn't need to be enabled at boot, only
> when the driver probes. Remove the regulator-boot-on property.

This is not exactly what this property signifies (although it does
indeed turn the regulator on if it's not)

regulator-boot-on:
  description: bootloader/firmware enabled regulator.
    It's expected that this regulator was left on by the bootloader.
    If the bootloader didn't leave it on then OS should turn it on
    at boot but shouldn't prevent it from being turned off later.
    This property is intended to only be used for regulators where
    software cannot read the state of the regulator.

Konrad
