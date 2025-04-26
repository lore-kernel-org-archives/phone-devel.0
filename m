Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870DC12E5B
	for <phone-devel@vger.kernel.org>; Sat, 26 Apr 2025 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745644010; cv=none; b=HCGxlIynlqX9DSXWw8demI4Urvyq9TPWPmEIQbZhr+05SxLmjqr66MtSXbE9OV/QRv9mWC84l5JB950uVKkE8gxos+GImt3ODIsp5tBlODAjFwi47Fi05cCIzAVhdwBdGV+hslj/tzlbFr7MZnwruBUyZQCt3nzBurrmGRtnbrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745644010; c=relaxed/simple;
	bh=Q1gTwKlCAG4xFRHE8zkb/zQ2XTPqyY5iTVOl99pSpFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rn6WtDJCpRnjoiZfnFWBTeKcZS88WvP434lBf1vAX9oJvhB+AVVlsTV05DHo9h7c/odGAmG5Xi/OzPeWV2U4D4K1TG+OM1eVMQFYwBTlH7lcjdLXaB/BAy6r4K0MrrHX2AqObV6EiSZ8eBNx5q7s/dFi+QvGUzL8vsJBNDkwSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwiPqJcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwiPqJcW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4egHA018163
	for <phone-devel@vger.kernel.org>; Sat, 26 Apr 2025 05:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eIL0w0SaX4fEgbdtMZSS99AU
	nD4HN81VW+RR9ZFL48M=; b=UwiPqJcWeRfXKGZLlT0agSw339wTDg3PCCVj8LQH
	yA5RINtNoHEdSVM1JsHflF+FPX3yiiaGkso7Zz9lz09vSwtO79HJQ50Qh+g8nZX/
	vHhrHJbs23P3OlGSTxLMtHWF3WGTZXU7YZ+MxbgrRvJBuW8D/jiwHBILVxoWvCx6
	oLpQT9fRf9hSZrYbtlFjcNDFg9gAQ7yGtliUCQzzTopF8pV5qpbYkxAYVK41hg2m
	SyXa3VebwcVirsIOEWrc4NQEOOZMmb+yzcfK/nWpZla4JSm/dGtOQbiMnTkGpME3
	T4poN4r+p477qwePiZpI2s5rXEEQNpwZ569C0nlIG8SxBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmr21w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 26 Apr 2025 05:06:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so925385685a.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 22:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745644006; x=1746248806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIL0w0SaX4fEgbdtMZSS99AUnD4HN81VW+RR9ZFL48M=;
        b=oH1tHu9K6aLk+po5Fv4NjVxZ5nrCF1OdO/DjKiXerDqNdsllTJD09CS7OHkiZONZ3G
         GX/zG3EgYI+xMUO+oTUgSjui0T9swHFueCKXkLfgUq8Fq59qJwzBJT2nH8Fv9UIjHXPL
         1K0o1nal79NGSUYjGFLO53YKsuhysGRd6GTT7/Qf6E36rsIfzgGvWmz/CHx52+j20JuN
         O+00NtQ5F0i/4EaMpBlQRkj/Ef0eGBDl7xSJhZgZoc8B7fhzkPcNkw+/T6vbQqJMDLf3
         F9Blmfi1XF3s6yRhMSJlzQWNTlRfMtb68AlZWuvapsrSme3siCNVo3Nupk+8roAdSlJ6
         /ViA==
X-Forwarded-Encrypted: i=1; AJvYcCVtCCcXtJ8NRSwo00YkSX/4YQqdXB5ZKBsjtwrbToQmHdq0PFKJ+aoVXhntBOJ45vKM+Qb71ezs/QeY5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SZ5O6xiTpHJsbgBlFfPKIvf2byxilfq5nAOpCE9EFlMALyVo
	R3ALzSgR7dKwTNsLWdYVvtA+jJVHZmUukp9Im4gErd8Ap3Kci2UBks6iws9BSIXqnsVT2guRkJ4
	TIMbqkfvsoxGADZLbkT+S2CercGoi7RoiHCwlIKtvqegQH2/aLlOlYuM/Z5tCHA==
X-Gm-Gg: ASbGnctLnhEMNb/iyIGb8OuIMrPXvd2W2jbNfD3fbccEOwov9M9w+X5+6Z81yArzHkF
	XKzDtnmx9/KGgdIM9Y/b7PZIVKX2+v0r0yOD0zvozsBCsiRZ4ouuh9GlL8KrzpYqb1dMjeQMbX6
	g6/7DjLL45WWiKA3uncz/2Whd8iPQSjGfxmmKyvz7gZGpTh0WC5RZ5ft/E7ZE+6Zy5J876eltUX
	ifRNvwUIZ9gkdgkHNQ0fTydeTBON6D9Gd0mHVhwqCJSGO78jMxpsx5YggnQe7usrFCJgHiJscmq
	Htr04u54uVE1yLhwLPEi6rX0DyU5gFI00bPWMMikRt+1LrWWod7hylLa66lV0SpZEu3GOti5eZg
	=
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr346616485a.51.1745644006434;
        Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMaVXLId8fuUgq9yIofTuCxPmggQOFvjAUGTOfOuo8GXCozhFMNKAnbZiG2Wbb5ZGjE45ggQ==
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr346614185a.51.1745644006052;
        Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7bf9sm837712e87.215.2025.04.25.22.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 22:06:45 -0700 (PDT)
Date: Sat, 26 Apr 2025 08:06:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
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
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: msm: qcom,mdss: Document
 interconnect paths
Message-ID: <cmmongeaqwfsfnhpmwdsvozhjzkbdqncktiski4jvqgn5sjmsj@2lw4vesrcwjc>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
X-Proofpoint-ORIG-GUID: gLxrF40J06K7pVPmmy0BZvw460a0xsQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfX/uJ3KUTy0MNO dUuOdliRMOnp7+NHIROYSlQLs6q3Ix2XcLCalGsMLRKTEbVY0dlw0fq9Q8mfnPTRV+kaULhFxN3 /EYnttiB7StoIQA/qla1kB96+lPwuX4wmTvlrhpS4IifrzLbIakvNDOjSeFQtjKUxBd6Xc3UIuc
 z0V7a2FDtuZUKg2utmbUO/FZdnwggbM9x1OHsCdiw5K6a8Jf3EMDGFT+x54Eic2xRqpps9hJbWB OQlk6djONIKH1uwOCHWNIoVvVY6BIZS88rF7yF3K3EzjkHdzi86x5El8c1juUlr90dIIvwpGyl6 PdIhxTD5mP1THvLEZV+Cvq3n7oFXtcgehhOCzGasG/q10nHuQM5uHsv8Zh9p5CQBFdiNAoo8lMu
 SjKASVCfZle7NjtTi4xa7ZFiDzaymudUN7uY/ldQtu8fm0R9PkmEmo48aUCnwKROphhOKlLx
X-Proofpoint-GUID: gLxrF40J06K7pVPmmy0BZvw460a0xsQ0
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680c69e7 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=z5yIEXyMNdJ1grE4PEwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030

On Sun, Apr 20, 2025 at 05:12:43PM +0200, Luca Weiss wrote:
> Document two interconnect paths found on the MDSS on MSM8953.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's also some interconnect paths defined in the mdp5 schema, both
> drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
> in the mdss schema instead of in the dpu subnode. Since there's no
> cpu-cfg defined with mdp5, I've added these paths here.
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
