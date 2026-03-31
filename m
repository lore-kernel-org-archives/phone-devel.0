Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7C3A7F54
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954690; cv=none; b=CYE6SUdwjRFt9Wgc3ynecINE9LHZC7AJL5/DEy/17+sbag7SDaiv794TrRc98lQzMmGUP8WW0k3wG8j+X9bMUJdWuru5dlRZin3bcprgeTvBuJzi5TKrhsjwDTQpaMe73yTNCewXlXYr4D6RDrcrH+APliX2GfN6gge7xm5NzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954690; c=relaxed/simple;
	bh=b7tq6DQtRCgmYUVhlKeubOo7PrQh/bCTQHPN69hYTiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1XxCWVX/+blyjjW2Sp8YOdSg5Q5FptLHZAEoXSo25bd8cVrIB4BPmGUYoLAj2sm0WfhoQJ/mCJYw+XKdIpnK4tBdd7Zacli6l9OC7lYDG4C9zi+Ki9QY4c0i6Fay8+lxr8Oh6ZBoOS41GffMTmgDjPzn1ETtrrlSkOYpr/TchM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQBPNlsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyYdPamW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQBPNlsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyYdPamW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V914a92761402
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=; b=AQBPNlsL+M17kdWU
	9OzHm5Su0mgOwcKoIkrtH8rVNDkcRrssNjnJrociLxXfN/H/1czPwNgO311hWLvN
	1Nm8PQivx9hTwJeuw1lQf6mfkYqpshrN0cjkAZNXBrubQVT6QsX9R8TnDsgic9mT
	LEf08m/+az/Ln0tv0yYdZ65vULyI4njrFGKyI1FSFAwZF717gy+QgbZBckUjyDQO
	Px6oY/t81Vkvow3fk/pHzmFdAZQYI3id1OD1TXIRDcfvBl5LMIY+sToONTKgR8HM
	ZiFhJFsizyaRdkdwiVLSpIIZeMQi/gnKBlYhjHRol9AUqxScFDLsjLKv4WXrGq2C
	rai+cg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930fbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 10:58:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c613194caso3984992b3a.1
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774954686; x=1775559486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=;
        b=JyYdPamWqtxT1POtV1ZYswnG47ohhvGMMLcZTneIUyd973fS5LB//wKrNd0iEiXRCA
         uLc4doG4QQ4oXLL0hUcDUSMORnzBb0iqHUuU0w/P3xl0xCTH7sCLcZIIKeic7cNXy6iE
         8RPcuKn4W0aoKrGuDJfPVYhGWwBD5CslHwrnc8Lkq4jDTGRwCRK8CWv+r4/Sqg/XldKj
         F7lBromm1OiZwLecCpqfcnSa2Zvj2vcZG0i+4SuQ0FEqlqwnxpgROQ3KcVAK5WKrllOM
         wHsSIHebXIgIaKvIc+gd0z7vxvF35WunYnt495bI2gns/rAX6EPo+XqVC8IyfoXe0u7t
         zTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954686; x=1775559486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=;
        b=is/3IL/ukZBlwihWbG0eWVkTm6w9SyZ/zW6jiveybsOdS9M3ku/qLqHnU9agFmXqIA
         QGlbscpdLawmNHx5DzmHtPZwGcYgJU6erY5Bd7tGd5pQhTocb85LuZAhD3kDPdQ0Z2MC
         PTLY5s6Oyg4ePjeXoPuHhq/XXWhhlX/CmCQnsdD+w3AbIdvp69wV5iczUbqxkMbWpRtN
         Ma5eAFrkeGItCTjpkjoA0CU21fbpTjrEVWZiMQ8i3sjQO4MTDAR82UACZJfnS90PNU2S
         rBswMf1oZdC3zq0n7u/RL+YA7HRsUNFYOlrca0zWOHfq4DRhYOl6VmNl+Qfg7QY7XCob
         hNtA==
X-Forwarded-Encrypted: i=1; AJvYcCU4RNr2IP2M6PsaduekXvVfUCEYVPz+ffSzN16JLI8/st/bMh7xITqEJIkz9gKXCeU7ZvsVQFYWQA4ZuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOVHXbXJPxKhyznrXaB5IQl0yCpjN5JkmwNM8naYYULsXwpy+f
	XnBt858juctVrnTzxzfg15WFltzX+V0faW3A06gU9s1EpKOxzfJy4s28dDu8TfiZAKrs94Ud8XQ
	coz5gfCNcvCTSbzjrP0DokZj3U0Ry3YB4T/L3lKUgKuWr1kIlE9PF6nIEFNDrZ2M3/w==
X-Gm-Gg: ATEYQzwn/cYdKKzyigSYzLkfM3Hmp79u91H1/pcgvw/072oggg1W+MgBroRtQ7qDlCA
	tg3ZSMlT95chbL1MJ+vncLGs1qFN6RQj3Jrp/Krb7FRqW1EeIydMr47kESu0qddPocUu8bncd9a
	Q/U6NMJi9ymzszwikGdiKdVvXT9YQ3l1vYMflL9X8kiToBfX3K1Nn3szSgM7gMIaKoqasQo9XOn
	upkHQuIpBk7b0JEdaYfDI5wDIEN3xDgHGVljuyVesEErCgury6G2ncKadU1dSIffDFEriyvrjpE
	QZv3lxyT426Pln3FmLlXT+tTbQz0uffcvlyegD4cTXwdqra3smnZqt9vzYfk5tL8RUd/JoM0MRN
	HFcCGp+5BJ+iq5gVbmqDeJk4+0pvyah5KCZXdXXgpslXeUVTZrbwZjw==
X-Received: by 2002:a05:6a00:2e27:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82c95c27e6amr14264823b3a.4.1774954686355;
        Tue, 31 Mar 2026 03:58:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e27:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82c95c27e6amr14264787b3a.4.1774954685820;
        Tue, 31 Mar 2026 03:58:05 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86286dbsm10214104b3a.56.2026.03.31.03.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:58:05 -0700 (PDT)
Message-ID: <5409e13e-280c-47b6-a29f-351cb609bc6f@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 16:27:59 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Alexander Koskovich <akoskovich@pm.me>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
 <gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwNSBTYWx0ZWRfXwwSgU4asLykP
 hDhxMTQctjGHv0V+eli7GMhalTZwWHtfCpLqsGu172/SOT9eAJf6LuN4ESiiFT9Y06DIBf/tpYD
 RewHWlfcGPqmqzoYCReTwjUHBblhsVt0zDnWx2nXSmZAdLEcJgeSvcMiZrx5u7yM+yRxqyh1uEB
 QoySBu+zoBjFN3fUu2AneYC3x8TDYycS0on0/BTmOLT7ktN2IF920qex8Z9Z24LPkKXGE2sNgPN
 nPzO8aXd8LprGsnfwfe2hXfpNqwYeQI8BhfTa6YtvFHxmXwWMv27HzTjlx5TYgwXvTJIdLYL40P
 l+8m0P8egHSTP5yPg2ezFDlPIq7BTBxcInzQvwMpm5lzbwsiJ8bh31LhFYKEwIuBTvnyAcO3tLk
 CS24RAAeBX+X9E/0czMCeGUJH1TnjrVfZLYC8cCzXdNK+dahqIc/ZfBlPWsIXk81iNekyNfUAPO
 9zLDK+vclhBxP6s8SfA==
X-Proofpoint-ORIG-GUID: -qXScly3sBJ7SsRs_NsGYc5w14U8-4Xc
X-Proofpoint-GUID: -qXScly3sBJ7SsRs_NsGYc5w14U8-4Xc
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cba8bf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=6H0WHjuAAAAA:8
 a=d5075zjUzbg6PSGir3kA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310105



On 3/31/2026 8:07 AM, Alexander Koskovich wrote:
> On Friday, March 6th, 2026 at 8:56 AM, Luca Weiss <luca.weiss@fairphone.com> wrote:
> 
>> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
>> clocks for the GPU subsystem on GX power domain. The GX clock controller
>> driver manages only the GX GDSC and the rest of the resources of the
>> controller are managed by the firmware.
>>
>> We can use the existing kaanapali driver for Milos as well since the
>> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
>> configuration.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/clk/qcom/Makefile             | 2 +-
>>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 90ea21c3b7cf..155830140d26 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
>> -obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
>> +obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
>>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
>>  obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
>> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
>> index 3ee512f34967..d3899420d6f2 100644
>> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
>> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
>> @@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
>>  	{ .compatible = "qcom,glymur-gxclkctl" },
>>  	{ .compatible = "qcom,kaanapali-gxclkctl" },
>> +	{ .compatible = "qcom,milos-gxclkctl" },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
>>
>> --
>> 2.53.0
>>
> 
> Was running into gx_clkctl_gx_gdsc being stuck on when GPU was doing runtime pm
> and it seems like this GDSC requires GPU_CC_GX_AHB_FF_CLK to be enabled. Though
> it is already in gpu_cc_milos_critical_cbcrs, the GMU firmware appears to be
> disabling it.
> 
> Relevant downstream change:
> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/3c1f31518edb7b094b9b9285287ba49a5c9196d8
> 

Hi Alexander,

This change was introduced as a temporary placeholder specific to downstream GPU SW & GPUCC code,
to unblock the gx gdsc warnings observed during system resume. But it is not the final
implementation and change was reverted later in below commit:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/11bd8d8d6f654cf156bb4fbbfe6587e0c41adc2b
 
But you are right, gpu_cc_gx_ahb_ff_clk is indeed required for GX GDSC register access. And the
actual requirement is linux GMU driver should disable the GX GDSC only in GMU recovery use case
at which point the necessary clock will already be enabled by firmware. In all other cases, the
GX GDSC should never be enabled/disabled from linux.
 
In the upstream implementation of GMU driver, the GX GDSC is being enabled/disabled in every runtime
resume/suspend of GMU driver which is leading to these GX GDSC warnings.  Milos GPU architecture is
similar to that of Pakala and similar GX GDSC warnings were reported on Pakala already[1].
Discussions are in progress with internal GPU SW team to see if GX GDSC can be handled gracefully
only during GMU recovery use case and not control it in other scenarios, to avoid this issue and
without impacting any other GPU use cases.
 
[1]: https://lore.kernel.org/all/CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com/

Thanks,
Jagadeesh

>>
>>
> 

