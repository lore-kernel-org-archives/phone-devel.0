Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DDA262801
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624196; cv=none; b=RrdUfyARCKQE/WR4VeB/Xnn4j83SXmPdNiz2ORgybSfeq7K/3vDEbR3Pjfug7D4RYnLujJfESXDD1UF/ZPZUygwzng7z6AMwCVGcUPIrZH21VeSClqFV//Z42xeiagDufB80zHQc9get1EZpEuSlSJ5yd+oKEcJG6Zv8JlUUNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624196; c=relaxed/simple;
	bh=UpCWjbJlvqX+lZRx1GWi09bIQhROQ34WhK48kOtNG4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmoUtDimVqzMIQ3y79afba3n3XLRt0kzsuVL89Cu1Yd1hK2rR9wJSvGhuWeL81biwlCbZjYIj4MbNaFvw8BsVAy9AjleU+NzvM8y1ONsJQH/bZSWjyh4SQqJ4H0O3DImYRIPYTxmM31l2Ub+8iKYDgCW/tKlpt37bmkgTF5T09E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1evmA5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1evmA5s"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qNR011402
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otwibO+B1RJWMfT84nQrsXKdELhQ7z3K4EdM/HQ4kbU=; b=h1evmA5sLBCjOty0
	enCqC7PLiGv+sARxC9HV4xxZs5BSkX4K+HSbG5FmS+BtUv67m58dEvzC7Nfplz4r
	P4Dw11xn7RQyIbleTY+Ywlpyul5RjNwiLRIZSb+lctLPN8xEqETpxNFnOU5VDELN
	jXDEy1JyCkN+tJBZ5sMj+Z5ue4O6E7lXBfiuwACT0KZiCyW/DWEbiE7t841RSiUk
	K+Y0vT4S6XkjOr3na2CM7nj4J6EhxuIUYqSzTtjyVKHwQOoTBe4Nz9wyCzFMC4sx
	yRhkfveEd1oGUMSD7qzLOIF3b4ysZa4zuYq+4oqHCHz/dBtLIRcDxrnKxnkt1Ba1
	hRXK8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wc211-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 09:49:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so103225685a.1
        for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 02:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744624192; x=1745228992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otwibO+B1RJWMfT84nQrsXKdELhQ7z3K4EdM/HQ4kbU=;
        b=ptgYQ5busVOe+nlDkmgOQ4Cqefxxuw/AdYEGn90C7nN/Ex/N1vn1g9OhNlEDQgbhB+
         g9+c0TMoAuQyO8MTjqGtidZwX9fN79k9AAfVVNI+pl6yWQ66J642tVmDW2vMwIWMvWaR
         2AQRing0j3TXHh2U3h/ak1v4O89mkASe1s+5Nfn5GC8zS8BqEHd6YdtSZHv0e5rUXjM5
         xbEnMk1iiXFuj0PpOYR/i8vEUzxRX2OgtGs9vjmalve1rZ86cjadx1dsRnYIs4bembLA
         j6bj2iQHZztsNwybKVlFVHNznCIvLzA1Vz7CYtKrumdjgOvHd/5yFZGZInbhzO9Oqo29
         10ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXymOVxvK8lK9lkGTgDxyql3hI0v+219u193vcMZ6HRy+KMhHFfV1MA6+pIB561iBsgH3UzGvW3y2hXkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6CFybd0GQYSPdw12rNzVRjKNaRR2Y25i+YTmdwB3qpYhh3BLl
	fYciQCCCVJin0OSbxpKPAXc/q0ENSv5nre+kLdcwC1n4xnYinpkX9YxvFQdPbkbPgEXPqucjRri
	vjESdqVO96tv8paLDwPBbLx9KvJXVByr/uHotaC/SOLcT0vwavbcfJWhUyvzebQ==
X-Gm-Gg: ASbGncs0rj81cpGXGcFcHi+yC4DKWGnDHwE9AoZclPB71ksRVFzHOKCPb0Xfyf8FD84
	WxAuogR36dKXPZUubW2gXPlrLfGsixZTs9kNPZEoltduP/IMYt3EHvP1KSkaAXZCRaSNTUNXT1l
	1/kSJhOE3YPUdkvF+yeBpvn9Rhf/D/jLUjI6xS2T00JOzull8XfAiTuZRxsQA8pHtz+MByLMuo2
	SHxdpPwmeWnjKI8MtJPy0WX0qCT6vCWhmlGXwlXLB7GjI2STvSOp3DS4x10fmPrtkKRFaPyqnHJ
	YOhuQy6t+H8WOXESwGHyoeMs6iXlfCwUsy7Ee0Xpx4hVyZTS8TJzVmMTysA6HsWTZg==
X-Received: by 2002:a05:620a:2489:b0:7c3:c814:591d with SMTP id af79cd13be357-7c7af0f0403mr648275985a.1.1744624192546;
        Mon, 14 Apr 2025 02:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF00odbGqpr+NrwU6tII/IQJplxH+w+y1CYdgLC0L7P41kv1mE5rKymC9sH3HYVqso2Q/R8NQ==
X-Received: by 2002:a05:620a:2489:b0:7c3:c814:591d with SMTP id af79cd13be357-7c7af0f0403mr648275285a.1.1744624192033;
        Mon, 14 Apr 2025 02:49:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bea593sm892427066b.62.2025.04.14.02.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:49:51 -0700 (PDT)
Message-ID: <69fbfe29-f5ff-4a24-b270-289b2f160f38@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:49:49 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8953: Add uart_5
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felix Kaechele <felix@kaechele.ca>
References: <20250406-msm8953-uart_5-v1-1-7e4841674137@lucaweiss.eu>
 <e87220f1-bf8e-4014-834f-ae99c0b032ca@oss.qualcomm.com>
 <cc84ef26-6c33-42d0-a11f-4d6b31d8beee@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc84ef26-6c33-42d0-a11f-4d6b31d8beee@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fcda41 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=TyM6OeZ_AAAA:8 a=dlmhaOwlAAAA:8 a=O41bOD_wkTG2M6k6xrUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=RxdkCTCKa-xTImXFM8fo:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: UmY2phm7GE9bNf5JbZL2FqkM_h_G1s6h
X-Proofpoint-GUID: UmY2phm7GE9bNf5JbZL2FqkM_h_G1s6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140070

On 4/12/25 10:34 AM, Luca Weiss wrote:
> On 4/10/25 6:45 PM, Konrad Dybcio wrote:
>> On 4/6/25 3:52 PM, Luca Weiss wrote:
>>> From: Felix Kaechele <felix@kaechele.ca>
>>>
>>> Add the node and pinctrl for uart_5 found on the MSM8953 SoC.
>>>
>>> Signed-off-by: Felix Kaechele <felix@kaechele.ca>
>>> [luca: Prepare patch for upstream submission]
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---

[...]

>>
>> It's more usual to send these together with a user, but I don't mind
> 
> This seems to be used with the out-of-tree dts
> apq8053-lenovo-cd-18781y.dts
> 
> I'm just sometimes trying to reduce the out-of-tree diff of the
> msm8953-mailine tree on GitHub

Sure that's fine

Konrad
