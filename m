Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3FC309F13
	for <phone-devel@vger.kernel.org>; Mon,  1 Dec 2025 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592916; cv=none; b=uKyHECQyTXG7l3n58IotIwajiDf4BRaqjWgTr7v/pux8aN84tDGWySa3sHKqrLzB3llbpYgK2DWi8mN6Qy0d4SOZta7KKZnfyzIKSJv8T4N2sxXZ9MJIuXjLboqHWhNg0K7j/7phY6WvdnfXUXZmoDMcd/L03s94+rzqhYLtfTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592916; c=relaxed/simple;
	bh=fWDw6+qdb045VDfrfsusUVHCedGA4zHWbEtbTShoaas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7mN5Jt3kwBusrGVVflmNxEXbYdnq+/u6rbnRZFREuzQ6gljQsS1YqGimX3kuORNw1c+Ot1jUvGe69zb0Ar8dBJNZQ3Vl+Pi9Zal5yDHm6M6LPgypPzKhSdWlZGrkZtDyMaJc0gWTlZFgR1bwZzsCFlmqpDT0NSTgRogN2y/0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfSegWom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgEzLYwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfSegWom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgEzLYwx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18gZN23433224
	for <phone-devel@vger.kernel.org>; Mon, 1 Dec 2025 12:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efxguySsNIbSl9hBDOqgLLXXN2ezOMoBT0kkasWh2J8=; b=XfSegWomeJRUX9WQ
	3PPNCaLGV3jSWO8NK7EO2iWSlknFhQppCPSDiRa6pCnTLSne43fCusrO4e9MqepB
	tV3JHigZkGZd5Xh7aAa9HflEpvNZSDw9RnFqvVcu//WxcfOKHsnUnRULEhvD74ow
	66HmB7spE0JdRn46sx6y6WL4mRX+mJpODykNBRALch2iQWN1lZ7+1WzyPnuKjcId
	t8si/APr84N86RmDVsQbZ9D970YeXiynm2RLowsQ9c82EM6OfuYqyGwJqqLd+Okb
	8mLxLOZdG39/UzOiRp93atJ7q1V6yT01hNhzEM4e9d0OrQxYoD8Br0l6gMkLF+JE
	0Tn4yg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re0nfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 12:41:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5e1fde1f025so413284137.3
        for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 04:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764592912; x=1765197712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efxguySsNIbSl9hBDOqgLLXXN2ezOMoBT0kkasWh2J8=;
        b=WgEzLYwxCukxibmcIAhvK7fFo/XMOuTT6l3MNBYMuH8UFCM4WyDXbJ+U33S5M+AQOo
         3hfkKevcHErN/MNVmye3rYiUY7ybJW9DdM3hCwftBgHzj52ul3NifeYh1o17sezEs+Zm
         7LWfjS4J9DyPPYPGCSqK1JiOaYK6WrUm7Pz/70TMS5Ygx9H0nwYhZIxCCEdZWBLfjfOc
         BubklvjQ/Xbs79eHLe/KRXfY2YvbHfQzpr9wx3FLbSxLREOZQ1rWyHlZSuC5gtCMxBn+
         MRrWOaxaJm7GpqfAPqaiIL7IYoeUoFu/IC6hc+Hvp/jgLFvCFmkuCYYaypn4fYM+S9AJ
         fDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592912; x=1765197712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efxguySsNIbSl9hBDOqgLLXXN2ezOMoBT0kkasWh2J8=;
        b=pamIN6cMkf32J9kXVi7/UDs7gTRtzDeVcesLG4eJzE15c7TZ4eqWyWQqKUnuvrPsYr
         xlJx8I7HsIu8WHsITUhx3ltpLOXc0AMgvYWe8b5yzbZEHY2gGgII2EtjoxAkOoFMQYym
         Rqlo9nIrtlR0e972/C2rVIpZmojPeYcRhamOPBf50LkqgTS97UgCZACJVR1bX5gElIeW
         EfSoi14Kn2NTB2uxEsNhos497Y6RqgKooHdgj8s65ztYa93D5Y/xhOq3i8i7yBAchMXH
         N5mS1M0v98NNfcH8iXTgc1o0UovjmeO3uURc3M3d+km+afifsgXMYh/68Xw5OGIZnYTQ
         0qKw==
X-Forwarded-Encrypted: i=1; AJvYcCWL22nUJ0bvTtB2I4P8X1w45YwhA+ltTlUa4BDVY0UeKCwxZydHIauWKmFU/qL2th+R201RMW9S59kCmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DnuUzFb4VwxRpyvjGHusxV6Zo2qeKm+nEe2Ellav89aEY2Ny
	ldbpo0vYEUHphroW5f2zMdZ6whcbxx9VnNvwwEXoqPYIg9O3TsbXyb/AmTfvvI0YEgD6V4jgU7o
	IJWUnR06hnJEzeiix57QghE/uJZkinmNHMUgSGdyhCCLLBkAXaUWDSvHK1Z9DLiVI1w==
X-Gm-Gg: ASbGncu24GE54QgnduTYpL1nC1qXynlLh+o7PEBQaoCdrGKA13WRmDiwvphinBPxjzR
	PcAFj90OWI2mPWvb8ioDytXoSqdEOpfx5j+HiLX+5W4ryK8M+wFRgENkSkAc+k+Ffk8/GFkVQkN
	IfGw42MCzw+WWPszXEf62GZMGS2ikl8RSZDw2QAsGaheyiGBhNlB8jcm1Oup1d1bG9pH9G9MDrZ
	o9mAyxMA+WByoVcBkttMaX8zX4VKGaz9MOBMChd0mNTU5t/m6czvowkH5prpnFlNNf8wW0ATwAd
	q/fpjPcWCBR2I4anGZQ8+BjZeo4OQNTa/fqucylOCN/K9gOF0x8gWmZeq2uDapUISqSJrA7ui/N
	9R5N9KcpMuu6mDId6VoHBYBZd/5FGSgtXuiNBr1+ItLVfEbgYOO4g82DuoBombYxoDqo=
X-Received: by 2002:a05:6102:5089:b0:5df:aa2b:180d with SMTP id ada2fe7eead31-5e1dde61b92mr8252681137.0.1764592912420;
        Mon, 01 Dec 2025 04:41:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFew/hIB70b1KHsS/i5fEdNSchR06vLXyv46KJ/nhatuVYJMecxasmxd9pXWF4Ak6k3OjUlVw==
X-Received: by 2002:a05:6102:5089:b0:5df:aa2b:180d with SMTP id ada2fe7eead31-5e1dde61b92mr8252661137.0.1764592911790;
        Mon, 01 Dec 2025 04:41:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51a9819sm1235023266b.25.2025.12.01.04.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:41:51 -0800 (PST)
Message-ID: <adcac270-3668-4b17-b430-d67ef311dd7c@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:41:49 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Bzag-YVclWfuYvR3vJE1Xq0C7sDnTe7
X-Proofpoint-ORIG-GUID: 3Bzag-YVclWfuYvR3vJE1Xq0C7sDnTe7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX4cSuZ+wla7ZD
 7jHynN3TdKZGmy43RZ4+4C5j7EtKe9GnovpkvAGG6UzzjpeFI411VQ3zkOHMLCS3ETUgLzqXwdj
 KIwJFknIZO8+apCF/tDAVoLfepogI8jRyxNIqnqAnPLiBqGKA4n/iE8H3t3uix0cFz8umlD5vU8
 vOkfZXuvMZVpB57rXNRYaGtGuZ5xceQVIjYVq4r8Uix+TLml4kwhx/DK4TmrreOmPpYJ4c/L8Ii
 Qqpeix2cj4CDWzjVivn2intgJOUWN3kXkb8xRzzNwLp/PKa7E+Q9ptYAblsdq87FWK4MG+umL/w
 TT/hLrRbnoJzf+jyvBTyTLKbfOUO9yUeE1h1H/vZVbQcjVfWp9v/j3obJAYdaa9/kILDyEaQQfj
 lnUZOataCO4E3v/uN3dzthp9JdT50A==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692d8d11 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=9kGY3m0iPZF_axRxbP0A:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103

On 11/25/25 9:12 AM, Paul Sajna wrote:
> It causes this warning
> 
> [ 0.000000] OF: reserved mem: OVERLAP DETECTED!
> framebuffer@9d400000
> (0x000000009d400000--0x000000009f800000) overlaps with
> memory@9d400000 (0x000000009d400000--0x000000009f800000)
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

It's defined for both devices that include this dtsi.. perhaps you
could remove it from there

Konrad
