Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D223C343A
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220619; cv=none; b=kSA8/4fvtQAUyZqbMMgABL+ZJAgvEWEyVFL+7V9lZccL+HAWfMT9UsDMlDRGcILG1HlLaiZpGd6D9bJnL2tZ+C3NXltJPVJt5VDkSoWh1sDeZGHnO5b/37P9nzQoY0ig71sn58VNP98lTtbW4z8hEZu/PGLnYQtni702dhnyC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220619; c=relaxed/simple;
	bh=PSlhvIejG9w0bLgCFqKdR2Ygu5XgZVt4JAI6/WVAFn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2rOoVdzXYCj1y5Fp1aPFwBP5DPfrlmdCOO1ahdGb/35H3yDGKuh6I5MiR1EbrGrAPqKRSwmFasNR4wTH5LKhsBuBsgJ9dWkqOMozr8y4YZTMvBCliwBARppwsxJgq0CUMA29qmrVxxAesukaIAeBQEwzYOrHM8/NcqD7rKdcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQ/L22FZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lyh5oLpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ/L22FZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lyh5oLpX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4WLRJ3893457
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 09:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTuRn4LaRnp5cT9qIKY21b1sP4oc3XDbKAcewaqF084=; b=iQ/L22FZrVBZafoJ
	yr1Ycd03pkJ/nMl1l927m0VhYJplEnzl2jl66xMQ6OV2oBO3AnDABgIyGvZ8MooS
	30gocwkPY4dSv3tqMs7DORg5f2YAwNaunZJf/w+U5FIOCJRcknuR2736dgHt2/MD
	ORffIBB3rwp1TYY+8Wf/0Qcad1qfSmCymQC5YUKPnhYofV2e54yFLaeEyJ61tc02
	HWZwVrhN9JtsLErMgSlAuAACrWKxMcW4EEAt21fY2rhYpbgycvT8WkTSzXcxdKvA
	6EvD5XgtAl08BaliEhqUdKpZEl995hHZOsOadq2bVWdaS+bW5KTlcReQvdvdsbbV
	j1KHaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyv0m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 09:16:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so940221085a.0
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773220609; x=1773825409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTuRn4LaRnp5cT9qIKY21b1sP4oc3XDbKAcewaqF084=;
        b=Lyh5oLpX6El2MjO4AfdGM9PKdiRWuye2qEfSOnOYPIyTBZ3gIn83MZYyTf1hdTj3X9
         PWWoRG5t5j/p0GASioAF8EpaOy5H64LYm8MXAIJwlrL8xx3Ie8pdhnEXliGJqCgd2NZp
         ArDjcoe4OHyUAIckoW6+WAvqg/mDURTGop02R9GG7TMJPRsF5JDrlouD3d1ZxUYFG1fd
         T9qmDbOxDaN3gVkgphSv/wvIrCxzIUEb2L6K60UsWXZAFqeuZLWQnx0PDo9y08Eku9ml
         PI2h+lJmecjjRaDtPIhu9/PFEwpKTKAflkyQqMo2RgvaonnjDxdT6KsWufx8306YQ7VS
         YwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220609; x=1773825409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTuRn4LaRnp5cT9qIKY21b1sP4oc3XDbKAcewaqF084=;
        b=Gt2zdd00Z77h+RlQLmmTifSnfCpFEYCWwjBF4oEYVGAkiHCahtad6Z3jIe7qqeMatA
         0XaxyN4yeGyjHFKabzDIQpt/+VtMnUUBcXQWndSCJrFPYKakGhUmi6B5GHzXJlzUx7Bg
         d2fIYRArfSfja0S6G+p+fsT6MKTmOasUrODy6476vqWH7yMbbFKgqm0eiZs0wX8lhsMn
         PgG1pVJMtMRlkOIkS/nBSxxRcMNP5CAXb9Plnp9lk8/VSoSyo2dZ+SpFSd212WRh/xSv
         uIYuD1sfQsOkBE+b0ImsWPNeFSWThhsyETWDoFxzF7fkO2f79jP0RAFvFgCscYKLtJSu
         KvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7++6YZFAcVicmfGFeFFGAQPDyw79XKHs4vfKIBtKHNdUmnsl/ve0twATkEkp2+Ig+9EDvJA/H3pW/zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYP+wdyKEtwB7XDxCxGqJ7VcgBhf6AKpUEKp7t7B/GkqBgDNN
	hmqOoopA9Y4eZrayZeYJa9FYaX259WkfV/CV9jErIDcZiHiMwJpI6xc3d9SPRTbhUcfo6dyfGnI
	NP5uU69YKhlASnq98zjU3B4GTecrRTp4UsVTiJ9KbI2xyhJ/DoJTXoOwlVE2EblMzbg==
X-Gm-Gg: ATEYQzxWnPWFj0Co6rtE21y1PW9IcnTIVpfOVN+3C1gBLYT0b+WplXpbmCZQhA8L8jh
	/joME1QZNHiRItQnWzl9VmbCcIycBCevSuyXlkl4FLtFi6cA208enXCA4roKb6sNd+EyggVvmhO
	k9hc1mbXIZWuEoDzfzKd8ZEx7dHc/1nVIdAIuK4J4/bM2RevtVyaj4IJvTf7JHO02MIRdPdQkYf
	O0Z2t3mmJ3hSe77/9xuYSVkOxJ9LwdzSNcUCZV+0dF7GSVRwrz23ly8qz03Hhbi/7nAsLx3ne0B
	4S2qmaKksV5wK1WkLOvfv+oMzz/YPDSOcqx+qP8vdY5nFk1tXRcoTJiZz32cMCy3Dxr5OirLlae
	V+yK7mYwgUpu5EsJHKUIOpZI2AcQuKQwrMiXroFDJmPMD/sjHEndszbhjJmGgLQ43JE719jiH1B
	9Z15w=
X-Received: by 2002:a05:620a:1a84:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cda1978963mr153148185a.1.1773220609342;
        Wed, 11 Mar 2026 02:16:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a84:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cda1978963mr153146185a.1.1773220608849;
        Wed, 11 Mar 2026 02:16:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14c2basm39789966b.35.2026.03.11.02.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 02:16:47 -0700 (PDT)
Message-ID: <9b6520b3-aa43-4657-aba0-bba89af8a47d@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:16:45 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add Redmi 4A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-6-3bfc23996857@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-riva-common-v2-6-3bfc23996857@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b13302 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OuZLqq7tAAAA:8 a=E33YjpFAXuMWNsGDmJkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 7B4BDdaA3vJpgTeYq6AIo_xuYBP-q3kn
X-Proofpoint-ORIG-GUID: 7B4BDdaA3vJpgTeYq6AIo_xuYBP-q3kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NyBTYWx0ZWRfX6e88q4SxGaYV
 rjhuF1flWID13V5cz7KyHPJg9TCo641MPwYp6AZ1BoD060/Z6f+LyCU7CBV2pLU9OlDHOlnR9nB
 4QCq01ZwyNbUhUtitkpVzom9MZckXz6pYMU8FGZsR02fesTmNbinLCYkAOXDgw4OGBdRHyIcp9A
 R4Nt7rREu7PHNB03wLFd/bJAL0/+AV/npO5smJk2p7BG3Z+u4wcSRmt+RMXBxs2986EJ+9XWy4n
 Qjctv+Q7ZAx4pMQjdpOKCaMhwTh4cXCkdJ7zc2jirEfXsI64Ss14oIXbdhtOwxwJij4nwFOyaTM
 bUoaRTGVtTalC6B2ZOGYYXaDuVwX7eP2GWq+DY2TUUgIz0faoLGIDaEawCPhVTKwZQ5hxfUwP9e
 iT6hYlX3u0iPP5XCXQJD0KxyN1rGGFEVAA1+hCieDnMMQnlHyqXNbOst2h//LNvCOlzv4nem8C1
 z1ioNsJZYuaCmTJMYKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110077

On 3/10/26 6:21 PM, Barnabás Czémán wrote:
> Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
> fuel gauge, different speaker codec configuration and display.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

I see the Go has some differences in regulator configuration.

Does the 4A's one match the existing 5A?

Konrad
