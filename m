Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583532ABFF
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793655; cv=none; b=lBo0z3sVL55R1Pnn6RG7YxEPolvjxMTJWwg5qTwyI3HY+37gQZNDiFeB/gW/QW2xZvPt1D1AZjQCOWzI+UaIP55YawhiRwKkOOobHf9U1dJD0Q2OGJzm7JyZUxFArPWPTpTTdHELsegL/8+fg44+NbNboWjc0gXGl+cEQ0wm8Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793655; c=relaxed/simple;
	bh=VGE45WNxQDTO014blHHjIi5tZVWuHW3PG7dXHce6NLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpSHDkPDbRADsP81GgwJpBdLoSBd8w0l2VIIeTsLheIrwcK2yoABOKcMS1UpYCZL4bDbncln6Yuf5kVQh1iyYflr6WHBw1fC3eesfzt6CdTOCwuF5ZqY0/VJED7+JCfkl3iD/Y+jNnZp8+mjXAyiGQLxpbkBNaWEtiWM1wzZ93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWviJchN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReiK0p8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWviJchN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReiK0p8r"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079efrv2988464
	for <phone-devel@vger.kernel.org>; Wed, 7 Jan 2026 13:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgZSlnstuL+bWNOM3fLTFdzNQEvh4E0HKjNHVKtgJqc=; b=lWviJchNA/PsdJa2
	68HBFGAAEZATXJ31rW+2RG6l43QqyyRaxzF684XJltEXQSM/ozKObb9cw4aBVQpH
	aWTUCpkY7u9lVShSCiU8NyIbZtzl+Kb5NljkVbDKlx3x6xLL3ZME8NFKgL2XZNHz
	XWqL3dpqT74RhVzHVCJyvzBDMRPw2zZhrXr1qGLIPo04Htpt+kHmU7pzXK121ySt
	46ymjU6S0c79H1QjB4Qn33d/6CC1z1vlTugIxOV6l9O+WuApMaVjuEbkYi1VJN2d
	sLswJmRgRDpritd/ExnaDdVPkFVGh3WOHJxQD42tNFMuka43qg7ikNffbNf8XaD6
	YpCB/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2nrpq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 13:47:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so8360571cf.2
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 05:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767793652; x=1768398452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UgZSlnstuL+bWNOM3fLTFdzNQEvh4E0HKjNHVKtgJqc=;
        b=ReiK0p8rv6lbD4R1+H4CcSbkWKoBEZEQNOz7h5ZTQiuh41UBCPzS9p1/KiRx/nEar3
         KMwiGmXLRR5AC18mK8Osi3xUwh1sQkzaDYt5gmiHzb8MHg9lha0O+5uzRpaB8so5X8IZ
         XuLcD+UBFYXE96gjcxccFSkBd3Bd4m0t+Jd0mf/O+Um8w7lggIueVoOzug30GnCu4yfq
         XAWg7rIhP6sD1FFzau/xX9CIIr45q7SHRVyJ3nMsaYzq6CwjilW6TWIPwuTJY203MJth
         Tvw5aDOnNcOiLNYU50rjkwlTyQt0jcMNRJjMwPe6uWUj5IXKFQpKOb0Pi+AcDg+QtHQB
         9Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793652; x=1768398452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgZSlnstuL+bWNOM3fLTFdzNQEvh4E0HKjNHVKtgJqc=;
        b=RD5mQqM6ZZAbtHS/Y1nkHTGBQk48pmeWo8RBp99VdLKNYni4JOQxlsBuSWcIrNxSqd
         eU2XDz+4rDpAWpY+vQEGX+M7+9pHkblhfYmFx//Ej96A+QkKsQm+UsHG6XmA7SG7C/07
         5TJIYHw3jrRu7eJGitS6o8B7sxdCJS09szpz+HRwhJlx3g5ZZdNMMpI0VPrcQ5qb55+1
         pxmVWvStFMpde/8y37tGRwALV1QmEwUXO5HHefwcoPuyMfXCepA+2Y/Wk0WA621fJLUi
         ec8ur133EwnXeC73xC02jLbUdP8B8nBHXbWG8UODel4YVx9Ye9nj5zq4DEU7htknzxFm
         LvIw==
X-Forwarded-Encrypted: i=1; AJvYcCUW5+k4x3T9lxpwwHKKGWbZnCcnGbOsm3O2Z6hY/wwygPOjxNX1Mc0dG33V7tkjO073IBGogmhKvhBurQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZNX/n3+dlx6K+qoNhU8CbleO6vasph7PSZLY9IYN2QCd5Kek
	Ho9Edxq+N5+Bp+EZ05VeoK7WdjarqoIZs0ozl+d5EGvUPLeqgVE9u5cLPHjgbDS1f08uBJd4FEy
	MJd8Ni64xHcQ0t8dTR0hRrz4LaU25z6sdDU3n5EjLoeIeMMJIKY3Zo/KakzvvOimJRg==
X-Gm-Gg: AY/fxX4Rpw+BD3pN/ZbYUXF8MiBSZid7U1AnpmrGLL4EhxI/tzPlMaivC0Gvp/HQAT2
	DNkkFa46xufqnBw6U/8VfNxWvnOTQwwxyjcUbjVHyRDXbqHcUfaZbfuhllilrt9JqTeTD9bByZf
	YrqQBvqcESVsEwQwq+OkGC6ghtyrKUcbCXj6jZFKDrDD4lrKPOqKk3noOz49gv0lv7jGau5NuRs
	CwEUGxTYQXSs7me5XaTAqXqBqfTgVMuvpy4kCtwfdtl3RP9Nx/Oj1ulWZEwPbfpcYwksAA58awZ
	ijgqk1MV9VnDwdoxJtRC7IhY3wikVnYss+ZdHn7n2vF+49q+TPVL/JzRGAcXxAd0mzK1YYvck7v
	HTWaBdzEyZUFMPGFQ8+1UL4E/bFysC2TrXLiz81SrNwbfjRo7w0bWJFf5VbOnmvMfCZ0=
X-Received: by 2002:a05:622a:143:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4ffb49a0042mr24372141cf.6.1767793652378;
        Wed, 07 Jan 2026 05:47:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqSd85JPwhEJMYgx6YhAsjKJYD9xSuGfuAYyKuY5Za86pnaJzUy8cquRaa93zxCj87b0H2UA==
X-Received: by 2002:a05:622a:143:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4ffb49a0042mr24371741cf.6.1767793651855;
        Wed, 07 Jan 2026 05:47:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5e0sm4665696a12.31.2026.01.07.05.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:47:31 -0800 (PST)
Message-ID: <0b27c56c-3aac-4b26-80f5-f8cc52abb66d@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 14:47:26 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] phy: qcom-qmp-ufs: Add Milos support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMyBTYWx0ZWRfXwhaLBOk6QMs1
 xb46c5LbYwp4i6J9p7qfPzaVznT7NMSIcRXbcvzY3hxZO6K1TVIIFrq4z5G3qaJv0j+Sla+3mv9
 i//NARFJLemoHSQrkcTQmsmahJlub6Hmnig2Z9tsHy87bX8qDncdKpGAqWAEDmMtyJu+zlKnHmN
 arclf29MdmR1j02+U/qJKp03+Ywr/qe5ac1m14aE+2LE0iqnERm1a3OPXEVg0EXH3CB7MYApuvg
 21Ob5DClulTn0FJDoQ2LdTHAQ/THcRmiEA380ydRCH0vHSAnyEclOY7VOBZUi4sPpzhXf/XrPhX
 tDdZuyDNGhlUzEExaETmifFav/4tcRA7a+WzoJCOVfaF8iY2d1UMPYMzDqXwtfhVKzqalrSc8e6
 2ujDPUpDiZGoZjKhMRltyk9rnPJafoplAmVu21qVKH3lCQfHGOS8b8J3c/1fLfltqPwy8495VDf
 8Pp4xWtOJRO7CG9vFNA==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695e63f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=RTUAgidmgk2qeza8I2cA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: EHWIdl7jlT_cBgIzYCU7-A0eFcOhE4G5
X-Proofpoint-ORIG-GUID: EHWIdl7jlT_cBgIzYCU7-A0eFcOhE4G5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070103

On 1/7/26 9:05 AM, Luca Weiss wrote:
> Add the init sequence tables and config for the UFS QMP phy found in the
> Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Matches the latest hw team recommendations!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

