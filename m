Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2B37A4BE
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 22:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652336; cv=none; b=lv8z9uWuo7aN6EkoO+4xEc3lPXRvkQjCEIN4t2ND56DcX9aByyPZpCreyl+Fuch3tF7CfVAmho+aEJ6iaR0e5o2dk+toBGoSbYN1Fu9CaLOngylopHSgWW82yqKFt/fmxW7OeWdH5J2Caf6hgeWIsnAUxBRgAoqQqdvswE+uFho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652336; c=relaxed/simple;
	bh=mOzK7YXq1NAAIWkYQZTgBV/ApYcbFSPmYUFy2XqonT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2ECzAaeMbIGiKaMWdygabHsY93Uar0GzCHiQD4/mwDmn7TDCAlFllU2vbzazXIG1FN/0PtNKXjBTpHMFbgbq9oEHuKkRFBE2SX9TajxFGlG+kzUmVduH5z/1cypZjgqk/1UYOaA8Mp1Q9SkAGF34k/owUjOnJO3HrUQTl51F4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3RUMpUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlE1sF8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3RUMpUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlE1sF8l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RMosse2067962
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 22:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0HasHbQ7U+CmeckZsO+aDEKW
	CrV/1CPpy5fZ05F1gXk=; b=T3RUMpUSy2wWFZf5tz1/4GjAtSbNtg/sWrNJ/uHY
	yDAFhfuQo2WfR2fz0VzRBbMcSxFAbe5HXJPftZgfPJgFssqzkpmOas6Biqj6bmoA
	025lGTQxcTevlltWgJgDPiERPWLwhG7Hd/ozvVloxwOpPLz0ozPteKitD2YPfYfc
	bSV4tSLyXKBndBidGo+N/HseYyvhB4zjJkyT1k2TT+0wOGmBcv9mm7kUm0vu8ybg
	LBcRlzpf5za3+a+tsLO3bVFJUhOrKKm7L0mvxZKs6G1OdPfn6IIpMqXL0mJGC+yS
	IUs4VVNZ9wlCjAMtuayejU+jzjx4IRcK3fSN8SYBqirP7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d631q00j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 22:58:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso119293861cf.0
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 15:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774652334; x=1775257134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HasHbQ7U+CmeckZsO+aDEKWCrV/1CPpy5fZ05F1gXk=;
        b=VlE1sF8l9/IgmaszERxqGQMZJNuz4n/38IUDVuLjD6K4dp/Pz1gWkvbDTbJZ2X2FxX
         9Kc6SsLw6kw4pZ/UTzqCU93F3jRX3DPcs798kHHNAZypr0Vu0ZOo60niNkbZsbXZ3Kpc
         +iy3v99/AKdlvHkyOnTGFWiDfa3PZGXPVsM4Ld2zFKgyOj9U/oiu2Cpg+iX7TcHET7qd
         4M7e1aK0Vrvg6atd6HgIJF8RDWi/Ob6capRARQcVsC0UPRlvlqGdN4PsTxYDzs4ocafy
         8/wo5LjY8vI265k1kyE0wwBU/go9z8Al/Tkkaef8dgrJfjbHzoMrAsChE9iQMmxOcskL
         Tk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774652334; x=1775257134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HasHbQ7U+CmeckZsO+aDEKWCrV/1CPpy5fZ05F1gXk=;
        b=EXbXYxfcdcpVmjqMsnvezXHcZuxdeyDoss4Jqx01G4iMCc4pbmJiotNWdBwMOvxDJ5
         NdofJLRM6d1Yr/EsxJE3F29urtvDHEQgKOcsKh2uh0tUeFkaYO4U/CCi55QtfKSDEi6G
         SL1QmhPwkDJSuu3NPWWW24kPejvW44JabsyHzsD62nXYKsn81GO758a+vtifXA1p3FaH
         WxpyzIsUWBytxO+K0fQdrHi+7JLlXUCLWXkGeKKP8sLVuGeoGtN8qrjM510LT2Tfd7DO
         RPk/38G5cSTQKTTlxna9DMrss/oUof5j8N+DdgC4IJkjihewmY846R4precGkPfqLEj4
         aMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVcGFPy104bieK0YoS0A5+vzaQJN7c1XczCVLtP5fTMWVrBSZRx7V2aJqErcDIsDEkr+HROYGfL98Raw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXz2Cc5/PF4/qnuZn9+wuxPUqHoo2dPNrRo7/+av+/lfWXV+Sl
	ewi16Ea1SXlkOrxTurr6VWbAZerVj9/MDSHSK17NQeCENq3Q4GYt7oy6TArDMSvtbCgs/ouF1Yu
	ciDJWu20yncs1wbmmuZJc8qGU0tIe9/PzoPBxwQpALdWdYoW6p0lScZdxmVN5Ge2RSQ==
X-Gm-Gg: ATEYQzzysmBgZeVxG4HXXDEVyDw+09DVHvMHhf8i7UsQ4A9+g1CDHkNlvCjdHc5giAa
	naS7DHEL1AWjBIOJru7LGC6Ssk+NxaDgrJq/euBNpXPH0RA4U/Szl6eubz9PbM9gHDA4anYbwJN
	TeKyLwNiwXmpmLqx7Klv4VECa3RNj5XtioS6d2q5EJKqd11IRly+RjGWx3+Dfk/rnAZymnMP1tB
	rMQH3/95zt9MqAGqirBufz0LhjickZhGK/ykYNsnD+xGT6URT9fZfKe+BzV0YOt9uD7dKyDgIbQ
	yYlKq2Y5IseFcw8WAujKWGVe5xGtuO+OFcgYqzDgKWtiHbBZeumKhXKVQrBerWjmzF966XXhU0F
	B9XjAWfDpDAiXkydRtivqi/DmMsI05VAa9o+aLEkwV0OcasVmJdXHcmnCQ/yXIw7KOc5hHV2caw
	asvdnc9hPgn5whuKrFsYjrNnStG38YNZFSF5w=
X-Received: by 2002:ac8:5a89:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b994a2ef2mr90546601cf.23.1774652333903;
        Fri, 27 Mar 2026 15:58:53 -0700 (PDT)
X-Received: by 2002:ac8:5a89:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b994a2ef2mr90546351cf.23.1774652333475;
        Fri, 27 Mar 2026 15:58:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f431dsm72435e87.10.2026.03.27.15.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:58:51 -0700 (PDT)
Date: Sat, 28 Mar 2026 00:58:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Message-ID: <skmtzw4acdrlovne6jyryurxnxwlgieqtztygzt6u4i2vchtez@edd3a4576ecb>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-6-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-6-06edff9c4509@protonmail.com>
X-Authority-Analysis: v=2.4 cv=OcyVzxTY c=1 sm=1 tr=0 ts=69c70bae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=wzU05Ad-4HqZ1xQACKwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: yppoDRqYRwzQL_mliUOHSPq2_HRO3k6B
X-Proofpoint-GUID: yppoDRqYRwzQL_mliUOHSPq2_HRO3k6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MCBTYWx0ZWRfX97iFXZhOgtLZ
 PCeeu/NLELz7ZGy1HNk/5AxH9YOi1gu1BISqdvCp9ChpnLzCLfiFZJPqKlP3kP/cKSvReNAbtM+
 JZytlHlnWG/R3XI3CsgJu0O36wGd71/DSddqq6jMPvPVEyAIfyaZZ9/gJnMjLDersEKl+AZeRnH
 ywGoVn/eCXWN7o/c98Q1ZtlKKtv22KlEn64G7Qp0LC8Y/v5AJNrZ1Ty3sBRMA85QaN6LfdazjJk
 QBf9092RM5MoaQDGtH6apdRfnz3m/JsgzYRzNskAdIeBayfXEirYf+Bc3PgTwB6Rz/9bsPSJnNS
 ldmxKf+doNgam3Tppo8lmDsbIbEW4NJosiPQxjgI5/fXNRJlXTGquIyyRVdRpo22YdegkbASYKZ
 0Ko6boSS9fe9eXQhZ0AZHLxNTtYnz6K7ZNtBcF2viPfgZycZwcmNSj196PsLX4Q43KvdD2vOuhn
 RDQa0R7eFCS6f8vmFAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270160

On Fri, Mar 27, 2026 at 03:30:52PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Enable the Hall effect sensor (flip cover) for Billion Capture+.
> The GPIO is mapped to SW_LID events as in other qcom devices.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
