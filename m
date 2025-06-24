Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A2520E005
	for <phone-devel@vger.kernel.org>; Tue, 24 Jun 2025 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799028; cv=none; b=G0P0j9LOd44s8ggPZO8RvrX3OUlhpinpjHZnC5tmx+H1POUg4NYD14ofSsUeCezV/iYkiiynZ7RklXn6ChQBHkGj3uec3S1oNuv2CtkVsUQ4mYkPMjO77AgjFXpXTVfTJg7pUUh4eXFLLELPMnEOQKfRtQiG6nxcHZZV/RVjwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799028; c=relaxed/simple;
	bh=kRy3R7VfGoc1bssAiwrUHSgpndwIcCOFEjYQX7QEk9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRy0qVuPYY67d7JGEs6f4MgnxyMFHgY+7qW0v5io0YgN3c3XJyNhuBM0vmNT6a7YckIjOUPUX2SQCkk0jLSM9tfuNVVq/khqXjY//gINJALaQw0AfVsULfZv1xP61zXgQVdTW3TB0TDyDXIGWF4UIYZkd/crXUrPB+mRb54gsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xle/3ZVb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xle/3ZVb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGhXNT014954
	for <phone-devel@vger.kernel.org>; Tue, 24 Jun 2025 21:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVJI6aOBGl4t4VmrNckaYkNqLm0/IYYdUwHHZ9TzyaQ=; b=Xle/3ZVbKSl5LU4M
	NV2lwkFhV3XkKoPWc3beKvEv09ETVlRI5aKyLx/HxgVDGiHRJqwwfGeX/8gi+cAF
	ZjCk6iLcelFOcSbr9WuliGdEsTxvg/gQxe5hnDeJB+riplD+KSHRisE7jcA4/j33
	WhW0C2JQEiaKHw4CEeqfzqjbALT3RRcKfQjxPHIOYX+WzJFyThBwcsP1/eDiwd1C
	ETBh5F853UjwHP16GZhTQDO/0pktcgmY8lD7i/Mgi73QOVXevmAaoK1KS8S3cttB
	3WeeQu4U+LNVEtxHfauN+NVJ852kzgURb1fhNHTUAYM4dk/IVCNXbljwh4nrjIeO
	TDaYwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpwvef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Jun 2025 21:03:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d413a10b4cso128459985a.1
        for <phone-devel@vger.kernel.org>; Tue, 24 Jun 2025 14:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799023; x=1751403823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVJI6aOBGl4t4VmrNckaYkNqLm0/IYYdUwHHZ9TzyaQ=;
        b=wKypTW4HDxFbX5r8sh2YmdkMCtfHOVm+qUnEe7ij9f0Qh8RsGVF1oMiS7IpZZ1NkG7
         r3onXjPe54r0LxANGnkUOtPPy42og5ssHDV7ZbssyI7auJGJwK8XSP0KKJrC7SeBWEAF
         w+haLNiU3IdeiEeK7bLvZxM9+ej7EcBjUzY/ebAGwxNkUK9EClb/tF+CbkNhRmFxfbWL
         ESZJJ1lA6WV8aAb8GGi/EiirQK0nTFLI2wIc8mTNFEyV6UEZP5nQBPILIYPmk1hkwrRa
         z10N8uL8cL6rcRPwI8OQXywwHOJRu4IIKcpuKFeeIJ21Q0m5JJ+H0x6e4uhq+C6Jkc27
         pLTA==
X-Forwarded-Encrypted: i=1; AJvYcCWf++qUqIZftv0XM6Yq5ljtTO4xHpvoFDHxg56NUgPG8LpSRuQUyPqCuSRigOQtTfruxt0iIwVw9RzYzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydtOCTU2h3Q8Go1ZMivVLbFDVVRsvnyE+DMiEz28cWeYA5wRkT
	zmMbAorDuburhZqJHLkKLLtrqEJzj4Cr+sc8kEKXmHezgBASLTg4qv3QaFacHgaDDvcZDLPdcvq
	pLdN7xzp2LkRNtPl6p6j5e5IZc8bJXGwuG5OHeOaoCbF0TTOOWvEYnm6wpqvmSYyyzg==
X-Gm-Gg: ASbGncuwIlnNIUSFRMO/ATv2QNvMcUjgqgtcYCCqlox3NNODju9C5eFHA0mU0z3aQMn
	fiGzHQ035u5PxBPKv8lBJ+ehLmdeXpwFl15on2fmp8ynmPuA+iUvrVOYTVNtFCoLq9/ywdW6hqs
	wvDHpSNTfY2SbtC6Q3yP8Ys1EBlkLP//fv3pyWgEzO4dqD8JzW+mWfGisuN4EmHzCp9Zg7S7VM2
	ptF9W8k1cPZFD7a5sCQ7MIdDgBJs0EXThba9C6iop291MVLymOzYG/1gI0O067vgPnSTEnoJcsU
	LikXJK8MSxf5jUvV72T43ulqN5sXrE2mVALgXa3O1H15//h8NUvjzVXY966ufNhptWBRwacuSc2
	2pSSXdT3R1DT3PT0Z5T/2d6JL
X-Received: by 2002:a05:620a:4053:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d42965f652mr79132785a.14.1750799023309;
        Tue, 24 Jun 2025 14:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdXH0d1f6aDkKnx6CCNg4hy12ddxcs0mjWOfhKxBZypB1VzHs0Gz8oM9mgx/g5oqmSwc4ULw==
X-Received: by 2002:a05:620a:4053:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d42965f652mr79129285a.14.1750799022848;
        Tue, 24 Jun 2025 14:03:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980f0800sm17872221fa.114.2025.06.24.14.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 14:03:41 -0700 (PDT)
Message-ID: <225b94a0-eea5-4061-aebd-da497d349527@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 00:03:40 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
 <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b12b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=6ZqSrkSmcNyY40qCGO8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE2NyBTYWx0ZWRfX8CnDcG1lmRCB
 oGTMV9G5VTPdswfe590xcUMP3kslymTCh/kFw6L5coveNlMxdbS73MmC+I9YHXAxUexAJQt4HSz
 6l+gbluNYMpYeak1LULLkE1pES7bfTWQdujeQ50Gi915T22i3fiMPaEShSzUHc1IFGuHfCqMVdk
 WE5dFPsIPNhDvkjcsyje3DPXSKucTH22OvT3J/5SUm3P0fU4VQ8sU1IVn6//gxkfYNqFAfVaeNL
 IpKptVf0LTTioPy+XGarKSMwAphpxR/uIQy0ADh4MUrf3SrQ1m3N8bX233zUBGO9zPXOEDYHgYB
 iHgJnwTiwdrolt2b17Xcwxuk8CHhm9B+lxDQqQhTfpsnTETGKZ/gEL9XQP4cPUt/Z8uquayUtwQ
 EsQdLsBJg00i0jOVMEzT8ccSzX7pU4XP0l9NI15KgGxfKoHA/x3sv+onOrRi3R7AAavUNr4t
X-Proofpoint-ORIG-GUID: YlkBWj6CudLMYIoN_OL2pDUzImcvTxgC
X-Proofpoint-GUID: YlkBWj6CudLMYIoN_OL2pDUzImcvTxgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240167

On 24/06/2025 21:46, Luca Weiss wrote:
> Hi Dmitry,
> 
> On 24-06-2025 2:59 a.m., Dmitry Baryshkov wrote:
>> On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
>>> Switch over the ADSP PIL to use power-domains instead of a regulator,
>>> and have one commit switching over the MSM8974 SoC plus all the devices
>>> to use power-domains.
>>>
>>> Note, that I'm aware that these changes are not backwards compatible and
>>> not really bisectable, but since it only affects the ADSP on these
>>
>> Why? The cx-supply is handled unconditionally. A single-domain usecase
>> is also handled via a special code path. I think this might be
>> backwards-compatible, by the pure luck.
> 
> Honestly I have not tried and not looked much. I mostly added this 
> paragraph to avoid the response that this change might break and is not 
> really backwards compatible. If it does (by accident) work with the 
> updated dts without the driver and the other way around, then even better.

I think it's worth checking that new kernel works with older DTS (that's 
the usual rule). The platform doesn't have many users upstream, but I 
think it has been used by some PmOS users, which might mean 
not-yet-upstreamed DT.

> 
> Regards
> Luca
> 
>>
>>> pretty old boards, I say it's fine to have this. Get all the patches
>>> into the same release (6.17?) and then we're good again.
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>> Luca Weiss (4):
>>>        dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as 
>>> power domain
>>>        remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
>>>        ARM: dts: qcom: msm8974: Sort header includes alphabetically
>>>        ARM: dts: qcom: msm8974: Start using rpmpd for power domains
>>>
>>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 18 ++------
>>>   .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
>>>   .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
>>>   .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
>>>   .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
>>>   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 +++++++++++ 
>>> +++++++++--
>>>   .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
>>>   arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
>>>   .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
>>>   .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
>>>   ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
>>>   drivers/remoteproc/qcom_q6v5_pas.c                 |  2 +-
>>>   12 files changed, 56 insertions(+), 114 deletions(-)
>>> ---
>>> base-commit: 7fa2fb97cd28e1d9670da538095565b6fba83977
>>> change-id: 20250621-msm8974-rpmpd-switch-b19b166c02be
>>>
>>> Best regards,
>>> -- 
>>> Luca Weiss <luca@lucaweiss.eu>
>>>
>>
> 


-- 
With best wishes
Dmitry
