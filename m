Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9BB38A9A5
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296448; cv=none; b=sP1V0qgXD3vmlIfW3Q22ueK4JN3YsGwdzjn7VKH9pRgRGIweqKsUm3drCEW0Yay9kdXanuD6poQqHFsdxH/gtZ1nPIeZiZOXLUEVxkGIbjmpB3tAVmODoGS2PSnYVmKvkAuXOM2GLCVeNbww5VSIh/wgMxkvLxX0iurUaTohR+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296448; c=relaxed/simple;
	bh=Fz3cR76+MaQp/XIhDc9c1VZP14LpV9CinThbODOLIbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRm/R51XdjFJ18iSVZRNmYteKPPD8QWar3GpbrcbhjiSKwh745zgHcCRqAws9iyTqMdkum5JOt68hoMb26cN+ZO7KZgzjDj3OqRi15N6NI9+y5MDmC0Pvktacz14uC0cGXTf5w+/zSLZUzJmFdDMyxaGWyRktPlhDpmhfH0c+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfuRzeAn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQaGfADS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfuRzeAn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQaGfADS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5aod73636908
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nl15lCV8+GTtshqVfCCdKPL5mfcUQeG7WRkEgB05pqc=; b=SfuRzeAnhaBhpHwt
	QGX7M2WiauFLwmlpcawn0szGh28DJC9ORgnPNXr0xWVlCwlz1bEPFK3ALJVaUjnA
	otJX7Kf58xcl7T5+hPuyNNirAZi8L6HOtegrxGBgVebf0BzNampHT/6UzbvpvDLu
	+LyA9B7LbXpEtF2W22cn6okBP087PwqXtj6GxbdeWtJ3jpEnrE17iqgyi6AM5MML
	isPNdaSGLVU3nWh5u8Kl2Zza8gqQUGDK5sLyTmy34V0UVqlOjULeCYJ1WmFpLjht
	wJJN33dZm3Y69jgrL3Y90Ko/AzormH4Z4sMpozC225iOziob7OVyfoiU0//Z8BIK
	8hlbFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c0prb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:27:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-501423e1faaso222101cf.0
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296437; x=1768901237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nl15lCV8+GTtshqVfCCdKPL5mfcUQeG7WRkEgB05pqc=;
        b=JQaGfADSk5ZTNG9lYpDs/meeHDZpTlrHTNfy9MhJlQFL0lO/w9TzHdZFk1oCgmzwtm
         qrArqUzbl0BbEIW79iPe2cyWNhcdNKPfIfCLCSS+ynJN2dkS1PZcK9FgbpNA7RCVRruk
         Q+/+h/LS0KfMpf7hsqbFIF5dqWWhJW5t1JZPK2niMNjk7RR2k6UqbyAY2s8LVGuaCg0z
         59SU6DWBF/NDmWDK+oHLGHYHni4lBda/kw1pbtjkqsDhg7M6pd94P2hnVpMVYtXDFVzJ
         aaYX9CRGDQEq9mIqWLrWcN4SgOyATGZpNb7sb4DEgyI8osFpm1pmsmR4u/AGwTnlfdW5
         NAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296437; x=1768901237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nl15lCV8+GTtshqVfCCdKPL5mfcUQeG7WRkEgB05pqc=;
        b=v8P+P/XAR27nYGkRQO1e0QMp3df7GyiR1/A8/o2LZMUG0LfvNA5UjKF7jLNJiIadvm
         mkdZk9uVFhSkjfM0qQRfrHRZsx6G+tmo/RG6mJd/RjxVHJz28yQVMkJ/Tveg1JxVkcSj
         pwMqyJ3IJLf6HBDyE93sAhC8Awr6O4oUN1nKduvc1wRMdLbi2V1PD5Lp7QermN26JW7i
         7cGBIVx3BimbhgggshJGaIQuTttzDZvXBe3kBigGy5B372YOF8Bip70Dr0/t349M6Hgb
         3+4NGpyd2hlWxhsD+ndsC52lWfv4ytE+3LLSRYumd8e5RtHLznlM85MzCfMXT8kL3VBl
         cxkw==
X-Forwarded-Encrypted: i=1; AJvYcCX0VFOYCj+9Nq0JbdQB34WoD6ZoG5j/OlYhtPW5tkQvAquKVKK+DM+1Xm5nQvgFFGLrloujv7/5Eh34Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMrNvBCnNFx/rODMlKUbSZZh79dPysUhDgvAidzs+imQXkV9O1
	D2wZMOOapZnBva9Asr6to1rhs9RLcX0y9L3lWXLw1HjRYtv8lOHAMPLK1OMX99Ejz3fHuyjmEyy
	ekyr4R7u3PWuGS3/B7ApznKwGdXm9D7Kat1w3vCqR+PhpFasdIud00wGgqfFx3Rw/Xw==
X-Gm-Gg: AY/fxX4BAI+QzVF9zIkmGuVe7esWZpFgJBeu8k+XajbmZIJO5yLINBDvpfxNmgkddIC
	VdQijETRs3/eQeNtbGvgDPOpKKqOY02z+qUqIMgxsanM8SWcSpwPavE+Me+fWq3wB5lN825pB8M
	8pgKnctiyO3Ojcustpke88/bYWp+MUCqIMWTROVcBL0qlp8b62ozbJ8pXrM6WzwSGrp5VqbGGFr
	X3ztLauwlG4+45hXhr2cmTjkK65uOY2afb+S4orjVr/NZ/mfKzJcAxrTfEnOQjzlPn+1+zcosk+
	/zsqaZwqFRn9ZRZRMUjAO1STEcr9+vN2IBt6HMQkEvYFlPWDlG/4OYMcZXyD9yP9zN84hMOrX+h
	6mIoh8HswZowsAUl6mUz2jKH8K8l+xDUOKhJg2mpyuYbXNbtXUfB9DKIJa0E2x8yDC5Y=
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ffb490058amr225480751cf.5.1768296437228;
        Tue, 13 Jan 2026 01:27:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnlMTzNrNhcfpXiQVSIw1kY27USHt4pc+MMDCbypU4h5Ch0yyRWR5bQ0m9fiujeiYQv8MIfw==
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ffb490058amr225480601cf.5.1768296436809;
        Tue, 13 Jan 2026 01:27:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b873051cc88sm286593566b.7.2026.01.13.01.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:27:16 -0800 (PST)
Message-ID: <6a4f7953-1db7-446d-ac2a-0870f4f3a260@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:27:13 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] needsreview! arm64: dts: qcom: sdm845: Add missing MDSS
 reset
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OSBTYWx0ZWRfXxdtiBRB805X4
 GBiKEVYsNuxvz1Ehuy8JjuC3Uqira3+3081Bo50YmDCVnHU6lvDMgV/nm6nWSGw47Go4Br6GwYJ
 q1GK1udQyV4XwFjpZknX/IXl63EyA4zf08bHQpkLwdu2bXSDQDmoRnSx8TbveOcOJwTKYUWPaJC
 jmghkTlYbP45aax/szD4p/L2YfwkIM6+z0ro4fl52oqCoGg/sufAmdvGL5liCMPB8REH+x8wUeh
 UkJaYMWkeWQ3VGwc2j/0WRDox0oV9t5ezrM3qioEJNUqKT5G/FCbsuZbcpmlyLkFwzmzc6adSYJ
 NprPxTHpFbH4+cOmkDHlzaJYPrxNZcMHIxzWi0JckowuJD333zNT3fguUvKwEe2yibgZsiWwYzc
 hpsTbZOUoJxhKtml8TaYqQZCdQxWvhktJqNdui5i3An3MWe9DNMfX1MiUeYODiF4i9Fjyx8C5pQ
 M2yxNq6tPyVJhr6XRxA==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69660ff6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9UNV2iuIHs_NaximHYUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -VBH4K0lolZO99oWYzpshiHUzRhreAcB
X-Proofpoint-ORIG-GUID: -VBH4K0lolZO99oWYzpshiHUzRhreAcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130079

On 1/12/26 1:33 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> If the OS does not support recovering the state left by the
> bootloader it needs a way to reset display hardware, so that it can
> start from a clean state. Add a reference to the relevant reset.

This part is reasonable

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> It efficiently fixes nothing for us (at least what we're aware), so I
> assume the state left by bootloader is good enough
> 
> I sending this as a something "which seems right" and works for us in
> sdm845-next tree.

This part says "I am only doing this because cargo cult"..

Generally this patch looks good, because it describes a physical
connection on the SoC for the OS to consume..

Konrad
