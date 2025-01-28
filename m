Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B731A0BD6
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063662; cv=none; b=KaQfcwt5lZMYmFWoTxzAfw6tC7oxmrxOzC6Iun/yeSYQvT9kGAN1cI5vdPjzp+mLfZGJpwEbffXejEoNof3hsq/cdTeoluIVKmlBpFd84jy+QQjagMyeg75JONUl6cm536U6R6ze8KpV/Lx/PKq1QMetMyxv6vh8uy+AgSGiSz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063662; c=relaxed/simple;
	bh=/pm8ioqQTAsLKFJ0NAnuIl+VlV5w4q5k/XCEV8mzdPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkAjkaK6q4b1kVAf40im7CtGKitH0MGCzF8CLwN7AD3A4nTnuux5Kkt9NMQkdWFjSRONuAhx61g+XtaDCcPG3j4i6L80Y8AkKAXHJnl2co92rb91dN0u+fvqkHjLvHl366Dhg0B2ryx8BaHJ0vp+0hOr/ls4VwXr+tKUvCEYrow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUufsLfK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUufsLfK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1g0Dn024402
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R90vpW1QnIfTNntQHdxQT53KbjZtsNo83kpO3djLgxY=; b=GUufsLfK/RWAtKDg
	k2ttQBiY+DfPMuBD0uwlq3NIbbyJxeSHbY2F9huofhBQt7GhlIaYpV3Ahb0R9ia5
	9FF5T5ytDbVqPrG75xm3YNIre8O9S3GoLigUJsKQz1NqAbweP2AJdjq0/zcbX2oB
	Lzt6kma/y8+7n9lzxe7HKKNJKJsu6n6OoODUKnEYrk2kDdySKMv5RjdQuwC/HtHD
	z6jLwctxddlzPHfXB9TKW7hPYjT56FDhm4vqUnanrBdTsBuYpm3VyjUM+7pxny8j
	XwDFRLJRz8rPrjRz9b1K7dYNyjKFD/Y/Qo/WBHaerBxYJfUDM5NrHS5eFrLm9pEL
	1iVW/Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enrq943s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 11:27:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d881a3e466so7475356d6.3
        for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 03:27:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063659; x=1738668459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R90vpW1QnIfTNntQHdxQT53KbjZtsNo83kpO3djLgxY=;
        b=MfaWiJDOjAT7EIonVTmUfL6hAFS0oUivtDXljFKb0mDsWhOmY8B70DvUVMWgAB5H+n
         SudJl+JcLVuP1zfpO9KZlGvGNe7iih3oHjC3zPVbSpmIlxiSV0+O0jn7i/Qql7EPvWt8
         4oLLFSzz59fZf1Gpbeh8/PRtZt7pCjD2VgzrSMLcaFFdkMbBnD24FQ4DEWwwfUf7xHER
         a9taNn4KBsk4po5bLs+ms2hMzwZedTxog44g4WFWx6zvreXwcIGijKwylgPK4cVP/JIe
         xnZBpIwIuM9oonxpmszi9fTsLXtp99psoDn/I7KoYn3b4Olg6qFC3FQIkN7ufmklIpQM
         BT/w==
X-Forwarded-Encrypted: i=1; AJvYcCUcLwtkhZOVVsjs3ryJLLy1YbcMap2g9FhzQcDzKYwE+du8raB7zttujQ51iqTEuJqnFWGsXTkSPdSAzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtpy1+Cw6MLjxBfBxHjB70Xw1xajX8T+nBLwr48eF/bqtmwVYo
	BLbqDkYO7+ViUuLxNICT0xWN5BJ9/Z1r28lXWQp3wWuxpxUIOnw/RnRcM/Z+wILkC3aOI+BoWuO
	90HyVks3WjkGt+3Hk2dMCaQ2pfnBaLaMH0VQolkum7rHu5NcAIrIPq8LhdbRewA==
X-Gm-Gg: ASbGnct0NvLGUHS0fXQZQwK6k13zCMgkT3qnO75S0wzHTtlr4gVMdCI49KB9zN4E2Ug
	h5UchutQzzZ8WbDwBMmU0r4HInHmbpW6LY6tObbTEEnUgURjyMdyUV65y5Ss+NLFGRwBWd4hwzD
	1LRwYuUhFsuBzAwbybXe2MHgfAuCcOuoms7rRzDGq92nbKT2YJO8BWFeC6i7d9vJPN+SANzn46G
	EoxDo7EFzX6snazs4NsfeOhvv0sfc3BE2xQ7PN70nvPQuu7Z//qBUNGUUZwMfHLvkgVow/eV5Kl
	EBBXSY3Tq6TgaEebnunYwK403oHBqjSMl6ogj/ljFdjjx1zF8Wzfdzw7CFE=
X-Received: by 2002:a05:622a:10e:b0:46c:86d8:fbc with SMTP id d75a77b69052e-46e4e830686mr142033871cf.11.1738063658952;
        Tue, 28 Jan 2025 03:27:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEsMGISBdAE4HwUk4/DapdIdoBqueAY6xEsCw7mHKRgQdChFAp+8zPxF/EfVH4RzZaeZ8PCg==
X-Received: by 2002:a05:622a:10e:b0:46c:86d8:fbc with SMTP id d75a77b69052e-46e4e830686mr142033741cf.11.1738063658665;
        Tue, 28 Jan 2025 03:27:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6c7366dd0sm61091166b.8.2025.01.28.03.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:27:38 -0800 (PST)
Message-ID: <f2ae5e21-88cb-4951-984c-2a29e117f058@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:27:35 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] ARM: dts: qcom: msm8226: Add node for TCSR halt
 regs
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-5-e88d76d6daff@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250126-msm8226-modem-v2-5-e88d76d6daff@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oXVnqGq8IgEdsvohMVJETnkghY31hRkZ
X-Proofpoint-ORIG-GUID: oXVnqGq8IgEdsvohMVJETnkghY31hRkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 adultscore=0 mlxlogscore=894 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280088

On 26.01.2025 9:57 PM, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Add a syscon device node for the TCSR halt regs needed by
> modem and other remoteprocs.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
