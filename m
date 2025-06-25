Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6878F54
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861239; cv=none; b=oAbl5NoTQZkj08JZlllJz3liZekKDE452BIyF6FSXGeM1qRyDUM9x2krpaupq8na5yhYkVeuzlmq/JqbK5K3OgHJu5FbSe82UJhAQK88SfIjR9KRDd/Hhyi3y2Ac9jIuAK5A3KSR6OLTb85/9GvOVCEDon4Mv4i/AZ9hwf4ryzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861239; c=relaxed/simple;
	bh=IX8IaLLBnV9g5/7hPrzkuQaSZUqxCxGVjz89dzM3wTM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XcGToHetjUplceG3QZU5Ik1YZblOQUPvBPSV6P374u4zuKc9UN0G8MsgD7yUuvZRPHKY0o+f3SE3sktNnXn/5rT4O7gHHkwURiazARhoj+CoiVwG90Tc0URtVVkC6bCcwv7SHkDI6sKkYvly2jKqhVEQASrwB3YIsso8W7gY+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lo11exSa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lo11exSa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBgS4U020695
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hw1xBrAtM4Jso28awVzsgXTidcI+QFA8inWaDXtxLIQ=; b=Lo11exSavx8WkwvJ
	Yu/eEOo/18a6VbBNyjft8DbbujY8vPooLiTD40Mxq1dZcqOIblu10zSMk1kn9V2g
	nmx0LcLHHDmVgJ/CgywmrqGq89dlP8Qqjxhvc12zgBUQId97f2IYOm1ZBHTn/9h0
	7wLO5uUXr4I3XLjRouXfYeXZtxZWOm/yawkO37zIEXTwwBnbal+c6mw3advxHzSK
	pCp51tc3++hk988ja/7fAvCpjEKmTPyuD13+g6L5UjEAbV8BEmKBaX+rlsbY5ia3
	ftbpYRO1mG9qf8zuwGwSZoQl9UTBMQ8NhNA6hIk0N2AqyGUrAaXzBLOG1LInU5Cv
	bptfqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26ad1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:20:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d094e04aa4so196502385a.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 07:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861226; x=1751466026;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hw1xBrAtM4Jso28awVzsgXTidcI+QFA8inWaDXtxLIQ=;
        b=EgkCID1r0M/3q3xoT0vdCi13goV6ZS8HhOFl2ufW0Va5BjO/Jc5hJfJdRxU609fDa0
         nkGdQmLFvKcJfcaneT6VCdqpHQnIVDOUC85UxVLXAQuzFajjDg4F81Bjyt+S7YOxGd4J
         WgrHP7FMiyTT2OWLPX7zm5AaEvVasSvIwSdkddRBMRG8HSLmeN3ETtGKIcMuWV9dmq9O
         udyVGzEWbdepEZiu/LopxM0vw1pfUeahL48rzNE/XWWdU75JyNX1kUHmPDHKtRTEZk5b
         1HMuKPXo5qEGvIQdFoRx/1jdvVsN2GvuZhc70KR3P6aIv59rhx/0eXi5yghFPomhj9+3
         /QnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIHDPc529N9pvSn8DftIpWXfV4b1M0YkAnRzoL3nXWG8e/SyWzTFuTS/CCznIYvhJ5WI23UFZlDzhcnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rmF1QQiiJR3l0GsSfq13NOOu3UXYYYzISdCElQnLBaNvK8ls
	dT7FbSr+aKobh803rGnmi5EjvQaUGinhRVGB/k+Vr6pYnV4SpKrNOaKl0skMs9nDY9GUbfspIh1
	ixdqKzF05/6PNHTjRKzH+57egNyH8dWSlHGw//LFYCMac96xZ/x6NJReVLi/nA8Uung==
X-Gm-Gg: ASbGnctTQ2hE2R5/t9K/oEHnJ+s0unphKhYOQi52j8CHvQg06w4vq4bDmWVMVJbRqkN
	L5MPXB/qfXjGd0hBIBE5MJP72M8+x7P2P0cIuQrhIUTh+LB42o+3EHqIKqzv54X8YEC9yLNbdXf
	pNgSbYh2siTmpCrV8e+crFlawHGUFZryk55TxFr2lYD1lHpbhU/kTUKi7fO3Dn6+6DS+ZBDvzGv
	Cbvem9ZU1lBtFW1xUmvN8dbou45lRleFJmnyYxqe1bxcKADCkFzacq3ry/tHgz1Loz9RcI9BHS8
	ZBBUcksuCzDevNWZOunvl93XvtJaIOc803OLKtiVQE0X4o1DAuagMzPYHFEWIQQFMbjE5nmYVZg
	PrWA=
X-Received: by 2002:a05:620a:24cf:b0:7d4:289c:884f with SMTP id af79cd13be357-7d4296899bdmr175664185a.1.1750861226593;
        Wed, 25 Jun 2025 07:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcPG5c6FU6ZG+efM90I/kQ/p8jv4tpnX+CiGYwW0+TF/XyKO2wUFOFtKbHLtVfRKzlqQtqQA==
X-Received: by 2002:a05:620a:24cf:b0:7d4:289c:884f with SMTP id af79cd13be357-7d4296899bdmr175660485a.1.1750861225838;
        Wed, 25 Jun 2025 07:20:25 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a67a80a5sm331473366b.26.2025.06.25.07.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:20:24 -0700 (PDT)
Message-ID: <23ae6ddb-682a-4c4a-bd63-f0a1adb6f4f8@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:20:21 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
 <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNCBTYWx0ZWRfX0yJFlQSaMx0x
 HgZrJ7rJnMe91Wi3czg4m+9aWv2sjbdCN9GOto/L0HKQxw8pu27EOSKIs3DIjLCXjCD8i93NKFv
 D3BMUmAc6doVXHMC67qgKj4KngrDm/yVFR9Yr36BCaePF4Lrc5Lqsx+CbYEDPfp3s9dxkclOC0V
 UYRCZvmdQdmya7XZ1sbojWYI5RHFaqxb6RwPv9lbMSddmLi4nWSs9+IOeKyP43MdYlXEHcMsF/a
 OZ7sNnxp7e80KEUWyDobyJSSx4StAkDfYgBp1MTiiablQSTIgKTzZLZRCrnjHFlbQjSgoxBPBsU
 hqen630JBEJaUmH7QiuHj/1gypTqS9kGbERD50oLkAk/fQiuiEt5FnUVGbTS1Tun5sYrKeqNvmw
 0kBYPW+TcaQvER0qNDdppby9XI5LvY9rfLmpuVQBhsQO+lZSDCaaiqoVTHzCipseLTUb6aNz
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c05ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=3wOqg-wJ11FJ_073BQQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 6ABreav40LLxFr5rk-_5YLc2GY3LMMHJ
X-Proofpoint-ORIG-GUID: 6ABreav40LLxFr5rk-_5YLc2GY3LMMHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=974 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250104

On 6/25/25 4:10 PM, Konrad Dybcio wrote:
> On 6/25/25 11:18 AM, Luca Weiss wrote:
>> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
>> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
>> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
>> LDO512 MV PMOS.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
> 
> FWIW everything you said in the commit message is correct, but I'm not
> 100% sure how to map these LDO types to the existing definitions

OK so found another page (also made sure that the supply maps are
indeed OK)

SMPS is OK
L1-L11 is OK
L14-23 is OK

L12/13 -> pmic5_pldo515_mv

so please update that and add:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
