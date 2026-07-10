Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E5B23E324
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691139; cv=none; b=CCMiJoWPsQkJ25HABLBze9LcCgftjWD60dRKpoCTdeZAo2P2eohjXL9d2LWsXsNPoh9tjumMjcsUBW/T/fCDOKulUJ9htjPoQfS42U2WjMpltk4KN2iv+UOvPypN8fEe7JCG9hzepJ9jcOogrh1O/kaksKrLWf6drXY/iblKL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691139; c=relaxed/simple;
	bh=249hh1NXnkkrZXHaprMDjBSQruPO7owm+3gJ+27AxHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOLVpJXA52X7WNh6IjT0w2olYSViJXd8kP7/5/hRWFGj20UQeraaaTgRE8C32edFg5HckfZpFFG2bvdyEh592+nkhL463ZVASl5DeOUUmrXgR8Fdbb8IX8Vwxe/WGzbzzJOeWpk8R5c88XSrhsAxKvDx8fVl8P3l13C0lYoQwlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY5Nmv4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLKAPKU8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY5Nmv4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLKAPKU8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6F8f970298
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 13:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=; b=DY5Nmv4+aciJFDO0
	DRLw3Kei39IgnoFL57xzIiXIPXSDL+q/NJEkoPKnfodvN4aQb0hPY7h0Ix6vT1JY
	CNGTyrE5UI+aqRvTtK9XmtoPzv03Hr9nwGWfWenxzKCrhiAg2KVRHFCKY9QJZTuF
	uqnLFJAxd3+OwTvurAzsMawJ2rG5YxLH43hvbabD4od4r45qXcHfWw/5NeijJlH/
	nh2dpwasTrx5B/cWdyzmSteW5cGEXBLXlE+l8pJ3fOqhbpceZtoDnAMn2djvIhzq
	6qxSmmYtZp6MtVzCRUezk/jxsiT/1chCB4LV/mPoZYGo0utBtm+lkf1LWWILc8qS
	mLppLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3mq4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 13:45:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so29913485a.3
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691135; x=1784295935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=;
        b=PLKAPKU8znZVZnyOH1i4zARQSuHjg5uwBf71TalAkzx9b3AAkrm3Wpa8wPAHk0oBeA
         WC+/F1IJv0D7WQ5+xBQ6rCAZpkMHfenuDvNfuWV9wEtXTd6wye5jGsw/lIToHSI1Tf0N
         +ZchtlNJP85O7fg6vre8BMnQnwny58KTwLqWdY2Z6Ni7YQj6Z/KUw8caLpstJL+rM5j5
         9ZzlWRg+cdIhDCFyZlX9quTszr89s9yttnz9YjIsx6tKU/jtA4S6xjQmJK5w2glV7x6a
         J4Bdja7q1FlhEqs/+AbQZP1P0pcScN+IonUzawH1v44jN61OlR1hBV4oyZgpPx09bzkI
         QY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691135; x=1784295935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=;
        b=mfism8l/RDOsDJ3wTw+vRQzR1hzYxdLkifuKwFqQ0JlNDv9KCDlFk3TMrzuTJoR/su
         kpft4nySUfko27OUKvswQKWS2LQ/HjSsgfGGxb4IFM0gVb7qNaSw9sjlCCP1tYLmKnWq
         AAQm9R/lE7Nzw6nuJ6dgPl6AdFAmAdXRbQANFiw7NF1c0S79Q0b7h0fZ8UUniVWmGU6/
         iGRvECbjIAP1TBsS7OjnF2tP9hW+NaFYaiLm0IkUSna6yvNN42ANyQ6P4sljFlKsmkF4
         uV1KnMate0LJ6dcGUyx1CJivLGfCI9Th5QkfQRz5+bdJncGz6SaGU2s0eOdd/UNUZoyE
         ZLbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9XCBCit6vHuDUXD6pWXk5+Ij2O+3Up8ZST0g/+zHmc4sN8EKQ55jPIGYvOTyHIknHZvLMOMkRdGVQgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyww+9HId0CJWp6//tPxEvH2dP9fpDzenoP+06a9XAjcGHQni7Y
	lt1b7fOG1zU8Ui/DHKKo9Z4WmAA8kPDfFiedyWCbCnSRW0Vgfsx7NYQ8z1Fw25rH3dm1mmJW6A/
	WEeK3j9rp5oRdRWJhPCrmxfsIPJNsbqgFaMlU5v//j16mt8dTQAywhdW39jlb5jB5Lw==
X-Gm-Gg: AfdE7cmpoZAe2SveVL5booRgJDdvEgaT4/KWd/l8Y9Il022GWbrOwxB93iQIdo2Q2co
	iQHkkK5xAchqTVpsIF1c3yeXLLlMFi3eATKNiLKtt2wQL8tuvGHtwuz9Q8KzZxHa3qWEa2a/J8s
	xWotQed95Q+np6G8IHOA/z/j6S7Z54ySOY9E51iDwKv0MET8FTup3Gs/x4oJkuwziHj1reQN3YR
	7HX328WgL1mgsWauywdVcP/IPICZnNVGSTX08DTY/yWvw4zUg9l7/waQZCHmbkX9hBQQQbZVIIA
	OGinJ1zQ6tXoMCUArfA1nTe4873p9wOCl+S/RhWBnVhJP1gTn6BpCluMY3wYNSPTWrkZlQDpQN9
	fqQU0UWwwwH39Kgtd6DIlKNhzU0XPMtY/H/s=
X-Received: by 2002:a05:620a:2b8c:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ed79e2ba1mr693513385a.3.1783691134711;
        Fri, 10 Jul 2026 06:45:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ed79e2ba1mr693509685a.3.1783691134272;
        Fri, 10 Jul 2026 06:45:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15cfac0f76sm429862766b.33.2026.07.10.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:45:33 -0700 (PDT)
Message-ID: <05aedb9f-c57d-424b-8cc6-19c3af768459@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:45:30 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos: add CPU OPP table with DDR &
 L3 bandwidths
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-4-ae7f4b09bc77@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-4-ae7f4b09bc77@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX7hmZ8fF04zJB
 BboLQJFSARha/H5c1twYN5MKl/I8HiGrT+iGbYAAvzxeaTJcURYwiqkHVHFajfZm0gEjl/argcq
 krKF+0JCXU4GYMwH1ZCknc8p76O86YHQcMFaYRvnX0WB76H0/qXEUEMZFcWkTrVXJ/Iu4DtXNuB
 aVF69bmnSnHrAs3yUpWM6pnV2pK5cyrF7Wqig3iaIbYHfhCVtVFKsvBhz2Owke/4NOp7wHSim0a
 HbFXRVwqL5oTJyv5fgpCPHJ9lmc2FDG+Rr2jR3RioVNkvLmw0rOgvazQbwl0lzDR1URpQUfMUgf
 t2SfDG9X8S4lzTVoWXGm3cZ+IbRL7eWQldZ9nTQizTzrQuIkKKGyUcN4XXls+af5WOJwSiHHtzQ
 fp9KpQHJeNi0BkcEPxJS1PTYtYMsOpCulBja9ZJVluZB1U+/8rCkna/WVYO8R/NTubhkZcM8l+o
 9uVeJXxaoIFdf/wDz3A==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50f77f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=3I2yIiQ9ViMUFdqIhFsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXwUu7wLRThLWn
 H14ZQqc1akTnLDHZ7L5izMIClWguz2He2OwB+fbINQf+N281MZgWn+7GVH20KjCSeDe7Nlov790
 2YCm4q1+PyDOMaStFEh/n0+JRFB3aL0=
X-Proofpoint-GUID: zQdcpLYmCXy0kOiWBen_fgvcRQn7svO_
X-Proofpoint-ORIG-GUID: zQdcpLYmCXy0kOiWBen_fgvcRQn7svO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136

On 7/10/26 11:22 AM, Luca Weiss wrote:
> Add the OPP tables for each CPU clusters (cpu0-3, cpu4-6 & cpu7) to
> permit scaling the DDR and L3 cache frequency by aggregating bandwidth
> requests of all CPU core with reference to the current OPP they are
> configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> change frequency.
> 
> The OPP tables were built using the downstream memlat ddr & l3 tables
> for each cluster type with the actual EPSS cpufreq LUT tables from
> running devices. Note, that higher frequencies than SM7635 are available
> on QCS6690, those have been added here as far as possible but may not be
> fully complete. Additional OPPs may need to be added for that SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

