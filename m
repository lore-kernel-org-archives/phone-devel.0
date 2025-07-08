Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB3F1EEA40
	for <phone-devel@vger.kernel.org>; Tue,  8 Jul 2025 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978980; cv=none; b=FaQmezdKrxkyUhnjAKN/bg0Z0+0XgJTFVgKICrTgL3MMaZl4LnN3OPQ8vsPckYwdk+OEgBvP1NZmuITicd/JPiVBEH3gVZGtLkDvhRKDBf3Za2UDFGHQCvpV5FMwJHTZM4eTPzLA8dgVYvmMzjhfALpzsTgrFzCfex2mMAVTYik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978980; c=relaxed/simple;
	bh=4AW6PFJFfUOodYzIiSEYhLXKdLBz08KZt5fa7t3j9Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cahyZXCvSqmLdIZfmmX7mTECF2Wruu9jEds/xKDBvBAahjwnvqQoWoeXFtzlznFUtuWVFc2pbwiW3s7DCnf4o+WniEwYvrJ74R2qKA5BSx+KOWCULp8bOMlRuKcEh7V/wlQj6iK02pghtE2Om5tHfBL+YVVkp4uFqc+Y2yh/oB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvHyUo0+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvHyUo0+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAO7G030323
	for <phone-devel@vger.kernel.org>; Tue, 8 Jul 2025 12:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8qpSE5Dp43vB7gI5CagfdGXu5JUEx9y9sp3Qv7cISc=; b=OvHyUo0+o9sR/S1y
	n88x2gBixdRl2x7IfHx8Ve2Ufm3krpi0Z9h++eP6r6aKf+cHxIo6JLAxKWVOUzHP
	Errn+bqQ5B39wXbkCT4RrUokbuMN9ohlEMVnwvRVOB+l31DcZ0XVxvt5OeYvwWfA
	4pif5yRvx0IJaWnRkuc6zzNhjY/1N4BNpdGAj2+4GFYWW7oiOTdSFWaQzcSWaK0b
	HZpjv172WbP3TFwAlKrF83x29lTWj79CbAWJhbnaL/ZEj04sZq5S0C2rWZSiWC8u
	fWUzv07sylGJZDnxviWlWhD73Uzro0KC6FIGn7n9l0viXWPNoP8K2W1rmJbjxtqs
	M0KvIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0tyb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 08 Jul 2025 12:49:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cfb7ee97c5so23914285a.1
        for <phone-devel@vger.kernel.org>; Tue, 08 Jul 2025 05:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751978976; x=1752583776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8qpSE5Dp43vB7gI5CagfdGXu5JUEx9y9sp3Qv7cISc=;
        b=nxM9vJ1ypp9UoiizUGgdUirOrBt3bK4Awxuc1qzUCOf3IZ60jYITbsf6bS5PMCuwAe
         2DDBbHC097UsKKaAzJ1kcm6uhOdUt6TPv0lHYQBINCqVpGqnyyI4bzEJcor0dmh+1O18
         OhyTX3Bcw3NG1Vyj/MLGdMSpgGch1GlrneN7T0NnGvBNUYZG1IQfP5D+DnJdo6BCBXCC
         aN/vt+XsWYjeEXn4yEHVSBQR8thSlkX0tNPT05AX1HrL68OMdKegNWG5ckmKfu7+x+b4
         +3K/p5/X4kbDO9SuyviYoIdaB+1THdYpT+b7kspE6kplFcjwSMOd8sK1tF6AafAyEvkd
         XUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTnHnF3K4kDDMIbIjtvgDWDElc/vesIxkY8Ydt8P4ZdLAJZ7qJHezxaTmDOwPd8y+MFGy10rMnNc+WoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfumNLpzorKaZcTOVsC9VPX8BpkoBDGiQdWOquJ6rQOeaOPuTW
	lsB+4ANWGFjPmI/CaUmHE1f8bNTwk9NKz3CWDz6kt8QVUD3gp29sqaTusMTwP4iEElsFRV9Z2a2
	zmoijF/ZS8VSiE4SxBHO1eUgUWoul9mArvYKzT2lTIMOLgsZBiUv/CkGCpQxZkf+NUA==
X-Gm-Gg: ASbGncvDa3yp3C1vy67yqvsETO6Dy2jPPLlbvLUpwwtvaPm4je1ItyXcnRSDK022MXK
	6PzdehEYVjAdsrvTDZZXygvRIrD03zCvvS8/5or2KdUT+PCDkaJhW/BjeXL0kkWuEAligNuSLXN
	xc7/60YE9ozsfhCAvtOXYqaLoPYlU4HLM2vZI2dZ9o2D1hNNEt/gs1JyKejKemGD2C1xCn8YlVc
	2yzdUAugvkACnsbZML64q7TZOzGyEjHvALbmej39e4QKcIyUK6wMrM/FUxeHdZmxEPOvwTQ+jI1
	x7Bm1p9OdRroKE9LJEcKW+B8gVrai4+hJrU4hnMnThXpIOjLOTCXDlRTe7hofw3y0ekHu9JsL46
	klRc=
X-Received: by 2002:a05:620a:1917:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7d5ddb97e46mr895461585a.8.1751978976067;
        Tue, 08 Jul 2025 05:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI6CfY3miyqntHnZERAiMI/kNZtHr4A2Levt+Sm8OKvM/VpGtLtGOUwmLsoioV5Au5XaqNhA==
X-Received: by 2002:a05:620a:1917:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7d5ddb97e46mr895459885a.8.1751978975628;
        Tue, 08 Jul 2025 05:49:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae40eaef0a4sm684728966b.170.2025.07.08.05.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 05:49:35 -0700 (PDT)
Message-ID: <ffaa75f3-8b24-4e36-8632-62bcc47ed568@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 14:49:32 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: Add Milos interconnect
 provider driver
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250708-sm7635-icc-v2-0-e158dbadb29c@fairphone.com>
 <20250708-sm7635-icc-v2-2-e158dbadb29c@fairphone.com>
 <0a09fbc8-8835-4e94-862b-0baaea5ee251@oss.qualcomm.com>
 <DB6OK61BL9ZS.31XB5TN5YTX62@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB6OK61BL9ZS.31XB5TN5YTX62@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d13e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=mLgVev9gNyKCqetQLd4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwNSBTYWx0ZWRfXwIgPCGIWGIpQ
 jUnszZ8wp7fcfG0GgM97SCnlxBcnGYbdq4wff0/u9RRSTKYxSfln3fPvNqBkCucmfSHrYFDaeE9
 BIZvzk570TFhR80xLYfWECaEMN0JtULdb/g7XTLmPd+8G4GZ6bUMRJ6tjca+DWcC8EvPWWC2IXJ
 TwyECh2waAFk8l9Zhq7vcoK/XiN2Afx85JM3bYE6PMeaJmFOfAQWbmZjA8qyysT/qAqhdJQyRCD
 0t31imGkopWbdCrJb39EQ4cEMRjj1SeLWN9bMaqrsQ4tLrp3sOGbJ5M9zX/bLRXqfXlsVk2ikXj
 lGi7qpxgX0NhhxJQAwPeBrckwS7iWCU8JbAon0oYYszn7majn1V411KWzaPk1YBkL0e55svmudU
 Y52FxKym/wCnb4S3ZzDqAdP9J8FQVOLDJWKz3xgwZfx8BeUZza9zumDCWKtz4//VL/PWX3Ap
X-Proofpoint-GUID: Cs2qBT26ytfz_L3irpHLK66WXTJ6Vvrl
X-Proofpoint-ORIG-GUID: Cs2qBT26ytfz_L3irpHLK66WXTJ6Vvrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080105

On 7/8/25 2:42 PM, Luca Weiss wrote:
> On Tue Jul 8, 2025 at 1:30 PM CEST, Konrad Dybcio wrote:
>> On 7/8/25 12:20 PM, Luca Weiss wrote:
>>> Add driver for the Qualcomm interconnect buses found in Milos based
>>> platforms. The topology consists of several NoCs that are controlled by
>>> a remote processor that collects the aggregated bandwidth for each
>>> master-slave pairs.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> [...]
>>
>>> +static struct qcom_icc_bcm * const aggre1_noc_bcms[] = {
>>> +};
>>
>> You can remove the empty bcm arrays and .(num_)bcms assignments
>> for them
> 
> Sure!
> 
>>
>> [...]
>>
>>> +static const struct of_device_id qnoc_of_match[] = {
>>> +	{ .compatible = "qcom,milos-aggre1-noc", .data = &milos_aggre1_noc},
>>> +	{ .compatible = "qcom,milos-aggre2-noc", .data = &milos_aggre2_noc},
>>> +	{ .compatible = "qcom,milos-clk-virt", .data = &milos_clk_virt},
>>> +	{ .compatible = "qcom,milos-cnoc-cfg", .data = &milos_cnoc_cfg},
>>> +	{ .compatible = "qcom,milos-cnoc-main", .data = &milos_cnoc_main},
>>> +	{ .compatible = "qcom,milos-gem-noc", .data = &milos_gem_noc},
>>> +	{ .compatible = "qcom,milos-lpass-ag-noc", .data = &milos_lpass_ag_noc},
>>> +	{ .compatible = "qcom,milos-mc-virt", .data = &milos_mc_virt},
>>> +	{ .compatible = "qcom,milos-mmss-noc", .data = &milos_mmss_noc},
>>> +	{ .compatible = "qcom,milos-nsp-noc", .data = &milos_nsp_noc},
>>> +	{ .compatible = "qcom,milos-pcie-anoc", .data = &milos_pcie_anoc},
>>> +	{ .compatible = "qcom,milos-system-noc", .data = &milos_system_noc},
>>> +	{ }
>>
>> a space before '}' would be neat
> 
> There is a space :)

Alright, before all the ones that clash with a letter ;)

> 
>>
>> Konrad
>>
>>> +};
>>> +MODULE_DEVICE_TABLE(of, qnoc_of_match);
>>> +
>>> +static struct platform_driver qnoc_driver = {
>>> +	.probe = qcom_icc_rpmh_probe,
>>> +	.remove = qcom_icc_rpmh_remove,
>>> +	.driver = {
>>> +		.name = "qnoc-milos",
>>> +		.of_match_table = qnoc_of_match,
>>> +		.sync_state = icc_sync_state,
>>
>> Are there any issues with sync_state? (hopefully not)
> 
> Don't think so, I don't see any sync_state pending warnings in dmesg so
> I assume it's 'synced'? Anything I should look out for in particular?

Boot failures.. stemming from not describing resources for peripherals
that use them. But if you're not seeing any, that's fabulous.

> 
> Also since it looks like I'll anyways send a v3, I've already ported the
> QoS settings, and don't think I'm seeing any issues booting up with
> that. So I'll include it with v3.

Great, thank you

Konrad
