Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9365E4248D7
	for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317106; cv=none; b=bMUgVdFVVVXGRd1hxzWh2tMlW6NOsPKzy97n75UqqY1tMB5sVJgOmslQWi1H3eZeAXPdux+6YsDkOqlZBFAsoq7v5SjAG8Us3Q8YHN0nPyfOiR6FRjMKSeY+GYqg/ka2X8cp4iVKqmNl0gj80cQOQaBpmZNnAa0gG18/S8zqzoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317106; c=relaxed/simple;
	bh=6l2FurrC2SMkFOwK+3FLIgVdNdBJO6GIBQoiLX2YaqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dr6NdazFUSHG238QTbMCUI55MrUwndZjvvBYQ9hGaCIEmUo3o/vM6ddISMxq90JSS2jHBE+vz6aImgeWVnUrI/22bKabdtlX6d4YsjbaEj+oH1FI+VgWiZCE5FtJPCtHfkZBzhbvS338UNabbvKNIGRfcNkCQ+MoeX7q5dDcaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lhu9PG+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEhRuiPQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lhu9PG+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEhRuiPQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T8htOB1484320
	for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 09:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ywA4xQrxtMbXsUKCF8h2OYc7RQKwSOF8GADypvIBgbU=; b=Lhu9PG+4hxdAUX9u
	X4IjQ8A5fInUmDN9TaI70stDCRWFUkyBjN18NQBeyi3NX8NqANL9E4nNEKwqa0X/
	07xdieAjdAwC90ec3exoyGkCvxTS6KE/rNhGYk7uv3X3FIZ9qhKln88XsTaPbahu
	1LYOVSQXm3+6EMqpXE0ihMGe/conkrwFUuXmY8VxWSpBA875Euh9KgqPPseoZ+Z6
	6cCsu5xSOXrcFwhFAkUFHU4DVewPnk30lQTHL9Q05IdadZ7xS1J72KrBQAH9acVC
	FaWLYdqjhEPoY+nL2UezOwmS5qtKaJ9GEDCuZsoUhtJRE7kLBi0A+YIbmCn5WK+G
	9eBCgA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqe9205t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 09:25:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fddc6aabd5so1446066d6.1
        for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317104; x=1785921904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywA4xQrxtMbXsUKCF8h2OYc7RQKwSOF8GADypvIBgbU=;
        b=ZEhRuiPQA6wrNhtPM0RWqeljisc6v6xNxJHCA4EIMH+QMJPlGid0LTYDmkWJWHPvYc
         99pbjd8/CNZRQSUcfIadLB/GBTIYYpJmAkV5DIZ/pfpDhwPT8KNEhUaSfbsawe1nhS+3
         jyWwVjeWxg1eQ4poKUSZUrq3cIH9xqFeBR+IWCtEnkE+pMPuWl5nuWhVaOTymvF4gnJe
         0uA3BQINfL5rZ3iy742vcPUGZHl3xmyTkml9FRzXsW4fLOmMLYOt8ujM1UmQgtK3H+Xn
         9XB4t6ARR0nZz7CAGV7DcV0waW2lI+uuBEEZ1dClNaYUwPafkyaPi2YZN3bvZhxmPP3L
         oskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317104; x=1785921904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywA4xQrxtMbXsUKCF8h2OYc7RQKwSOF8GADypvIBgbU=;
        b=QnU8rapnmOz+GXMVlcfeIC+rm3f3Je6xWqN5uPzed8DAhvHNZRpSEz3uTBcI8JFTCb
         cC9okLuH4Zq4TOm+X+2mCTcuuXuD8TG0qFNhrHQ+UD2suCVu4Gp3kWeC/8rr/x8g7P8U
         GzrNp/mgCh9WPru6I0RlXOl+Z38stZRWsxCX1SSAv5HlI6JLMaZFeZaYe1bLl4GScBOy
         y8hRUDRsCRHt76XCi9xZclFUxnz+FBnhnv4QwgfiAvFum/2nl1hs+Upt1seYRDRKgNUw
         05otTyqCAvgj3U2b9KxQ73sSSmMzjnGeWS+68vk8+u8EXKEe6G5QjZg1N+dbzLjfPR4m
         e7Lg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/435z/p3G2Ratd7gAqutXOlY5QsMbK459mxlrmIz26mnhb3Rfl32TBqYoDZJ6tsuxjzmzOY4/kDOO/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHutj7riuWZ/Gdy5pZpjWVFkpwzqC3BLOdwC70l53IUAOSWLX/
	sumCiLmnmF8o3PEZLg8GoRSs5ng0RdNhdpaAh3hyOMZttLcOj77wq4F+VRVtQjUFPhzKRTL7M1U
	E4LeHJ/wYt6OdZArGfEzWzBDfbEwnrU3dIBmOqLiqr0fX2nLXhJ8M2QJSLWRy+rUzgg==
X-Gm-Gg: AR+sD13kzYvaNlGHQPI+8u8wwdImPEJbuHrfy/1xddcFDYqjtjMdHct8C4V+nCp01nv
	S1MQ7r0+xgISMJR1fkBqSy9OTQOo/UHh43bBbMSQND4qnrY0UexCuuR2B8w4yQ9DQG2c1wLiIC6
	uXXWaY0kmsPSQG63sYnhjz6eUummGnOjr/5Cjv+IXzveJO19sPub096vF1o8Bj+SdTPHMJUGAZs
	vLzDwS7/4bOA310ucTkaEVzcyC7z600tudR1Xpx7N14+uerat+IeCrZUoMLp9/SsMJZxvULMIea
	cBjxg086+Wvv7dEzgq2fFoTJnreL+C91UjcKVijNfK7ttWlXrV0b95ZOKDiRxICLx48O5x8JlB/
	5botOHLhMCO738u8wULQT1DbQ
X-Received: by 2002:a05:6214:5002:b0:8fe:b7a6:4fe7 with SMTP id 6a1803df08f44-908172b4077mr57831216d6.1.1785317103398;
        Wed, 29 Jul 2026 02:25:03 -0700 (PDT)
X-Received: by 2002:a05:6214:5002:b0:8fe:b7a6:4fe7 with SMTP id 6a1803df08f44-908172b4077mr57830716d6.1.1785317102763;
        Wed, 29 Jul 2026 02:25:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c4ac3fsm599079a12.15.2026.07.29.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:25:01 -0700 (PDT)
Message-ID: <a39b9889-2311-47c3-8ed2-dc94ac2478c8@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:24:58 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status
 before configuring
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
 <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
 <1c4ff5d7-58dd-42c1-882c-c1ce0d5a62cb@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1c4ff5d7-58dd-42c1-882c-c1ce0d5a62cb@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfX08XVa9lKH89Z
 UzwMumnFmmHlMyh7miqCGIxji84VsHy7fHm3BJXtmqWpEIzhJP0Y4QmOfxVfcZxMT6MzhDTCXdh
 vzLmxf6VB8qg0Lp/EfZXJmTqX7IJGgc=
X-Proofpoint-GUID: 2FnaS6qwI_x6YvpScZB5hEDhlpw9PAWY
X-Proofpoint-ORIG-GUID: 2FnaS6qwI_x6YvpScZB5hEDhlpw9PAWY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfX1rk1Q2NiVEsR
 ytuAtRRilZKD3sFrEmXIKIdGCZwW25U3cFbxoFsNUJS2MmugFNd/hsHyJ+Rkqt9pi0/ZK/Bj1vu
 oZZnhjRMPRVHKbL8Esl7lhjU7ZRq5AmJ6NjASEUJHJG9yjE38YMtBHdZ2hCG28MT9kmdDU0UJ8R
 Vmkz1v+0CDSFo4TGRjzieuokVJvKjVmEau3CGhG8YVSCdgXGYwpbb1TsQarOkmyvEhXe04ciRfC
 8N6zAn0bT6zkfU57BXMQ55OMBqnj4lXM8rcNqnBcWmSt6IDw2BcxcKb9JNxZDntKyA7xq2PAJpH
 aThqMSkJpEaj4wyA6Ugq8lAcRhiqpjj3xO6uZqrMpaP0ai/kylb57USA/1uwmeJ+kxbtywhy8zg
 jdZc2f+pNWxeyP062kqOnWKkFxwLzk2XxeHjNXB/ed0soCZJYVD2FIjKn255arhVk7k4xNQPc88
 XOryVnvtQ3MxrAueEUA==
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a69c6f0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7_YbKsyzkvOx_SXqh5AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290076

On 7/29/26 4:44 AM, Esteban Urrutia wrote:
> On 7/15/26 5:31 AM, Konrad Dybcio wrote:
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 
> Konrad, since you pointed me in the right direction for this commit, can
> I have your permission to add Suggested-by?
> I should have asked this earlier. Sorry about that.

Might as well. I'll leave it here so that maintainer tooling picks it
up while applying (i.e. don't resend this series)

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
