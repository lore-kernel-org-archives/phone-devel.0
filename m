Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EAC2D97A1
	for <phone-devel@vger.kernel.org>; Tue,  8 Jul 2025 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751974305; cv=none; b=Jx26Ev9HCorF4Im2BTCZMNkRfbREWg22cNtS4ozZLVj56JIsHGODkl06A5grji7HDMhY/HOM2IQXLUsfxz37v91fzpgJo2LXBiW64XOjdW0DK7+td5bJcvYm8obTc3ETu8pwOohJKsMySigZZjgCz+rMraoEqnhP4aBS/Bdwquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751974305; c=relaxed/simple;
	bh=P+pxE6WaqJCtlIPhTde25jg4Wk2SpGFNRRq9qAcfinM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xyj1KUSeGiK4mqjK14pOtrLFe4PIbUcYZrrqI5E/RbM4OeDfW5S6W9lyFEJ7dBG/cHbj+YjmQrcNQywBpNhQ5jo0Yi7dbiOIY7NbbIH3hvMg5bliYqsISfvT/w3Ti5iziDyP3Nr6m9i/rNTnY0L5nsF6/FjfX5EfZ8IOG6FmP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwwrNEEy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwwrNEEy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAPl5003481
	for <phone-devel@vger.kernel.org>; Tue, 8 Jul 2025 11:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUm412BRbW/zHRuNnheSl3siSXwcdOp9rqnr499LK+U=; b=gwwrNEEydC/VFkSE
	C9qBwaEMdqlXYh4rJWV0wz/+oWpfv9sNEJXK9zzL0X4Hczchu7ChsdPyUZIUdR/W
	jcs4TMcTD/El9/mQrM6qtxA1/WeBEy+TWFBdf0/ghZ+SEzBkfojs/sB6MT1KKwy0
	JatNFxdvM5HNWmhD188G0QK1d0/KkpPRWA5+rvZAPrQWLvZ4KxuOviRze5OsYhdO
	aySsDEJYrWiEnxkc3jp4Qp4b85kkLURUgwdXyeG1qx/uFPJYRsicHT2/8vlx/bRu
	FXKNoDjMpYYYPCaoZh54WoO48OV4YBZSxt4QjZmvaY+YjeBCYfxiHZ3rJ/HMa3dv
	knAAxQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefd1k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 08 Jul 2025 11:31:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd5e07066eso10621776d6.0
        for <phone-devel@vger.kernel.org>; Tue, 08 Jul 2025 04:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751974302; x=1752579102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUm412BRbW/zHRuNnheSl3siSXwcdOp9rqnr499LK+U=;
        b=Cg/YsD1H6KIYo34SsMnuGdnOV/iUA744vf9G+3+bNFpTNM/1p5CAz8ACyMTfQLrJ5X
         qr9qm+OOBPw6vl2cXvwvN41b6l4uAErfsAPD1SdlZbVD3XY329eQNM2qb5+csSmC08va
         2AJCvb4CcSBoNuhTU32DjIZd6d+dWnB/M0bZlWgY9IdKHCHnga21wcaz0tzQQ8uBouy+
         W4tIZ8QTqC4WODIZaGcRguEkPj3CLB5H7MpPZSR5DI383+mz55HDP+ZyZGa3RFWOBy+G
         YAVNOrc5Q1JAWjUDPRASZA2csrVE/+DlnOl8HCHi21gd27hM5m7Pit+FCo2c+eO2Ou4i
         GlUg==
X-Forwarded-Encrypted: i=1; AJvYcCXW4zEU+LIhWrqGv6WeORFSPwRr8dhqL4BfhiJ9IKQBi2yGmnVluiWuYM8LcFZoVlH/vFkZUG3WISaTdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMMpoAfrMnQ21FHJWQ+L3ZQ4dRtSpPKXHpxBDQqomEqjmSGmm
	c7xFzoWcrzSosj7JJIj0GV8MnwPsQdRXJwSsSIFdZagcIW+PtWTKlRrdj+LZ23B9JC+HTDRBDqW
	Th2WOtCDMkec3GiYOxFtvHvnIhaCrAUhZD6m9oEbtGzLQbdEDBbT9ar0H7mxPG8XlDA==
X-Gm-Gg: ASbGncvv201Rokcr64rcSLV1qFXk4rEHLHmGJDxdU5VnByl4NUDa2LPbvTQx0LrFEO1
	Qf7HSKKCBMHr5Wei/1ljjFMmwDyo+TUlIqtCnrpWJo5H0R2ooOdQFQapRW1gWJlbuBQWJEHAa0j
	SiHhujwp+ezjEXjJUeWIo51fx8fyoiQJnNuulNE02UK9u2jZckWZ8rUGxG8/lLungTfLGfg1NxH
	BKU+ydC1Gzf5/XBeoMiQ1D46UxLZCdRof7y+nq90vZjJu+dw66g/XgDINHjVaKLN3Q5alEoV/03
	jVm+v6Bv4pxjHMj0s5K3bHnSvOolL4iIThlVv3J3/bAfkp7Gh3u1Q6z2aIQzaoUCRD/XOPqJzVo
	uk+A=
X-Received: by 2002:a05:622a:34b:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9bd3c3284mr46378521cf.11.1751974301875;
        Tue, 08 Jul 2025 04:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXS7HsMKzGHLe7mgZx4hB+HHWETmL2VAFfFIACPNdmtmlGbyoflOmhdiXYt3hmPsI2vMpoEg==
X-Received: by 2002:a05:622a:34b:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9bd3c3284mr46378351cf.11.1751974301243;
        Tue, 08 Jul 2025 04:31:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm877212066b.158.2025.07.08.04.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 04:31:40 -0700 (PDT)
Message-ID: <97074fed-7b63-47fe-90be-4161a4c7a297@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 13:31:38 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add SM7635 interconnect provider
 driver
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
 <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
 <3f8bcecb-4c5e-48b1-98be-96f3c0c8329e@oss.qualcomm.com>
 <DB6LPBOU5TDL.13B4A6U4NQQZQ@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB6LPBOU5TDL.13B4A6U4NQQZQ@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA5NSBTYWx0ZWRfXwwQfqGEMGBNF
 lkJS1oaeInP6oGKvPq/BUGb89+W5GY6zwsROCfYl2ffHa/KihbY2Hs3F5+LbDHawh37yNQ58IEF
 pDy8pcec4DPBj3lpKCLK4OWbLtpyAPYQfMULy7WYFf+jl8HaZfuyylNPcqx9FiINi12mSsqnV0U
 EN6Zii1YDCMVgXRxLOM/gpSx33ASiTQNDWUrh4CxTk7WRQEB8W03y4kQEugUo6ooLF0F4fARYyo
 pJTsmtDGoiOJijRgYT/Dl+52r88ofysiCfzWqlBlSyzrB3kuBGEYU9yh57pZEkpiuDenb3Raygh
 9+L6aRpEmaaWpYeMVSg+MeWS23TZ8u32WOIoT5mXY8g6S53v4m1iNCByLHy7Ar1o247kZa1RGLu
 AnyInS4rw3vg8+9n/OIDGEovyP3YHvYy42TPEbx0uSiW7XZ+E7sdOqXJD1GIZU71I6P4DUHO
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686d019e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=qFGWVYr3AIIjfRM7rNMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: oktcA0ddVd4457cdRqHjlbl7PoKAPqow
X-Proofpoint-ORIG-GUID: oktcA0ddVd4457cdRqHjlbl7PoKAPqow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080095

On 7/8/25 12:28 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Jun 27, 2025 at 2:48 PM CEST, Konrad Dybcio wrote:
>> On 6/25/25 11:13 AM, Luca Weiss wrote:
>>> Add driver for the Qualcomm interconnect buses found in SM7635 based
>>> platforms. The topology consists of several NoCs that are controlled by
>>> a remote processor that collects the aggregated bandwidth for each
>>> master-slave pairs.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> [...]
>>
>>> +static const struct of_device_id qnoc_of_match[] = {
>>> +	{ .compatible = "qcom,sm7635-aggre1-noc",
>>> +	  .data = &sm7635_aggre1_noc},
>>> +	{ .compatible = "qcom,sm7635-aggre2-noc",
>>> +	  .data = &sm7635_aggre2_noc},
>>> +	{ .compatible = "qcom,sm7635-clk-virt",
>>> +	  .data = &sm7635_clk_virt},
>>> +	{ .compatible = "qcom,sm7635-cnoc-cfg",
>>> +	  .data = &sm7635_cnoc_cfg},
>>> +	{ .compatible = "qcom,sm7635-cnoc-main",
>>> +	  .data = &sm7635_cnoc_main},
>>> +	{ .compatible = "qcom,sm7635-gem-noc",
>>> +	  .data = &sm7635_gem_noc},
>>> +	{ .compatible = "qcom,sm7635-lpass-ag-noc",
>>> +	  .data = &sm7635_lpass_ag_noc},
>>> +	{ .compatible = "qcom,sm7635-mc-virt",
>>> +	  .data = &sm7635_mc_virt},
>>> +	{ .compatible = "qcom,sm7635-mmss-noc",
>>> +	  .data = &sm7635_mmss_noc},
>>> +	{ .compatible = "qcom,sm7635-nsp-noc",
>>> +	  .data = &sm7635_nsp_noc},
>>> +	{ .compatible = "qcom,sm7635-pcie-anoc",
>>> +	  .data = &sm7635_pcie_anoc},
>>> +	{ .compatible = "qcom,sm7635-system-noc",
>>> +	  .data = &sm7635_system_noc},
>>
>> One line per entry, please
>>
>> In addition to what Dmitry asked for, please also look into porting
>> QoS settings - those will require additional clock references in the ICC
>> nodes and as such, the bindings will be altered (which we'd prefer to get
>> right from the getgo).
> 
> I've forgotten to do this for v2, which I've just sent.
> 
> But we already have the clock references in the bindings, so the
> bindings should be final, also when QoS is added, so just a driver patch
> then.
> 
> I will put this on my todo list for a future patch to enable this, if
> that's fine with you.

Well I'd rather see that be done from the get-go, just in case there's any
surprises (e.g. downstream may not describe all the necessary clocks, as
some were enabled by luck or so).. that bit me in the past on some other
platform

Konrad
