Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE82D8DB9
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764967436; cv=none; b=DpWqyHvT/st8Fls7ce7nW1pybTJNSAiLG1aIa0qadfEIhvTKWas1lgPb7AZXduRuQo+et9ddxTUcMn+3d/GZbmnrmkd6uTC+cd5wWMMLx23qg1AtRPa4xOmhpf4oWaHJqseLLMeNTwagGGAXFs7QQ+434q3a2+fSk511vL+hDuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764967436; c=relaxed/simple;
	bh=VoOi2K/cbszaXepLwMnREeww0innWvq5K1RAyARBa6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHd9YlR0Ys66LDQ9YwSpVBmjrA1qkJO861G8SDzylFqDCv1ufmyI2YYzjEIXudjl5hES0kKmaAxzj+6I48Wu3y3eVvYvy0/mXD2LJQZml6Nd+iZMr7P0LI/RWxDvIR8LeNJXtoIFaXaVQDHW/6YrBcyOAFYJGxJjM3n8mdeDDpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdUEQcMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWZPvqTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdUEQcMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWZPvqTQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBNdT887479
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 20:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RpuXHuMZZPOjbjLtNGN2MsTj
	gbgJfqNWp+KGHQhwVvI=; b=BdUEQcMuQUymcYihVrq6KkL2pzmmgBpGRZ4DnZ6k
	sG0Znndy0ZxXPy49foj8D1QBr4YW3ve7btKGjoiCsaTNUIkXQtSOAS5nl7GaAeTF
	c3QjDqZu0pLwTxmms0X7OPlB97pLcsprhE7xizLk7UAlQkRVEqGRhSeNJDfSqj8j
	ETfltmmc+ahM4sk2uAGPBzJoT9OByTsmCLd/CvT/EiWt3KY2E2I83F2yS4Z2xtT1
	lPlf3MoXmLaGw81KIcrDrSCYlOpLR4vUUFkuS7AgH+VJgbWsr8TugKfTkAIQfIko
	kciH+Jl4TH5NPJP8A+sK2qOzHYiZgExv8axpCCivy8mSPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvjhgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 20:43:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2dbd36752so507488585a.0
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 12:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764967433; x=1765572233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpuXHuMZZPOjbjLtNGN2MsTjgbgJfqNWp+KGHQhwVvI=;
        b=KWZPvqTQeFS2BXp378h40YkEtXUp74yoojTrqygvMm2kCFAzVA0jCaASyqyUChAzuj
         13TNpEZMY376pJfR3bXIoA5zq+pbXyVFoVzfuwul4Y9LdOGH+puVAH1/cXWV8OCgJ6sD
         HuR0Q+UMOdkLqvHtLpioHH1gJgRqNU8iHvmRqBF3c4H/PeQ7TXChg6ajk1aqyrbGQDPm
         QZkDoxMJ0xVVnTKNC88oi6pRNlzXIjE2N6ytWmr2wsadcE86qCShNgkounz6DiOw50R8
         pREEaAkHxdwBdOgvid88SuO2U5/4VnGfOVOothkGfGEGS7B5zmVGyWzGbYDo0tPLUYNX
         80Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764967433; x=1765572233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpuXHuMZZPOjbjLtNGN2MsTjgbgJfqNWp+KGHQhwVvI=;
        b=xUa9PoC3mvXqiLpiu6qwDbjGYhJIKpJiBU3CjY1e0/JU4lkmK6WddL8OYS+YRqphis
         XMdSK9L/E+905rhVk1R8l4g0FibJahUe+aiDXNuWitBL3MxXQsGTifJ3+I/XFvBmWxYN
         L1gz8nSOW+sZoZtYlQBIFRSTxZTpu8/AxRz/14S0oeWrNYfe+18txrrdlbk4wyaVxVJO
         V1uaVKBrx2T7Rn/jBHl4+/BqzQXAcMOVQyd2GSt5pg+EboPEjlb0R+BPEBR4rBtvjXv4
         IkdmVKuWPIrxd2noTgdQvBPhNeWKVXjUBj7ws0dRVyJbtCj4IVKb1GgRfIi8MKkhVAAO
         GB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWhdBrpqyvrPp/WM2000XNATBQ/kuVVahommPpFeRvzEWfXyC2riAc3U6zdNhH0byWi3AeCzgfLYYZ+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCzQGe86mbkbM3WxoUHgfmdKrzj8F5/rBe9iF64kjAJ2h+2Cz
	dglrBcQ0pxGFlM4aYHhpY6i/aK/A6eT04LDdMF43OecASLdyG+xP+0tyD8aH363rMjeT9gDLGMz
	OYP5oFVt4ewtC7hbnLHHvLWxfZZYO0nXMMNdCx3NwAIJs8mdbx7YjHFV1vYDKfsrq6Q==
X-Gm-Gg: ASbGncswANXRbnntKVMHYATbKxeMVqc7M6PTokhuwBv/FKZAK5+qZc3UcBBvxJCUQQ6
	T2EzOXIrZaCzcdwfDEgEpNLWWDc5KRLzhGZxQ+E9YIuXq2FVz6UcYf25Exxqb/3+xpbRenIkjax
	X+XCjWGJQlFFVd5JMSJw10hVdtwuzjkeOT81QbzlxUFqJTLb5fWVA5VzlQ/aeHs43BYTSlP5AZU
	/6A8YDACcrasBbTtI/HdC8jb8mEMKzuCIg69NP3FCCd86A8kyQ4+GBoqNb4UeCebrNjztFS3oWD
	AlNPPPtNXgM5dYWTEzl6a9+Z62lHpH8iGjCYLhVl2Kl92keAxhfujunziNyrpZx2T4KDhIZJFGe
	mJUTPH08CfBYoMLGEY83WBfD2USoPdvTCzJ8piMZWq9ifJq4Pz8PGeDvlaWJBUVo9JU0kxFkKyz
	8VRTo7uu9LphUv0WcBNskzigk=
X-Received: by 2002:a05:620a:d82:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8b6a256c707mr57340085a.43.1764967432696;
        Fri, 05 Dec 2025 12:43:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdTGluYNok96o5CsAwUvPHomwuPCq9QOVmGcR/+77WdmlXegYB8Y0vUBjdTRA7zwLVUec88w==
X-Received: by 2002:a05:620a:d82:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8b6a256c707mr57337385a.43.1764967432317;
        Fri, 05 Dec 2025 12:43:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fe6be0dsm16521461fa.10.2025.12.05.12.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:43:51 -0800 (PST)
Date: Fri, 5 Dec 2025 22:43:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: longnoserob@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Message-ID: <2xwvgzrt2wvftesjo2j7xy7btdtukkx5ypffo3m37bstsrnelz@5zhlz2nheczc>
References: <20251205-slpi-v3-0-a1320a074345@gmail.com>
 <20251205-slpi-v3-1-a1320a074345@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-slpi-v3-1-a1320a074345@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NCBTYWx0ZWRfX/N5YCCsPH3Mg
 QzJMPA9wpoFru3reHGSqDjHRoFGtDAxOLd1YvyY0vF/nI9RM89UE+xMVUMaeBDDDS8S0jlyQ1l6
 9VSm4xAGoSFJ6C4Y+gKN+eDc7PzY6cCfrpkv13wFJzOXXB30uUa7ZIFO1zb/uwip+MnWq9kxgba
 xT5e9J3nFc3/KFXq2KxeM3h5cHas3LCUiyFQ2XO95X9V4SMdyb1yRCIBVFGIcNc7PhcsZokGvyB
 nnhjwVY7kOGOzNd5kEGi75O0R3nmuODyMx0eNp+xVT3WLcMC8mT4FwGab7kGi6oAhT32dV9zSLC
 bJh9EAAhPVAzAy1KLvJZhm1YNx6iLo7/1uIwt6UwB5WlsHQr5tOZdoT1Smxdgv6+BTRpnM+oFuL
 z2usmtlZHuiQM2EN/KRFAA/4RdQSJg==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=69334409 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2lFIOzg0C1QhAyL8J1gA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RH1FZyHOY54CpYxfZJacW3SCtmBuAPTG
X-Proofpoint-ORIG-GUID: RH1FZyHOY54CpYxfZJacW3SCtmBuAPTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050154

On Fri, Dec 05, 2025 at 10:58:59PM +0900, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> 
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
