Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F7735B13D
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015026; cv=none; b=rcWTLMN0UrRZ2UuOwOEGq2/qrgWbOhQPAmt0DOh25Iz23/2o0qtSa0injcNaw70Ni7D+2o6UkBSUbGmKbUQaGlJNNgZIdnoF5Qac7EKki2tFHjDS+IMmv0cCVW5dJ4g82/31nz2Ub7dVwQHUr/CrgxxtS/x+f7qAT4ehIK+B0GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015026; c=relaxed/simple;
	bh=fjO9j7NpXzRG+FLDAkh6xibgdxMTf2nhnI7rVklt++k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oliQC8/6+YODo+j2CcGjDP5qlGXizsxh53H4GqQ4JAwAybkyu5r0+cpSRzk/AXbsoN8ub0Ai5gaLmTuCiHxE06B99/hw5e0f/V3BT5X2kyH4YC0yyrybWqjcIXQAysDbmjTr8uWpIgv7ghz8bnx3u6y3G1Ab7w7B/NoQq5rfS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+smpT2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuyBLEdu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+smpT2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuyBLEdu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAn4qE3316493
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 17:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xE6fvhDYaR5vEy22iV+diftMONfSSkqxS8Q9Xe9dHM=; b=V+smpT2C3bou6vMz
	nejqxUycDfXNgosh18b0lOPk+tmnrcrEyr1ulA1BswBDuXRvgI1LOtS0O8TzT17a
	7aSs8mlOrGwHtml3NepDy7KKfh7QKkOtIbVHMv2BOC9bBo4GdJgM3Yh6kH5Ca14c
	n+tsC5xRJlTe/Uktyu7oP6gC1Kp0Zq1284J/GIv61IEuqAeRO4f6+7R72YFjFuJv
	C5/qbq+gDdz5aeYy5u7F5ylMn64bSXhgb5OQWfT8fPQ3Tn9kdaai+t80VM0HDldE
	kQKwY3vbbTj/B2pih37cBk8uReW3Rka/uQyfT/K18v2oMcH/VQ6GIRHHcfMO5JYi
	V+cOEg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btwcjh9au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 17:03:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ec8cc7d99dso10508137.0
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 09:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769015023; x=1769619823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xE6fvhDYaR5vEy22iV+diftMONfSSkqxS8Q9Xe9dHM=;
        b=XuyBLEdu97I2hW8ghKjB7XkOvQOXP5OLd64bZFpylmAGrko9SE+1h4q5LeS//SbNTk
         TTQITa+oOeKzdw4MMwUVMNf6Txkqie/VegeTOS6KD3wGEYV9GtitNKxgOHoWJd77M1Oi
         odVKDUvsZmCOXCoqzumtPdcDo+Ralt42+lEcI9scOIeC5a/IKlyFnYjBIRXkjKP5Xepy
         ntSsADDMBwHZMuFNMpFhUzyp15FbhUn31Rgb6kSid8QP8g2c+LJROpTIY2PJ3L973kl8
         DMFSUO344CPvILhn6kZIguziuNyeTCa6ajuku4YMFDxXy18+3LMYPHcWvPgS7CRJLmRp
         Gb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015023; x=1769619823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xE6fvhDYaR5vEy22iV+diftMONfSSkqxS8Q9Xe9dHM=;
        b=KS3wwkxaOFE6dAguBo7A9a15224aqvmeBh/EBI6J8O8fYbJo9EhBJFmAKQ2h5yHQVs
         VQ/RlTtScG+3llxSGITYsBKfAYasYFg+675gYf7ZoY4adEv2RFMQj04vjkxoVP2EjrKy
         CIvFg/9uafrSWN/HLww3KSv3zaqpM5OBD3VnJdNV4YToBJjaYk0IL5owWi9BAiWeg96x
         DJiETVZejtalhdR5TRTGoWCCfFyjpK7EdPTqLTU9vA6HEjFqKxjy6wYWc2eW+bVZNB90
         HT6WLi9hS//u8+3pR67/rlW/Pnlcjyn24/T6XtlVPEceictGpFcxd1Ln7CskzDSZUW1A
         EySg==
X-Forwarded-Encrypted: i=1; AJvYcCUMY/23exqAPIMNZkuhUx0jh6sEin0pVxyHdmIt8apxhUNrO52R5WF0fJJ5g3jPJNg11TpBH+40me8ypg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDHjPttmuRMO5g/jEc6cXfMCgb2YZVFVToeIxFfJNdg8r13GY
	EndqG7v8mv/FYOW5483FNED1cD8ZwDhW6dbZ82UfSEI87qP8rVQ+0SA1tfkto4KN7hB9KUZQNuw
	rJSC7/A//RVs29KcMh32b7XtFYxG3WfemDfRg2vtWlXGro8L7e/VBWW0hJOe4M6JswA==
X-Gm-Gg: AZuq6aJ3xwON3twOnCgPr47BG3c8jVt1UhgVqzWMIxl3sjqsyGA9H53oaQ3K0L+GcpV
	LHfaeBTh/CobVkPY5S/JbyUOrLztLhm4X72jJEV7Rst85h0ijv9YC9e+nsm9Bo800ksEVGN+DBW
	BatZXjmTITRcomP5hbfJ5qK0PtAE7DXMiLdNos8ayl0Py/5PfIiYfPd5n4/ulPHvm50HFP0AFSS
	ERiZAKdzr7rs+fLxdigA0b/om95Of7gnZqjIOPhW+W8RUQDqeotKbLbJ9bcZIOph5ofZTUBdQ3x
	jVqZYToIznz3DmxFVDj+RCKCHlPx6bwTiiv4vrCFxV6fS06dBYNrOOvHp/+F7H9aEIqnc/l6Y7+
	JGV6J7PIYwOb2QPMZWjPLGDMpo1ng+RLEOk1DM4KE+PPMJ04lKa4MwZipUY48BqDEt3o=
X-Received: by 2002:a05:6102:5ca:b0:5f5:2b1c:7549 with SMTP id ada2fe7eead31-5f52b1c7713mr238023137.4.1769015022225;
        Wed, 21 Jan 2026 09:03:42 -0800 (PST)
X-Received: by 2002:a05:6102:5ca:b0:5f5:2b1c:7549 with SMTP id ada2fe7eead31-5f52b1c7713mr237977137.4.1769015021280;
        Wed, 21 Jan 2026 09:03:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795169721sm1611734666b.24.2026.01.21.09.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 09:03:40 -0800 (PST)
Message-ID: <678a9105-663d-481f-8286-f74762e09e8f@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:03:38 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: pm6125: Enable RTC by default
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
 <20260121-xiaomi-ginkgo-features-v2-5-fb3ee94922d0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-5-fb3ee94922d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FJkbk2M9Ob2oovychc2HHi-wh66j6tOi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0NCBTYWx0ZWRfX5HYD+dRzTIve
 iwOMEwI5cK8OnulogHmeJuvGqFBEcH+o9NdhJjEn5Qj4rZfWoT6JgJfcdAfFIfgH/mGYP3LYfyH
 B1A5rdi6tfZBCX7qZOOVLB8pK3ZHgpXKm+jttu5SGzggUpKH2pJugNhw1/R3TeGu3Kc07pMmSr+
 GhGjyQw7Cc2cCiQttHIYiA6qLQgWGxLV3iiTCjNm39KmGBfo4yqUzfqzP8aKPJrIlZ5rCLi4lJZ
 bhLKxL21wXEFzoUzRnxGsLQMNezfcpE+xpjTUuw4SBxoKFrhhcZ/Yj4kRiwUZDW9k09dS8kvXCg
 zOxbClzvaUuCU6Fv6+ibg9ZryaRZ1M2rIJujoVQkFInaZkkvlaQWoDNxcK7XVK7GvFWuEp3gEf6
 WjC7B/LuW8kHYoviELnuOBYcfsKtW/cB72ttnS2sCq8s/bsob8wG4N5INsOANd3V69jWFE6+020
 zTg77wQ/7st0IEJ7/Tw==
X-Proofpoint-ORIG-GUID: FJkbk2M9Ob2oovychc2HHi-wh66j6tOi
X-Authority-Analysis: v=2.4 cv=JpD8bc4C c=1 sm=1 tr=0 ts=697106ef cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=7acBLAuPG5nW9c0efqEA:9 a=QEXdDO2ut3YA:10 a=fFR93BqyA14A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210144

On 1/21/26 2:26 PM, Biswapriyo Nath wrote:
> sm6125 soc uses this for real time clock.

Bit lackluster, but I suppose it does contain the "why" for this
commit..

> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

