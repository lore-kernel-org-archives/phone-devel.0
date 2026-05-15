Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4404779B3
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843395; cv=none; b=SBB0AuLjy3g62pY8uVspwyonvUCvhoWLULjCo9NkCKeiSy/UPLH5WtwZZ69tqchsq/lkCIXMFA53I0FdC7noH2ap2SpfMnFny3716olZr6Bfr6IrQ88HJXTbkEIongaicgkPtNLuR6CLE7CIzns8PdK1ela3+XzJHBlGxNl+XJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843395; c=relaxed/simple;
	bh=cCW9t4VDuvvJp7F1+qa5eO+mb7cpDFU6V2KGPtVU1W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnA0PB+2MvGVw+toFbBtBmNoIR7Da3+ea2tY4tbFQzgCZCkNW2kyijBWj4M8TBvt51u5KbaSzp8knV/ZTTA/yESGY3CTx/H2Nz73NkoAcKMy2XQ87aq+pvWK8CSD8Od4dImANAoOgrMjJfIw5wNowmBdhvVfbk+9AFALSqaNVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNWcPlgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGthZVLu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNWcPlgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGthZVLu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5BW5q1847945
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 11:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPS1BdPlzzseHEWwqikvhU0ttOry/wRa6oEMt+5JVig=; b=aNWcPlgo5Ducv9/N
	Sp4bUl5RdysKf4R4nTqKVYAq8fa588PxEAI/577KKSTr9h+WbAUWwmwzh5kJpaiK
	aPMaaLOvLd2ltLmfcrJwkVukn7mhdfLo2EPJMGsw8JbeFvQwZPD63Nkod0ieoVAu
	6Ajc+Knx64HaTODGqqjt6sAfGSfWezzRPWbBU0NWNoI9IytMwl1XQYduz6gFSIGw
	MpjBhEKhUxhNu5V+eD0XBUBMSW7wK8XcT9CBCJ2CHrKrBdsxn/VsSR3ZK6MwTqNn
	53gLAEmcnLJpHx1R18pNegn+g6xpeaGvJ/AsSInqJHapr1CL7rSgoBBp90FE2CLM
	wYvLqA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2xe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 11:09:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-631337cbe45so558393137.1
        for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843392; x=1779448192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPS1BdPlzzseHEWwqikvhU0ttOry/wRa6oEMt+5JVig=;
        b=CGthZVLuAsWAd7vtu1KJrTH7DeR6S3h46/lItbPAAOzuVg6TpN43I+PEppRnwlza3f
         VMfqEHS6AxX8CwXgKVK6P9xqNVUHmeU+wWZdODxix9IDlwKYlqllp1TZn+ejNrR6ttOh
         c+SN/K9xPEqLGkmLcB64wuOQjq9DzGE5YGG+zjRlX3fIAoREUn8gsX+xnLlQEYi6odZ/
         iGHYHEpTGzXRZqaFpHSUOI+VtKhnGVClKT5lEDS5V5cUw+1M0q48A856AmL3qJkKBv72
         IKnQppbhAytFV+5Nbt2XjhuAiGBGacz1gg4Bq547Eply2GP+G6tDwIMqJT+GfRxyT3Su
         Qd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843392; x=1779448192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPS1BdPlzzseHEWwqikvhU0ttOry/wRa6oEMt+5JVig=;
        b=MyUREzaDMaqGUUFfKZ6vsa1WIu2LO596OxjhLag2of1LH7ej0lQId758ltAKzxP11u
         Sn4mmIHGw2R3cpbf83ze2Jm4uEtGZpWwEwLrNfmTSLlJV0f3L8cvowyN6vxbM/mguZM3
         U4Jkd9WbC+Y6TcTSAyt18RgyZ69nVc/uGjAvHP9OMaUrtrJrglKUFWtc4ZXdOIMNUcgr
         rWv+/z2jJ+scl1LCACGfNIgxy+Eodv9xuLY/3tyzky5w0SkIpq15HBiipt/In78VSS9n
         b8wBHKDuyoTyprKp3IBRNDaCHvaDlXO9HDZk0egTyc2CXPFmJ+ttBQdPloPrCsleLZ/R
         KuDw==
X-Forwarded-Encrypted: i=1; AFNElJ8dyYglahMdT1Z5LWiTCXWM3//zH7ezh88QiaWTl6es137qwFiuJVJesKP5740f8nZZ353nBdCTEDFR7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAbET4wCi02ay+OLLMn/FFKZ/9cmLezTuDw1fetL7k+12yIRe6
	bZ+Nci/qOC4Bt9peC/BTcFLfz8CtV5tNMLDvKY1GKu92ZGgQ7thxkjat2j6i9ISO8eQA4iYGqmP
	CZUjMe4bRmbYf0nKlse7BMhF9rRhpzqm2EecHsZJYIwoGrloXXni0+lJJuQ9KiSR5nQ==
X-Gm-Gg: Acq92OGZxMEpkp4Erk+zgEMhIa89tnISAeceil18PkFN+sRE2TrJFocS6WFPxkKqFCH
	n/HUrmLWt7ULqk6kDhiRXKTIcLgb0fztxU+RE+/x7WKc1fLoIaIsdc83vPrLc/vtlFOPxO0VGx1
	gfm/lqP2ciAZP13vVOUcVZydLcH4CxKHvAhylHi0PICO5uNxw4TG9jO5jBXGyEqRkZcjNOmUrrz
	93xV7TUKd1/YcHgP5Inyppw2SYmEHyZAs5Kqr01PKAbcLI45+Q7p6dH6ExLrxjgASfeAjFbj6Xs
	K2SF1kj4ukGbiGD0Pn5Qhfoe+8F0H5TSzWzjam5KmXGxymZJGP1ShU6vQfZjPQ7T39dSDqNvBYq
	aTRWUBivc6ni8hyjTXENNykcHue4AYZhn4WF4rLKQJQZ7m9oN6kn6HostbzyeW7uP+iXGSpoHO2
	GamgCwUffP6zlzrQ==
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr615919137.2.1778843392270;
        Fri, 15 May 2026 04:09:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr615897137.2.1778843391822;
        Fri, 15 May 2026 04:09:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e5eef9sm206598566b.51.2026.05.15.04.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:09:50 -0700 (PDT)
Message-ID: <05c78fde-a15c-4a36-bffb-667554362b2d@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:09:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06ff00 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n9fTaaqHRJLAcaDq8VUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMiBTYWx0ZWRfX4Pi1nUMYDz4f
 9AvYLF9tq4I+Fza9VANRjGikPDHdzuks634i8pwU1pm2m5BHcVDDBkJEjL+EfALKYXf7KxCAKXR
 e4vI+2qvTvxzauaZv7QlzQm8PktVx3thVIsXAhm78EvvBGW4w1PeAyvzCjOdxKmxFGLGLEdyif8
 otfLHb2dDbJ9B1zqqqH91prNgARKsKlIuRVUvIM/ygqsPMY4vMtX0iTol4gyW3CCKu5qORs0jWf
 S3bSancA2FgvgxbYpiXq0ljSw/YYS73YsiGTDJiAa+14LF6wM3SXVmfwlHUvgOk0nz7YhGHueGC
 cm3lBpdlwd8Ioj2aTqxQKFdZdxDa1xH/oIedMQCdiDdi+RCzb8+y+mbGiQ7KEF74zQR61m+SH92
 dgfj3+JIODmq204jB7K00utHeiKJXtBYso5y/gzUnL87I933kGsLp9w+64/JfwU9nbbYS3fRBSa
 TDjFHByYyN6wklvWhdw==
X-Proofpoint-ORIG-GUID: Szhw_vM_p5f3zIri_ibD6N5VZigzfjD_
X-Proofpoint-GUID: Szhw_vM_p5f3zIri_ibD6N5VZigzfjD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150112

On 2/16/26 9:54 AM, Luca Weiss wrote:
> Add bindings, driver and dts to support the Camera Subsystem on the
> SM6350 SoC.
> 
> These patches were tested on a Fairphone 4 smartphone with WIP sensor
> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
> far as I can tell.
> 
> Though when stopping the camera stream, the following clock warning
> appears in dmesg. But it does not interfere with any functionality,
> starting and stopping the stream works and debugcc is showing 426.4 MHz
> while the clock is on, and 'off' while it's off.
> 
> Any suggestion how to fix this, is appreciated.

https://lore.kernel.org/linux-arm-msm/caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com/

Could you check the ordering between disabling that clock and
calling icc_set(.., 0, 0)? Or perhaps we have another missing icc
path somewhere?

Konrad
