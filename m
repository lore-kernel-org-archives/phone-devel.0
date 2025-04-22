Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22C1EDA26
	for <phone-devel@vger.kernel.org>; Tue, 22 Apr 2025 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349254; cv=none; b=lnx9Jog0czsHNrY1dG0F6ZYrmjdx2/H2Gxb+Qmx0aGnYFEnCx7egwTjnOUyrThUTGdHmwl9rrhd1V+qfTQSBF87kZ5PNvtPfmFLKlRv6nxTAx9meaVSl15+3G1F8/r34iAhMGr2U74INwVirNV5K/hXaNyzcLIju8hwW0GaqtqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349254; c=relaxed/simple;
	bh=ktElfp4y9jLiB76b0Lw+Bu81gNc+EGDgrxca1gyyqYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OK9GAk4Q1K48MN+SfM4mlY1XbDwPlEVIWCLInYUD9vGkx9yeWE0kkbS4Yj7Wnx9WhIOGLOPRCvQ5FesbOj5Sqeq1wxzdOnZXwQnnmHk1IswAcQbvagfQhRyalxRIq+R0T1CB07Y0yWDAjtaNL4bsjmEFISQf5ZqffG9Fu75vYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOk5D0rZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOk5D0rZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI6pJW016351
	for <phone-devel@vger.kernel.org>; Tue, 22 Apr 2025 19:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDfBUzxdqcOodqK0x53+9B7Qwb91WQYtR62iZ46QXiI=; b=AOk5D0rZ8GXmkTGS
	OTj0/lfCOFxNMK6SvsP0kJMxehSGUc0NnT0KYybKGvV4ScuIejqCb4j8mPlBS2rI
	Aox8SXAC9p90WKSmW2geLKOFac/HW5/ox5X6ckOHiVskWuIqgcI1AZ/4GQF1fEWd
	PpoSYprpXpZPeNMzlS99PlhMZsi57RvZXde9En5AZ2JhkMe/XJ0bRgtf2l1vZ+iA
	S0nKczjlkspJohAj8QiANmAmkwPAWvSQD0ZV3+EivpDpvtv4BbftgRIT/K7Ke8Ns
	B0Hi9LNG2zx3RgFSTgV+jm5sjWZGKS787lg//pP8C1MvrYY8qfMK/i6YcLMpO1SB
	yx7UXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454brrvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 22 Apr 2025 19:14:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5530c2e01so43310385a.0
        for <phone-devel@vger.kernel.org>; Tue, 22 Apr 2025 12:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349250; x=1745954050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDfBUzxdqcOodqK0x53+9B7Qwb91WQYtR62iZ46QXiI=;
        b=vgPAaQYqi0Q6pCvxmSlefdFqFnL39g2sT7sDCC+e/CeZ0YUI4S75q41ex+/9+s81+u
         deWgGmiLAcQ2q0W5LPVWEQrHvSXIl3BO7MEudMBIArjU3ptfksDowUcoD7xs+GG8SgAv
         5SO/rXw6+ZSqhfxIm9yD7Y1QqKqQvO5+7jdtgy7SSgf7Ia6QRZ2qX23mLOrU7A6b/hj6
         doi/pAJifrakeukasa7XK455VMA3bLMuCSdd/QkVKCzdbQYJzkzJNdSdcUh2IreVao28
         fo9sAWmphH2B8fw1dW6CH97jyMMwSMsAHaA+Lcl/9fxyNtJiXV/rfBZppQh07d5XawEM
         KqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWZoRN+h9bQf6PoKr9gug2G3tGgRExKt0fZnezXA+n8iNFt4FZBErs2QZZQcMNV9qhcNiuNDD7g+2jLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuz15fodms1neQsWgnEK1vUS2msR4eXJZwEwx+s0hDbQrD6p8a
	rsqCgQRZESD4x2OsCvNLd9249fXWVxCWIukSLU1dudqecU+mAVsGjIxKCknBxwwhNBtIrwU5f7R
	fvEkslj6Vok4+VdTLmUj6db3kPm3ehRbJ1nXoSYK2Ld0v3+81QwR+qH8bDPb1Bw==
X-Gm-Gg: ASbGncvHc2yzYARHicZNxkiezNfOtjKr4BWXGbVOyStDtdAeB9I7xJc+C5bZd0/lD8B
	XOOAbrUyaXg4o7wopE2PJ4GhzRUhWMPxaJexppW6rncrqdZlkseg9VrQmtHs9CvM7ejwu+co5F6
	5rCujaI4dCS8BYFDAMRbh9HcCv1N6Jnioz11tm+f1HZBr8ai6J03QpPZZpHGvTYy36FFgQfQe0S
	h/pnp1hON0z4KMMOFnJK/fS6uMzYITddwAADj24r543BN1cozi+/3A3B1LFV5MA56mfeHcnRX25
	+X4mLi4ZonYr3L4Cx92YSVGEw/d0Ds9GP1YzKArXF4ymr+O2kY4mVNZariCVjGvRQJY=
X-Received: by 2002:a05:620a:4095:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c94d29ade9mr27752185a.8.1745349250435;
        Tue, 22 Apr 2025 12:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7HiqvOyIsraSAjIugd3xjXilpVZSiFuqvb5lB5h6IcYI3MvuV9H6EVgiP8btR3FsQ1k8Z9g==
X-Received: by 2002:a05:620a:4095:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c94d29ade9mr27749785a.8.1745349250048;
        Tue, 22 Apr 2025 12:14:10 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625596138sm6572178a12.45.2025.04.22.12.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 12:14:09 -0700 (PDT)
Message-ID: <1f36d303-fcfc-4aed-8d8d-01a3c4dae57e@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 21:14:05 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8953: Add interconnects
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-2-828715dcb674@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250420-msm8953-interconnect-v2-2-828715dcb674@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=6807ea83 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=Dw-YgVe96UOjDrfUO-cA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: JLw2ObUq6s6ONytPQbaSNyKlqBo02ovq
X-Proofpoint-GUID: JLw2ObUq6s6ONytPQbaSNyKlqBo02ovq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220144

On 4/20/25 5:12 PM, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the nodes for the bimc, pcnoc, snoc and snoc_mm. And wire up the
> interconnects where applicable.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: Prepare patch for upstream submission]
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
