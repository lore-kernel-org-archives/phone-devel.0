Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A03090CC
	for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395181; cv=none; b=C98sQskYonV0TQnqRvBH2d4R7Jz4SHB5FJlgtg1T1o/15i7lQJwGqENLjlZAInfbE2kyqQRqYSuyPl4KC0lly04k3SAZAZWXa7l4cJsO01cv4Kvxdk8hAHC64yGKPSGq0uQwKHyFyIfSRBNyz625qGuB/tsdLwBftFhC1UN9VzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395181; c=relaxed/simple;
	bh=yeCo+Ke5FI00/Hv764e6wUwZZyK66elwU2B70cD3CRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQsZ8g+EKGCgkBN8eSnHLyUrl4pMrDxAtzLUeVsc+HQX4mWPdSqq0jMdDTIgmbPq+9tsiB9yHXmodKo8pMD1PjPNUQAkT6xDhb/v7cxsVar9QerkdorU7mJ1UZG+nOWny5VxGYgvsjnN5pcRb22+NO3+B/kUdZaKMxMpIylDbRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSaJ5ahw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPy+rccr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSaJ5ahw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPy+rccr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8JbDm3855915
	for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=; b=VSaJ5ahweJLzr49j
	8JsM76SNDh7vetFymmgYpCl7nCFhyrhe81FPg/ljk10GAchrPbnVjASt7jh5HcBO
	KTFkJ//NgqUDoDexPO+CRjfPA80MCurqMvLbvnJMBF0tAB85hhmrEG5NDyCdFfl9
	AW+AQ0sJV2OUXSyg7oZKf1tfuCp6sXSenw6JfvGWmEcbbTFGndjuq3bSb+k3BLGC
	buqJ0v7YnYjmQJviyhlInKvJ4vcKubECyC2NuPDA4XcgEqjPup36Cw079L1yUUCs
	LPzYG2P6afVg7RZsz7lNoDDN+QcKvb5zaQdBzlLBfCrgNk5Bbr/HEBR60xus65oo
	EZmNmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mry4drn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 09:19:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso12253281cf.3
        for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 01:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766395178; x=1766999978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=;
        b=QPy+rccr6H4n2cXXo+3UOPpttCJczrbYwoem0O4L3miL/X4PlKqT+VNzA727ZACyBN
         F+DR6UDIbDNB14qBG4ZKqnWnhLWv6B/h1AE1h2LSPlKduoNc8oVENWBt9QtucrBdhiC8
         idWXOcQGeCkdeZNO7UP1wdo6taortHkaO9qfjFL91kxhGCUXvH11VygUyZZI9pzPCziS
         XSYXvULnkNP8aHeo9C9MJK2DmyxaLL7HuZA+oB2asGKz/SMau90zB1yT5w//v7Jk7Csr
         LuCqLefilg9TnHb6hzF1H+fd4WLm9FDRwK1dG0xExlGUJQUiVsOarkswk62iMBwX/fLu
         V1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395178; x=1766999978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=;
        b=OqQLiRPoYJ/Sq9oVtc/SEalGxC670V/TB9w0Tjg8ggsRSkbIEpSu7OHeR/e0greKpN
         qINrAdkEpKAi7HAAOrgx2O/6VG+OaOksEngceDWDWw2wyFDEAAgAXFPgjpvMu3i8Ph5Z
         lT1iQjgi6UHfvCUn4H74lWph+TXYwPe2c5ICWKYJSOdDhFpjtUYZOQbKxGVwAhpZAhI2
         Nmx/8zAUiPBmI/FS87+5jgTd0Lz2/qvdFzG0toa0ZybFiADi8/eCGyX/xNeVR0oew1Ww
         7yPiWiobApyVeCmOxwtbH4izhLjteALjn0tsaNvyQ20KS59NvThsnf+P8Zw7eysRNPSJ
         zT7g==
X-Forwarded-Encrypted: i=1; AJvYcCWbEI749nNca1qwoakm3o+gwpO3qm4zRI8hYboi4eoa4nXDTxNNvM2io+Qqhr+Aseoshzyx2VyFXNkW/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+RgxWQJTY0JcT6D2MMSB80Y577uC+m9ZqsfJbfl3F7EIwg996
	CN1O+X1WbPsJStfyyZYtQ4kIaiaoG87Z0e/PWhJsPVyRDUMGIOEi/bHUnUk8UHzs0QAWL505d+5
	UHYRtzeORCiB3qHNze0mw55wjDiKaVMW71jxU6QAk8yB5xhif5llcjD/iEu8H92dubg==
X-Gm-Gg: AY/fxX6qIHgrS93OCuwJ3GujEjcuSXMQiAFFmiEn8G48eAM/AebCeB9ewb9mzSjek6j
	N+gJRTDu5QZ9zPJMMyQAPoA56wjcqFkmn15pXmM0OjtGGFl9FGscmJBBG/fXSEBHHAyZ8UQNesP
	YScXvZDhZx7vbtTYk3DgkFvWA0PBQs4MJ69BhMlVRwpoPtBokzZvS4zro9q8bbu8fdCtcgK5+ec
	qQJiR8RQZLlMZCnfi8HHLgL1lWidTMMQAQgoTnzDcHLURoisd+J9DoXH+3QhuZSc4Cb1pwMfOvR
	UOuDWW6d/NBP39qFSk+/wIJk2OvKgSpqNY4tL7qjbbk2yEmWqWDKMttgQt/BOH161+rNXP5EFPm
	UyvB7m0VGN5dA7HSemNivUePq7X7oDLQXL49GFLNQSjGdrFph9Cj7nWx0Jqv+AZxnRQ==
X-Received: by 2002:a05:622a:1a9c:b0:4f1:96c5:eb29 with SMTP id d75a77b69052e-4f4abda6096mr112333721cf.6.1766395177753;
        Mon, 22 Dec 2025 01:19:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/2bnxdFBb/MQ/yS64tXg26YmjXwktYKlnrn7DI0rW66afHwTFNAr7ud/crT5sTAXD2eDuHA==
X-Received: by 2002:a05:622a:1a9c:b0:4f1:96c5:eb29 with SMTP id d75a77b69052e-4f4abda6096mr112333571cf.6.1766395177216;
        Mon, 22 Dec 2025 01:19:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9ef904bcsm9089567a12.22.2025.12.22.01.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:19:36 -0800 (PST)
Message-ID: <c6d9c05d-3c34-4d69-bb23-9c761858a2f6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:19:33 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
 <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
 <2f3c7bc8-8c7b-4c47-95de-7a8ac6dc3c57@oss.qualcomm.com>
 <9965e114-43c4-4470-992c-1051ff1b7f36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9965e114-43c4-4470-992c-1051ff1b7f36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cbbfb3DM c=1 sm=1 tr=0 ts=69490d2a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=lWcTiWiVgQmTcaRhBa8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfXynPTtTHc8yTh
 a8ZNP0FlJlmSTpBze9JkowWQDa8wYzTnoFTNzvQWfR/QMOS+5P0O1k+jwjPq2KGfsArAZZtW445
 QZCTrfnLhq8J8oSKbqWInTJmFZ1WoXtagXE6JcQGvwLdonBVoFbqRyhqFh6kICMOBw40QaCaaQf
 xmpTEADgg60HBNctN2g19UvXNKgv+B3QAgFnUBmKNx2hcotK1DYriVDAuwjfUvzR3DbRea0Nm3v
 KIZ2I+mhB4tMZxq+6LAIwQ/r58RDJoIpFHuFkDKWdTF99CvCJMU4zQVA84Zk20JwNJcqaXbB6wS
 YUdrRp1JhCBC3EtD986PapB2eJDG/CETp0CZ2MxPI8/OztDdRrVXiFTyKIUoVOPCI/bGELApXKj
 7nJC7HFmNtaGv3IRKFE2QO6KAV+Zep7SL+j+UMCz2Q59bWDQzPNjXWkzVXsUdIvizRUyyZrBkgg
 +XfeC5wcKo+3pcGxqMQ==
X-Proofpoint-GUID: -jN6yjJXdp8zQ6sIY7DDS5lTM4NxUnfO
X-Proofpoint-ORIG-GUID: -jN6yjJXdp8zQ6sIY7DDS5lTM4NxUnfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083

On 12/22/25 10:12 AM, Dmitry Baryshkov wrote:
> On 22/12/2025 11:09, Konrad Dybcio wrote:
>> On 12/20/25 5:52 PM, Dmitry Baryshkov wrote:
>>> On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
>>>> Add support for MDSS on Milos.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>> Though 14000 seems lower than the value for all other platforms.
>>
>> IIUC it's essentially "nonzero" or "first-level-above-just-nonzero"
>>
>> The downstream DT also defines a 140_000 and a 310_000 point.. though
>> the middle one is never(?) used and the latter one is only used during
>> UEFI handoff and upon the first commit after (runtime) resume
> 
> If I remember correctly, those are also used for programming the LUTs or other big tables into the hardware.

FWIW this is an interconnect path for non-DMA accesses so that only
makes sense - huge writes could overwhelm the bus

Konrad
