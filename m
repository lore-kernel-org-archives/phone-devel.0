Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6FB1F9EC0
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904814; cv=none; b=YV8L7zRl9NxrZ6Aj/b4J1RxT0FdmedGF6mNsBJJinQjt+PscPnwOL4yNhkIC3DWydgySb+5ZKeOT+OOfgK4A+HcnBBHCvE2EBf1llnTkq/KzPae5NMflG9/qdx6p8YnxVIgYAban+VRkMLlsw/pp1lSPzG8MpMWikrKlJJAByi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904814; c=relaxed/simple;
	bh=qsxVMo5JWpz5OGrYTHQct2hIenf6onh7s3UZU9UwjmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAoDrNuFMwz6tRKDY1p+9wnUYGuqccZLXRWw3it1A/8cG3eB8OEtPtgzqe1t1PsqPNQDSRDwqwlbXgmSkh76SYHvVE/WNe1d84Qw7c3goWGBPtQ/4nfnGCb/q0SfyjeSGpwg4oiiH3ev09mDI7PCGPIcOShQwqoSfUs2puWyvVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3pswhuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3pswhuf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5033pdY4012299
	for <phone-devel@vger.kernel.org>; Fri, 3 Jan 2025 11:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAEhP8UE05fQxF97K1IDja7FJ7MMGL08102ZSAbOrK0=; b=d3pswhufyWF1Vye2
	RWwkZ6nRF5wy+RQJPXzbHzzyFSNiiswil78wp04O3Zq03UpvBW+KxfjuyVRkQV+T
	U+gwqZQA8vtUnSP/kr/KiGCciPF1ePN741ls767Je6FstVzdOPv6TvYxf05o3BbB
	vQEr93V6z78SyW6GfnTtpfGq+ucyGpdNDz++vHwmQT7pxkPTYx4yXmkw2ScM6Jzg
	owIUS0i834ujScZEw4ZMuXSnQo3aHjVUvdwka4P8+yBhrsZrInPWrflBiFkEeByx
	SNlRRKt+tlPPAZcPSkHsRPHtU6b+0zsInn3uhVmEQPpi3Vsn9OESnvIxyrXCkS7l
	lX7ZrQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43x8c0gygd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 11:46:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8e7016630so33933876d6.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 03:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735904810; x=1736509610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAEhP8UE05fQxF97K1IDja7FJ7MMGL08102ZSAbOrK0=;
        b=HXCYwyahJYiEgpyrB/Jai2DN3sRfMs972NAVUME4xsx+/MQiCothSf2ESIqtjdaPDL
         SisiCUFsCObus6k761ly2tPsgu40QyoulR58Jdaib531QPNafGw6QfFEKY3VFM0R1IEn
         ylHoqmCtLILgJ8IujxLM+O57yac+2+jXXpnfF0kwcUFYqNzqYrxdbhaYuixVY1KmjEo/
         PhA/5BjPh/p3YmSzeHZPTHLv3NYEBG0zk7mrhIGhHcOP0SsRYzzPo4T3QYPmOP7QVQIP
         WqIQbkI8RBy+2auKVQxTxpjI80xcvH/kYlSs66QIdmQNMd2aDriXNmQfaWhlEPC53O7k
         sfnw==
X-Forwarded-Encrypted: i=1; AJvYcCW6YPVxODB+dn6ePxvBPKqL+fvPiQFjwCy4Hat2fpKIIWTyjLBxjsb+uGOpC+z0dtulmoGWR54WX/DrKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzjaYUvjGECDLPCcq2sLhFMTbXgM0wsaGcnRXoLb/bJO15ayn
	vtlp3ZrFxzqydJ3ynaeSKABG2cmROOE9MwaTcdpPWfC+klp1ZvqhlHQMjTQ8fOztKdFRCb9CKHp
	ra8ssxD5gdqKe5ciuLaBghugRtxPELgUVI15c80zQhAc9A0A+Tj4A+sTqBmOrVA==
X-Gm-Gg: ASbGncvPIk05tstDk/ki4uLOYQgPwRNMA/OB6iN4asLI26JLPIQn65aff+LA6BxxYin
	U0CSsnqYxhX0ruguvUHxaADC3QkBQgRjlsVKc4zfAqRT/3knhyn5Hk1pTh0seKNVVc9fYCd97ee
	1+hXOlZ1CukdZe98LmRexRa67HSTSOoxLjTa/sg0kInLZesgn02swjyfES4C0eEpcOvw/NqBXCP
	P9QUMDeW+AGyoZLso+R+GzQEMLgXsczacLTC7qiGRFG7vlE6eh3G+blkP3xWoqmH4bjAaEKTPOl
	2LkQoOE4ycnL93G8IL2wdTRp/StA8cJ+kVA=
X-Received: by 2002:a05:620a:8005:b0:7b6:5e36:224c with SMTP id af79cd13be357-7b9ba716af5mr2740044385a.3.1735904809791;
        Fri, 03 Jan 2025 03:46:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGkgkHEXHgJB97KC6g8ncpRmzgUuiK1vzhINpo+hNCP8WWHql0hysgKibRKEugtw9zKaBQ9w==
X-Received: by 2002:a05:620a:8005:b0:7b6:5e36:224c with SMTP id af79cd13be357-7b9ba716af5mr2740043085a.3.1735904809398;
        Fri, 03 Jan 2025 03:46:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaef76c461asm1301650866b.125.2025.01.03.03.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:46:48 -0800 (PST)
Message-ID: <848ff34e-6d8e-4e53-b4e0-5e534836c67d@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 12:46:46 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix
 regulator-fixed label
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
 <20250103-fp5-cam-eeprom-v1-4-88dee1b36f8e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-4-88dee1b36f8e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J0AXT72FtJYKk2oK__bgqfIDxYT2Ief8
X-Proofpoint-ORIG-GUID: J0AXT72FtJYKk2oK__bgqfIDxYT2Ief8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030104

On 3.01.2025 12:12 PM, Luca Weiss wrote:
> Add the common vreg_ prefix to the labels of the regulator-fixed. Also
> make sure the nodes are sorted alphabetically.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
