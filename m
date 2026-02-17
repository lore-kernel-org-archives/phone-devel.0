Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695053043A4
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320147; cv=none; b=eNspOz2E3KXEZfT52p5LQd8YCfupuWG+4bAHE6dz8NGJj1cbya5rP6lSZLdvhmqCSa2t2ayu+P5pG6hrs2TugMFAYiN/AzyIK8BJivevQHmPFX6e38s8wDPXDJ8umy9P49rtJT80w7sb+Nv6ma0qC3jf0rA5qZH3lhLRy9uqk2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320147; c=relaxed/simple;
	bh=hbiMvwzdBeegm+xcz4ZKpJyLySBoW5ne2NZevRg2h8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgNvRqVOg67tGCfCMOKKaikEUgiG2W4iRC+PyuAkDMNi79mIQI9mZgTR0J/4eanCvTOOsB8R/RIOM+8UVtER2YYb1YAPqokHMzPF7tTDdJBzn5ioGx0VSxBJpDEvcRcdhw40SrPqqFwbyg1VxUor+tBLvFYUObJyPaA7zYIBcxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ld2fHMIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ix+tR5gC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ld2fHMIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ix+tR5gC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H81kPb3392904
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=; b=Ld2fHMIfIGq0pjpb
	rSDEW8T/sQN4MXLKYJ0f2ezrDjgclALUQq4EtfTiaHpe3LmD+7KC5GYy8MhqtwWD
	wYF1IakNTMy4xk+qIH8ofUMVnjrPa+eGyYLEZljyd9bipRR81yF3AMGKa94kR8Mk
	9ab6rlqB/nnT69CUveW8R/yjOKUvlAJF8ntH8s9Q3z3HfS/Pf4lKm4rU2AGEYQxC
	BqYpXT5+JxygbKlZtEeKYHABl2YeJhsJRz5WBSplrXfHNPLGS0hdWlwxQBz/5XvR
	nOjx1QUH+u9ioCgrltCZSwOLkq6tvXKtdTlwX+XcUAu78HkBsY+KXblNvcE2Yj7T
	JiaJKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kh9ye0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:22:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f7c56f10so32759566d6.3
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320145; x=1771924945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=;
        b=ix+tR5gCpF1zEBtSROHIvp68Unw/QYlarstRNVlJ6564bxfrvkXROg0sGlGSDXJ6PV
         +xrUKf7CDsPmadyx9b4XJ61cLY53UDOs67j0CnpESyELMfJCCtWveH/W2uUfcgVFPKFw
         n6Tx5lw7aIX2vP2GIZE6b1lbF6M5xWIvV0Kt1iyyyLJWdWHjRYeF8L0Nk1veOnDkC2G5
         w0p22jPbevfiUaw/ozo29o/UOvNbaDZuldPuTmYmeS6QilcuB9SI0ONbB+AdVZoL1Mqa
         4LVRcu3H00VvgpsQu6AxeidqjbbCjxYnk1RVVqeAehoXBFTQ8rWXcldvwj8Br7y/Jx28
         b0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320145; x=1771924945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQU8WP8DPtD3ZqaRlIzs35wX94i4NSziOgp6R5uicfo=;
        b=KmzNj1xiLYehfdukF5mbAnpn0Z1vfm+BHfBwVNZB4q98nwzbr1O9/a2SglGujfLh5A
         kvrk3DTNNtjpLLQtO36nBczeinIjj6pSqQ8JYdHxr8Lfzb2rkwGE2b6JLY85SVgkpiQ/
         jtUpQdF4KblJUbGzOHdbjjT937AByu8i8nTNJwFgEE2dg9pGSg3JS0PK6ohH36diECAY
         YEj29FiKePGxL3123d8cJ8gKwkqiUphBi8pPM3Oms5vOoN/CP0T/vIv0H4N7PQrYoXmc
         Nkhu3fIo+GIrTN1nlYBl2nc+O7pL6AjPCsoUxZv0Rf4XKUSBb9conw7ZbRUykOu7H7pU
         VDrg==
X-Forwarded-Encrypted: i=1; AJvYcCUzslb3dCuXQbjiMr7wMRx/rwlYt+C9y8C1P/brwS/1m+M0lM+rQiHD+25KHaaHIzhBvj6twVW+tjnwuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwUBozFupPV9pTw6YVnBW4lCv/uaITs/7jokv6MEYHZyHQYDgF
	9LlMszy54PeoTz/X5R6cHz0kcDHhlnOVSpUCytqu7eNSGbrvBwG/gX9mfZ2BmzmaO9aMWekswBm
	imnrLD8CPoBwj6lHGi6XGU3Y8cEuuCfyGNpx5+MOdtKEjSbpZPfjm1dFUV4E+mKRl1w==
X-Gm-Gg: AZuq6aKdu0NvdzDwQ3NQt6wF/wbI1VAHVAgeomO7s7narLiFnppEpXZOlWXyxMwLJfj
	apWTEGkK5vL4iNTBv4TROIca2U+zR+1xmTFU0OzL5Iltm0hn/q/utsVl8EqFSzhZPCj5RhoZFcm
	Js+5fVU6wmMgaAfu0s6PDnfiVhf5h6n6by3EQgcu0PVUvsjvTq4tb6Sr2kjFG7nwno3R3LqU6AG
	WmrsNo98FiStKEHa3+z0JNd2J62BCvTTaGufkvbDULKqkq1JwSmROhdxDm4SQoPT2QbT8S2N7YC
	LV+CrYxHwN6lYSjWY7kBocLzSrSzuRLYnduedygig9oLrFWx5WR26rouDvkSmcPuu3dwMT5i94L
	c8jlObuGL+DgBENl+obTwVEMoNkdGbYtTwY/9QC33eShf/dDULVUy1JdTYSGO14tPlyHoIYuFs5
	qkxmg=
X-Received: by 2002:a05:6214:6014:b0:894:9d67:7329 with SMTP id 6a1803df08f44-897346fe806mr130852706d6.2.1771320144852;
        Tue, 17 Feb 2026 01:22:24 -0800 (PST)
X-Received: by 2002:a05:6214:6014:b0:894:9d67:7329 with SMTP id 6a1803df08f44-897346fe806mr130852466d6.2.1771320144379;
        Tue, 17 Feb 2026 01:22:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627895sm347299966b.31.2026.02.17.01.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:22:23 -0800 (PST)
Message-ID: <e817531c-2061-4e82-8cb3-af7997784a25@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:22:22 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69943351 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=NzzAIdn2IQfWdxSLNSIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: qfqvk8fcHSk_BQvobJEOQLhKOfwwwbr-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfXxvaCpFJqdy83
 5noTlTpnOE9KPvyUOZc1GcLnjMB/VQCo5Y2ehhdX9D4Q/UA2A/qQtmXpLeGm3uuFTxOqFASF4eS
 MHrmq6XgZ5axDUGKNMtwPOXr5jxV7cjglRI4ExfnnhD7o5aEW+e9fQugPaVL4dvuMJTZX+RGwY2
 50PvMfL7TKLqbr3wz04nUHOOhZFMsmgv++ar2hmwIZxFlVZpJMBNzluajIB6CowJocFRia5V8wO
 Vmx9Bmua7LUq8nfuZcqaZswNwXqtObrHzGdjLLa4kOqKgWA04UICHdSrIr3Hu5J3rL8eTqBhu8w
 NZhgTzqGwIO4kLP/ta1MErSia0bDTK2Cfqv4OWiL/nq9kiCJRuNh4B+LGono/mT4GsDGVCO4XC5
 kfFWUaS4dTmwySlItZVxS6mvxrsVUBBQPnhNU0BT/4gdTtHHCQGAbbZ0ntH90ZJqTGVp8LbZkER
 Mc09dGCLaTWjl2pDEMQ==
X-Proofpoint-ORIG-GUID: qfqvk8fcHSk_BQvobJEOQLhKOfwwwbr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170077

On 2/17/26 12:25 AM, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
