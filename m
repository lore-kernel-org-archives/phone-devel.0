Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA401421899
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999604; cv=none; b=f2Hz83pSivVvORgI0BtUYpDRKwHmmm/Lmz+hdvXsKd1AGnVomzkJHFhj+pHsTu8K2mSmf/NCbDQl0GZ4EDl6y9kyPFdgtAkvdo/3/wJyJk/iSZBPVGLUZZqsJ/+VYrI3yYk6i7QsWP7a0JIj0BV0fkKWm5vwprd3DBTEmVZ6XDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999604; c=relaxed/simple;
	bh=kcWVg8RyE5oaA4SLks1HrECuEVk3YXF8f0EC75DLLAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+NMlMXFiXY2GyGeYvHXp1IrWEHA0Qvq2bDoACO0u0oGPA3HE7EmuUEPTRMXnaqxQrYzcsDyjvZJgHSYsYqXJhg1Seq8aQTS4XenWDT7wsdLePKHuzoa3+1CT51xUYYQBIiZ/tW1Z2n0afzAUcaNzN4RwpKsqs7qeoK8AI1GPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhTDJAQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KaqPsMg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhTDJAQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KaqPsMg5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAeKHn2816882
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 12:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuuE63FU7lC5Rz3dqZ/OCsZHThjFOq/fH50DC8Jq1ps=; b=BhTDJAQTCyVn/CuP
	0reyujoIRLNZ9c3K/8tACGFP2/kvpxlxlRQh0ug6r48dhlFLzzWn8O6A3TVnA72W
	oaQm+Z2vKQcpZIoMevMEqbGglRD+n4ZYt+Rk73/e/IHlbs0ojRVFOUSfUNJUfO2i
	cTloYxpkMoj9/KpJJLumLVXCb4HJaLwA8GEVtHOhhmIkWAwPJzrS3OsGkwDRcQkI
	VKBYH9BSF1oY1PtfTHBA2shob/Jv/Tm1DGP8ilng7pfgIEjVATJgO8/lQ/xhmD/W
	rZ4olGAGBPR0for2E3VffHTm7VvIgZYLv9vyBa6WBAC3eRys1s3croE1PDLAGHQU
	fW3jcQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btw8kgcxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 12:46:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52d47dfceso123644585a.3
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 04:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768999600; x=1769604400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CuuE63FU7lC5Rz3dqZ/OCsZHThjFOq/fH50DC8Jq1ps=;
        b=KaqPsMg5N0Tb7V6crdBUPPGZBUGR8SyA8w8Au3E0kGM3BhLS4pB/1o4aXLv4mUqX4e
         YlipTQ11Z77EqiSbxmKS7mUoKIpbDttwJCfpVIk805/dCVoVZBI/Qy69gn9Su6aLbLrQ
         N9WP4KC+BwoUO0/vtsKWYDBbYuOolkO7rn5jERBV/XULy/k9iC2IQ0kwGNzpvnNUNH/4
         gw5WE1jUSBOBbXUhE0puOlXYst/7Aqb6IiUf+jZ3jHKn/62vCRIwaPRwoJ3qJ/Ijw2xH
         vYZFDDwsEjXpybUaU+gr3f//Ws2QsdnRJGdojVjltA2zE/Ugi0eKNgpWIegUrmKsp6LM
         FntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999600; x=1769604400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuuE63FU7lC5Rz3dqZ/OCsZHThjFOq/fH50DC8Jq1ps=;
        b=T5CVp/o/fPHCUCDmgHgtOkxiiJZvUPErjPqxqSr8yyjdbCOTX6ukGPxKuiquWo04rD
         JJstaBT88JGT6JPrGA8fmwMAR5PyR9Kiq4oTuOsu7X8EWDi8k2O9oGKWZu1mPrd0i5f5
         nqYLJn51tBgLhK5jXqB75iuq7nnZ4ABHQJd+ijA7tzJKFH1EKzXJGXxbsL0n92M/OJEU
         EnmonzAqSfSPy+xwqhwp0Wn4/oTc6aAh4W+ycY7vMKXr63Uxp9Z4ryTM2gOoN8hXUpmB
         dCR6o07jFOLt690GwTjfMIIqlIoTM4S5mj7DxVuCQPrLQFfJjV8pmCTJJc2XdeZFtkJf
         j5ng==
X-Forwarded-Encrypted: i=1; AJvYcCVCXqE1e5l2lNv2RaJDzzj3DxmEjYHTEpAmIzqg5SEh2R0sdEOJIbitrk0MGpRl+FWVuZkpw+4GwrC5Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuAN7NyfK9UzthbSKMIotngqNzY57rBANKqpnNW2OVWb/oJ10
	5TSHPUNNtbUNsvZfyzDZHvtEfaVKr7sbLoJbepcSK1UOPREM4HaemHlVRAfTIWcSlPnFha5Ncze
	f2u+f3BV0EYVSafhtZvZ/E7eQJB7GkKxhGbNfNd1U3OxzTjMMUjjIm/8ADzsmmOr0sw==
X-Gm-Gg: AZuq6aJrpWV64ZpvJJrh2Pbijk/dMv5+aFCPsq3EW3cxQQvPgcIoToc+I8Z4jA2j/KU
	v29ji8KxY+k82PCOy8gU04XQf6w6Kn7+nmntWLghmzqPyep1meWlVWfBnwI2220Qv5ZxprMfPBA
	xeZybCnAX1Ez2jhufz4kCeouvZ/t17INkNLRoMFve/TuwzuOPxe4ZLdRLK91kpAN+TsGE3GyMHJ
	Brsw0Gm7Z5FlA8hvEwd6hm5QHHANMhlXo5Q8vu6O3BxglqMJC2X5eddd2+7WUT21WpdRjNwl6dp
	Sj7ktJ+ZxJ4PhGsnd+sSdpMh0OrGAuqaRF6ZJkbxp2By+xCbncVb1nKDMPZUbY8IiRMiQOvcUjz
	wgX+fqNgoEztzRhYkW4Mgjm7DgFt6bz3697iqAv3kLo1sOo8uTAkE1SVP3NvPA7irA3o=
X-Received: by 2002:a05:620a:4492:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c6a6606fcamr1768446585a.0.1768999599938;
        Wed, 21 Jan 2026 04:46:39 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c6a6606fcamr1768444485a.0.1768999599575;
        Wed, 21 Jan 2026 04:46:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9f98sm1639061466b.42.2026.01.21.04.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 04:46:39 -0800 (PST)
Message-ID: <4d3db091-ac43-439a-b065-c6b32da65f80@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 13:46:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix
 reserved gpio ranges
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
 <20260116-xiaomi-willow-v2-5-4694feb70cdb@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-xiaomi-willow-v2-5-4694feb70cdb@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNyBTYWx0ZWRfX4s/WdXGC7D7J
 D9/AmshcCIsyOI9Ruznc8zP0q8Ssg8OWt3iUfwNMKXWO69LdJlQPSWJ+gFOcyOGRYLNy4bduYOL
 T7LBN9DFHHOhxiw9LkiB6SGQ9lGzrtOtP9+hraE/M9fKhAQ3Yw/Dlz2OTQZzqZQxEDctg0UaTka
 EiMaS+xKLgZQEA0ZYR4xUwdITRogho56M3df2Fvb2uB2geI/86Gg7qCBRvfEqnThcrOlKqsC6Di
 Dj90H2OQ7YgJG7WwBgmIworr2rth3SDnGr71EFiUBiyRBCsEfsNtJ5LnhyJdttD2VluC45IEub3
 VnJrxJVujyZ2SaJZfZKQnIvBDTsNGQvPRCNs6LabDflxrSsTvQsoeqQM6XJ5ZGhpBow2TYg/bEm
 kw7oYX1lyS61jrxS6d0zDdDUEc0t45jJhF1KnV8q24NjlXWmzp5sH9y9i7euZ4c/rJmMOW1lmDa
 hn649vOrNKbnwMpq6uA==
X-Proofpoint-GUID: 6QwGClK9Ui6rIA36JnLE2Q_w6zTa1wru
X-Authority-Analysis: v=2.4 cv=BPW+bVQG c=1 sm=1 tr=0 ts=6970cab0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=76ccbOfYyMFIcZEcX7gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 6QwGClK9Ui6rIA36JnLE2Q_w6zTa1wru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210107

On 1/16/26 4:54 PM, Barnabás Czémán wrote:
> The device was crashing on boot because the reserved gpio ranges
> was wrongly defined. Correct the ranges for avoid pinctrl crashing.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Tested-by: Biswapriyo Nath <nathbappai@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

