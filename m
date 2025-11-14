Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E2311952
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118396; cv=none; b=IOuAjB6TIXJGPWOdcyLQPqLM50QilwT/Ob7xgTLDsmbDy7JSpln6teek4rHzat95JuBqRxSp05mCusN1M5+vGvbSFN2yzPM+aDlAuownN4dgAb7Dukdti/EgFMdbGxPjPwQyddmQazz7ziT7lb2B3+sR8HEpk5As1+PFTKDYmW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118396; c=relaxed/simple;
	bh=3BOV1tl7TjNQrll9fHkxZzjrNPf/e4/8LiBH6nCvRmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L12rHYrO4XqpOTQ9FeoMxWYlwMcDrn5MiNx9Hobfsd9x/TMM0ISaI709EOmiNZN8wZWuDiNsWH/VoxE/nMd+w+FxJP+mweWP7GE6mvPfgbnArYMX5RlWVtCcfQEDDJB3Y3BaD41djzkpBqV6cj0Q4/faagFh94zyM4aRHGEv6uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8j8d+hF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RC1hl/0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8j8d+hF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RC1hl/0J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8XkgT1427247
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 11:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74+kg7lLrnTQ83su7R/2/8ws
	11VOins2fvjFVb1sOvY=; b=c8j8d+hFHkEXjXALcnJJzKt+rmCt93m3CmSQSxQb
	w32/BVK9ntevyz+g8RQ+ov9KixMjN3ZC0sOADjp6urGtPBrUYSidyYCL6F4QfFFW
	HDRGHoZqU0nt3octgmTd0WtRqNloGAPJrsAHb6Bzwa43fUsQoNXonkKxU3Mki0H0
	tiBM/0+hQ00tlnpB+Y3tLWq6yTu4xcvJ5Afuql6EWr/Sht3Sl0uZgEvZRZW30vMb
	KL7RxksVto7/TXueumK60DnQNiyg4i4Q2BCyyi7t4rB34TRiudTQAaxR2QUj1pGP
	q2/lQLbbNGWP0ASWExLiDg+RFdGmC4V01msRNnegCONIrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1w0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 11:06:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8984d8833so79742211cf.0
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 03:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118392; x=1763723192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=74+kg7lLrnTQ83su7R/2/8ws11VOins2fvjFVb1sOvY=;
        b=RC1hl/0J/4Ml73CIMjS4I7+aWflwkA+PyDlqRb5bE+8fjqCtOwQYBY70ngGss6axGa
         UvdJutNBskUZyz3nlxHQn1l/VF3HoMkfEYlgOL7PO4gDVUy8u/hSzyzkXQXBVBdRJckQ
         K7RTTaXmvoaxdO8njxvbQ9KJO2dy3Ew0q1kEMj4er15jOON6XjPofUwynhO5KgwyOAcr
         YPkQ5MVJ8w5DgKFM1Ov/exedNxYktdujWQWm984sMx0Agev8M71E7WSTO2+zYZsxmLrn
         rKEf79qLmNMi+qwFAxb36+6bFzozdDt551AIkrkVN78s88LjQ2p8TFI9R6p11DnJ6lGq
         VtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118392; x=1763723192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74+kg7lLrnTQ83su7R/2/8ws11VOins2fvjFVb1sOvY=;
        b=EwO+jKbQy/j9+EPIyi38mBbwh7oHCohSu5FUVbyF4btigScJnY5XegFeEi2QEsa68J
         ibh0QnbAh0pbcOcs1PGltbjOv5pq4NuJS1oUCzdByTQK1rfhZ66pSREhDwC+kOzz/QLu
         YzgZTLVxZrQZJ0S6/GMa7sPAMezWpFxBOZe7gj6bf694W8wD9va2Hfg1yIrntR94khve
         tNGl7ZsEzn0OOo4HaONU4S0UteK/Cn+fZZqviXmiixS7RVPIMPN8BDbGPEGKn1fGtQi1
         p5TSJAD0tBMt+VJfv7eTaG40xVaWtth84+z/AnIhwmH2jDPNQOhgHXyGRIPLd9l9yZw+
         6oCw==
X-Forwarded-Encrypted: i=1; AJvYcCVNx8ewzqqliNAiYDf0ohEXQUikwYrEeTxWpPvMu4erPUtuk2WsbNl9GCd9DU4jiYyYzKNezZFTIhOAnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN595z4fZcDrBQD5rMmegfZ8MtxUlFG/GyJ1icaj+/RSWtO6Zj
	AE4RIn60WisucipNx/m4xdwP5B0XkmL6tuBvDGFi4OydE0vFUylGRuax28sdPhf7DGd/0Q+Z7gt
	oGamW01o1Jifs/hpFafglvx87aAT7vFgjPpirqQXG0MV+oj7Y6Y4ADzLOOWtf5CbgXA==
X-Gm-Gg: ASbGncuG+p3kt+Fx7tDqVXHbHy9GKAjtoMiQsvi63OGUv6AAHLobM6TZ3QyoxjdYAm7
	dKTbrfGMwon331awc4kcojbmdonH/l6XDAYxwHCqWedfkVRDLVOnEJo1SCLVjRtny5lMVXpGVbD
	qkn/jvQKKQxD+b3xuemIVw8qKqOYpCl/76qblrVdPXBg7GPrGu3q4pMuD1ssR4LIZba/brFLFRF
	U+jdY1xoSTk9WPG+XWkuJrFkx4/omayIMBjSAAoudu0nWY2paQUcm8Ar5l7l/a/Yh0Wi175UgbD
	qW7m7txUVX/c/SUxV4Q1VxHhMjwaDYamlCQ5ppFu9QGgvDLSSvgs8KswSlID4aa/HeJFQbUlYfH
	6HhkfEsbmP+3QYCVa0WZUQ6vB3KcO+mBjSzzOJKmfK84EN3Za9okiL2wUqj8idGzON6L8e3ljOU
	btNRO0dIBXTy/g
X-Received: by 2002:ac8:5d54:0:b0:4eb:a07a:5fce with SMTP id d75a77b69052e-4edf2044abamr35979001cf.17.1763118391641;
        Fri, 14 Nov 2025 03:06:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWCtoqJ9eEoz9VAi84ImZOu7pTERyYGjny9OzPT+PKrThzZ1sTEylt2zQF8ckW9BA1nAjdGA==
X-Received: by 2002:ac8:5d54:0:b0:4eb:a07a:5fce with SMTP id d75a77b69052e-4edf2044abamr35978531cf.17.1763118391115;
        Fri, 14 Nov 2025 03:06:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b33acsm993512e87.33.2025.11.14.03.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:06:30 -0800 (PST)
Date: Fri, 14 Nov 2025 13:06:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] interconnect: qcom: icc-rpmh: Get parent's regmap
 for nested NoCs
Message-ID: <puogcauf57v2auwmmqcdrwuy7oqb3lqwx6v7glldgh7pdez77t@a632c7akqe6w>
References: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
 <20251114-sm6350-icc-qos-v2-2-6af348cb9c69@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-sm6350-icc-qos-v2-2-6af348cb9c69@fairphone.com>
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69170d38 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=a4FZeaqhxxCkONjFBGYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfX7+eGsyLtWKdt
 Htv9kc/30Iukt4ONRfs7P94U+XVJMu5P3SQ/mOrsEJ2igLuVSdxgUsVE3Xi51p3mXELGTT5Kttz
 J33dOWQ/1aLuMTIqltuSjJMjtULSkQwqthJgZmwuWZX1t73lutM/hANRh2MriwIIExDolQmsHjn
 d/LMdxXA8BU5O3JQ7fzg9LzebB4/mfPLwBDIcwQTkDftLL3sQHJNszfs8WcX1GdWrjqUXFC/3tJ
 vbT4z0yJI77U/Sa6U4BlkANIFo33zFf/6OQnvsXcUhyc8IekoOENrmXU1gfCre/0fPmfVptoh0P
 wuaYm9xDCoYHDQ+vW8idru6rDzjCemgmcPquhDa3DjqdvsozQj0kykLGZ0Mg0vzngs7eUf+Dcmg
 UfXF3s7YOJTUUTKoqAk+w3nSZqcNEQ==
X-Proofpoint-ORIG-GUID: TOWAvWdlDNsM662jrJ2y4iMGfVrLucEZ
X-Proofpoint-GUID: TOWAvWdlDNsM662jrJ2y4iMGfVrLucEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140087

On Fri, Nov 14, 2025 at 10:31:10AM +0100, Luca Weiss wrote:
> Since commit 57eb14779dfd ("interconnect: qcom: icc-rpmh: Support child
> NoC device probe") the icc-rpmh driver supports initializing child NoCs,
> but those child NoCs also need to be able to get the parent's regmap in
> order to enable QoS.
> 
> Change the driver to support that and support programming QoS register.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/interconnect/qcom/icc-rpmh.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
