Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0585E19AD8B
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062933; cv=none; b=WELfcrTthEjNiNfPZbj2rkp1llQQRI1YZqEdjPrBpxXTvLa2YH2GfojXcrGRFUUqFO/Ni3cFLYRnTvn9wILmjZIczSCWv4NGxbpBylLQ5TePv+fEPLEbJ8MsxTp58ZgDz07gDJIoS+4oEUlbNjwnDYjks+WHz1WqiQQyv9/Ov1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062933; c=relaxed/simple;
	bh=W9Vj3214OfWKeBNIOxIRzLB3nNuRUHQVxWT5wtV5e5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEhPXveab0OouiHFFI1FqDeC2WS7loX4TVv1KbSsnIA6B8AiHUol6sTNetAaHeCmYbEa0XPVx8rGQFF1q6+/4ctjOyVmZeqKEBRgCTKOM93TaxN6sdU1pEDiaMEld1ReRhT3ldH4tlOtAqkxibO2MM0bTjl4nT0KdcehS6WOzFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mg9MM5vW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mg9MM5vW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S63Z2p011372
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7iAFQYR5J9Ub0EKwN1DKAhKa2e9sLDrDHRzGv4Gq64=; b=mg9MM5vWWJ4NhmFE
	4ozJwZej27GIn5E7x3HtBgdH5bIB2UQc208ERU5VWr9ztcIe4Nt+5s69DkkxeEix
	vB085Ci4Q/9czqp/yfIDp9Yvo/I+BGfSYtuk+M8CSxwLRTC+u44qgAY/MoxWk/Ql
	QjYqh/CoLNiJ+plJJXTbLXzB9EW2y+pR8Ih7YyFYc1OaWs4PQxxn2xZlBYC5Y1MT
	XQLRWU9odNX34OT4max7NSyg391mlFuRL50ikOHLF8y8WRduiuYsjmeAhdG4Ll/7
	XzrbTwLcCbib6226OesOhKBIQ4TZqMJHREOuCI6AtHewJ5ldiIchnsiYKwrd3XBn
	IEqtdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44esmw8ptn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:15:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6e43ed084so113103185a.0
        for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 03:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062929; x=1738667729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7iAFQYR5J9Ub0EKwN1DKAhKa2e9sLDrDHRzGv4Gq64=;
        b=G3z7ACbts2mD/mELix2bpplPzMmkgOHBolgtQyUw5D5XFm1Z/b50SbZlOVv3Bc0sXU
         PU2WBJv/RdRX4UAIfjKJdXZbx1QKcAxnhvdbjfywJnEXpax7NpT2+EVHo+Cw47YZ5sIc
         Qn0UbTfQrdBeEbLyutL/H6ai+Y6h3mFEzOYNACMbH2aTaLZ9Oz3tEcEnUV4Wzzhd24my
         hCOVI9heQpwkX9SLUOXkudFIBZPg5xX0C/MDAf6doxs6EsGxd206F79hXDRXretfvIuP
         /Sx/ObX4rjI8TkIGqcebI/qsqTdtRnjwMiT2bJsgcopjguOWNy1yhxjlQYE795xE3X79
         drNg==
X-Forwarded-Encrypted: i=1; AJvYcCV1fjMfXDHGF4yh/jBaVOsJPUJn5KLKhehg/i6kitLXMDh3X+BZg+IDTG2CUWJTsmj/hjV+/K/QqzvJ2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnfiNzi1eukpow+0eJ+5eFXkRIxB+JT6vowHX3wpII1daBMj8E
	Fr4MT6kB9AzALVtA1qtOGp9SJaEgyHuNoDq09zEcvItwzKjXAYRduKz+lzJn9YGkHLH34oSLxE7
	6O7Ys9eDgG6KHzdJvVymGeC3A+lr3b7TN4aL58UqUH+Pgw/tK812c/IjEAqRH3g==
X-Gm-Gg: ASbGnctiVOb2MIwmfEpb9sA/A1/W+sRTdKsnyWpLvo0l8FcJQho9BJR6RvPqMyV6ypF
	sl97cfvW1O6fzG/p7VthDtbV0GzDeGywhfSDgfb4yLVYjCnKi0zBubkKw83J9k0GmEE+IUlKCWR
	WtSSGKxw7gFjbxz20NFTryYdrhMSBvZWYekv9T94Ku9kYrlmj33Jt/PDHGiq1E+KHtZB7bZLNIt
	Vb6tg1aDLL/qTznka/K0jnnpnMJ+ZdhDZnEFbyIaDKHroU0AZfgYZ7uMWQsu6yCBLtsQ691d9V0
	WkwHpi+O26S97RMynWiaeNFNDnUmq7WKMauMvRD35ZDclBaBXKs16l0v+Jc=
X-Received: by 2002:a05:620a:4107:b0:7b6:ce0a:d28c with SMTP id af79cd13be357-7be631d3350mr2775034085a.1.1738062929045;
        Tue, 28 Jan 2025 03:15:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF769pbpMqnwsFYBpRgkmp7KBoQccCxddtTdg4vl+b6WlMlpFmkwRwS0yZppI5CS682q7gHSQ==
X-Received: by 2002:a05:620a:4107:b0:7b6:ce0a:d28c with SMTP id af79cd13be357-7be631d3350mr2775032185a.1.1738062928739;
        Tue, 28 Jan 2025 03:15:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab696a26807sm487852966b.130.2025.01.28.03.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:15:28 -0800 (PST)
Message-ID: <259e87fe-0a1d-48a9-b5a7-c9f7c8530b84@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:15:25 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-4-67e968787eef@lucaweiss.eu>
 <5b0f9cd4-df65-4963-8d6d-5bdf759ba0c5@oss.qualcomm.com>
 <Z5i3vMYnxBNb31yr@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z5i3vMYnxBNb31yr@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ttojtF1B4c-VkacfoQfgfeAbVDtemBl0
X-Proofpoint-GUID: ttojtF1B4c-VkacfoQfgfeAbVDtemBl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=995 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280086

On 28.01.2025 11:55 AM, Stephan Gerhold wrote:
> On Tue, Jan 28, 2025 at 11:45:51AM +0100, Konrad Dybcio wrote:
>> On 27.01.2025 11:45 PM, Luca Weiss wrote:
>>> For example MSM8974 has mx voltage rail exposed as regulator and only cx
>>> voltage rail is exposed as power domain. This power domain (cx) is
>>> attached internally in power domain and cannot be attached in this driver.
>>>
>>> Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
>>> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>>> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>>  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
>>>  1 file changed, 17 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>> index e78bd986dc3f256effce4470222c0a5faeea86ec..0e1b0934ceedd13d5790b798afc95d68a8314c75 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>> @@ -1831,6 +1831,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>>>  	while (pd_names[num_pds])
>>>  		num_pds++;
>>>  
>>> +	/* Handle single power domain */
>>> +	if (num_pds == 1 && dev->pm_domain) {
>>> +		devs[0] = dev;
>>> +		pm_runtime_enable(dev);
>>
>> This call can fail
>>
> 
> It returns void though? :D
> 
> void pm_runtime_enable(struct device *dev);

*wipes glasses very hard*

oh..

Konrad
