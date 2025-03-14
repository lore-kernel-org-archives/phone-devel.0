Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0801C54AA
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741990097; cv=none; b=EdHB0NlSqj+syKA7dvHo3HflpEdE4XQqCai+RAohzKmqB9EfZMzyakLoA6g/0Np0O+9i6RB0heUI3FHtyWRnbRWwyw/Acsbc7vbV0F0wQbnNnsBnwocCSqfSqu0GxRV9Tn+AyHUvS6zNoHhHnWDu6FQEr1Pe290yMxg6Na4VvfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741990097; c=relaxed/simple;
	bh=jp7zp0XEMKSmfDPDgt4XGymSrntAbWSW/TwBN8UaChw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=St4LlZ9me7TpHvq+e9bDq3hEulXzt3MGrYsK9wEActHQzeXW33tD18CNYyrfHJJlZQcY5hoaAuyEllPQl3kKHFi34UJzgnvxVt8exgH94CwpkkujxEPP5icdhYnMqEJc0OWuh4IciXju1aBxsmaVsKGla98Uk8N5wtdgQ1vjZT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGu6UviF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGu6UviF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EI7rSL019821
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 22:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hm51JlcwZKu0qNKQYJdKG1AEr0/67IevirTkdaw7cAU=; b=EGu6UviFJfIQgfJg
	lhKscTd6XjQi950aUlfQNc+1EythD3ogVJCa6kwltVNJYdaFe8pX0QiFZdSdwl01
	shdvejqodacAqNl3AmaASa6dUyeavWMg1J+r6CvNpz2ZdKxnlWSMRuQKjNryszPz
	j7BhFyuqDLFv5R7cGKgTY8NbX2frpdxz8AQfPs4FQK+y2c+V5fdhw+ih4yIjKd6R
	HH6423PnXjHolA/ogBvV9AikPGwfld1c/4Mjwz4yvf7CCyibo8AUkNtiIuuhnjKp
	nRAqH9IPFMuul/idAGLE1ovAcjFw0DF40IXg613nGTtJKeA+MF+6TWcRy+8w978F
	LlPmxg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bts0nsbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 22:08:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso7399596d6.3
        for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 15:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741990094; x=1742594894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hm51JlcwZKu0qNKQYJdKG1AEr0/67IevirTkdaw7cAU=;
        b=KMOgAztOzPNIIm+RYp4xEHdn3mqM6yl2XYie8X6KWXlSUfye7OFOTuOT6lSoL2IkJv
         WCoWlZLguCEQSRVVCgXyyBUT1rYDmJKAwl8r0ATQlrPQLris81DiVyWJg89ltN8DqouA
         JClripw2/bu8hGucCAwGt222tefp0sJV5YHwIVRKUeUKePJWxfWuEF30NR8g+RwowDdE
         fU5lZH61VsCfq7r8Qeva/uqHUezM9WdWOsyoJDmH4KNH403g73Q2KrmSVP4lTS9Jm8y+
         7X/GQ1jZdm2WqrxJSOrOrTBO9+exJ3XHS+dNHD95jufdk2GuypvEGk1zsLlU46rz9Be2
         cFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDoDSSclRADjf9SSWrprnqSnnJbz5OB7X1Qb5klQHgY+WlksqW09xfUfymFtLe4kQo8AHRjXl7soFVLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ZsydgF0cr8OzykPBrTVE9OWuK7owg35MP6vZi7L8hRWDoEzV
	pmPtnxFnDhMwjecFHYQjNVvHZgPiT9J/smZ+wSIdi6uQZvfZybinWdQqQxrbsXc5OLO2Pxn9slB
	Ul5SekNc9C1eEXLZdJt0JsBGFNnaXkqBs4Qg1CQiPXKTSmJNleCPw5YQRkjfl9A==
X-Gm-Gg: ASbGncu7RgNd5Doy3Ceja6/wa6l5pR91V5zruP6R6qBMBCSMbEZEwjw9yYt74TZkDz/
	1FqpzAaSgM9wVqYEOmfOi1U6P/Mvil0eYnZPL/EFZ3vDHdKtBUxUZIBMdqEmJcToqHH0I32l5rS
	A3W/jL/KtFapLfdi9jgUlEtmExrP98a2vKH6A8cS5CsXuG63ArJ6vvXxmw0jKc02cbUZ2eUEykP
	wLIblJQaz12qgK9XsJi7zVxkaYn5bPk+CUExThdPRVZxqMuBbpps5chwfw015Wk+YqBjLeeTL9u
	uze+gheSDEELgg5Pl2nYWt5SPrKEwqfVKFSgIuRmUQHjJc0RoHitJymSu7gdl6TiMXYnYA==
X-Received: by 2002:a05:622a:1a14:b0:471:f08e:d65d with SMTP id d75a77b69052e-476c8128d1dmr20172151cf.6.1741990093983;
        Fri, 14 Mar 2025 15:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhj62oZ6yLYlsV/TtSfLeq7Hm5YxgXz6uSx4Btn4goF1iNBBLb+Nc1jWYJOyJzLlYR6jOkAA==
X-Received: by 2002:a05:622a:1a14:b0:471:f08e:d65d with SMTP id d75a77b69052e-476c8128d1dmr20172041cf.6.1741990093690;
        Fri, 14 Mar 2025 15:08:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e5ebsm2396301a12.2.2025.03.14.15.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 15:08:13 -0700 (PDT)
Message-ID: <cddcd851-5e8c-4202-baad-e56a09d5775a@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 23:08:10 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZYsNG1TCHGQA8pgjAV23x3evVeSFoVMG
X-Authority-Analysis: v=2.4 cv=DNSP4zNb c=1 sm=1 tr=0 ts=67d4a8ce cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=m3AVSQT7pDQk2eD9g64A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ZYsNG1TCHGQA8pgjAV23x3evVeSFoVMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140171

On 3/14/25 10:17 AM, Luca Weiss wrote:
> UFS host controller, when scaling gears, should choose appropriate
> performance state of RPMh power domain controller along with clock
> frequency. So let's add the OPP table support to specify both clock
> frequency and RPMh performance states replacing the old "freq-table-hz"
> property.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +
> +			ufs_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-50000000 {
> +					opp-hz = /bits/ 64 <50000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <37500000>,

This rate on this clk requires opp_svs (not low_svs)

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
