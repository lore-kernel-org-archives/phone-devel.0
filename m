Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6119D1FE471
	for <phone-devel@vger.kernel.org>; Sun,  1 Mar 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370904; cv=none; b=MWPZZUuzmFpy19P09gxTgLIjAUJyQOMzv5TA5XmFTNxucpTPCCIqYK8VQvrZ41ET2jXBXAhlri4QxEDoyhG8zXxnHvHxsIlvt0MwnaRqcAMLakpoA9qR4aUDaGmhAl7KOwCidwgciNKqXNW8n6ZxsMXVeO8tZfK44ivIgdtdrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370904; c=relaxed/simple;
	bh=zVnMi33A7jqtHMgzAP055qUVoI3UcFgJfvOX1I1gXIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daxu17AX5D8NSAto1VQFUKhjHMFZeDC64aNQGHMHdzDuE/oFdWR2E7SqgIPCrZT34d2i3l8th3kQELMY6vkqTKeImQkKECTBzb/Bj/dCHMyF6GSLDOQefxlMSKVZGabLOfhCYRsYZjdhc7oykTVhefe2INFTSns/vZ8miua/j/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlopAkYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BbDSbxLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlopAkYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BbDSbxLd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6215gXWf2136840
	for <phone-devel@vger.kernel.org>; Sun, 1 Mar 2026 13:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=snWnqEIa83hX0FQ2t7CBWIOr
	s8QBakxpAZjHWXPwAmk=; b=IlopAkYJhK9GESsMJD1HhSTg1HhZbsGE1Ez62Wtx
	6zUHv5ZZM/93J3Bkr9T+HTMU1Faz/eNlG568xPAO3yT6yUb36avVFlIe6ssXhctj
	uLaJXMX79P6SiPVXGLOcGQpvCi6YRwVZXeWVT5pQiOE/WD1jGU0ueAJfEvJ1Mndl
	XkQQzJhAZG35+Vjy27k6uQlih/Rnq8YkdOodx+29riirSYkc5neTxH49mjn9OsDv
	w0H3IFKTel6D/Jvhvi4RYIySWJjbkpPq1c9m0l64Fr2xrRh+ZKwZi3qCF5C3YOMd
	Zm19T2FpZMmmBsKmGSaAFjHDTPduWvan3IZDjwxNJaGMtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6jp5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 01 Mar 2026 13:15:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb37db8b79so2822815985a.3
        for <phone-devel@vger.kernel.org>; Sun, 01 Mar 2026 05:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772370902; x=1772975702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snWnqEIa83hX0FQ2t7CBWIOrs8QBakxpAZjHWXPwAmk=;
        b=BbDSbxLd6nT6LTQ67RNQpFZzmgdLPcIkO7yaphSE/TG31H8oPfIgs+xx5eyrxSlR3+
         97ZbhzYgzqSPu2XyLt8bk9ziGZCoh6KZBrK4xqFEFz+5hBApzJZgYkckqjFJezKLkhNj
         xuT1UnQ+q1Jt6D11xMddiZyBC3wfYiEXl9NQ52NnsD5R5jEdTi+EpwYOWGMo4iEn9OtG
         bwgfJ111F1cCZ8wflOiN2SyV02gqKt0lfoQX3S0MAkYSruUQac1azHuBIh0LrqWWG6/U
         vWTnNB4MLMyrV/Y3dT2eWb8L9W1fR3TuBWdI/JMob2qTUibzOLalnePCV5HdMJXqlEmj
         WGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772370902; x=1772975702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snWnqEIa83hX0FQ2t7CBWIOrs8QBakxpAZjHWXPwAmk=;
        b=CgwL325TsiD0VRZ1/GOVUCdDW3XnkKUddoPdGNdz58/ersWHaGBhxMbl2bpTGjBMcn
         1DPjU9mj/6tHOm1RJbNZK+ofl6fXGexdKhkSKeO0IpuZ8Ds1xlZRygqvDnVqDWJkqVuA
         0K5kEoeBjc8R7bbVwcEReYc33yxRehWEiKfJ6vSxG7zwWn8eSSil+TDvRlWO/8NQAYgh
         fvwoDveY0GhLgu6dnel1TaqqNC37AePssONNurOUMVF9Q1+JhBLWzqkiUyT20Eqq71TN
         v0iW1gU4WsD/FFbsrJo9lUSc3GeKBm+GIoYA9ruShi/hNuA9inRfIqYx8VqiYQwGL0vS
         LNag==
X-Forwarded-Encrypted: i=1; AJvYcCXzezZ9bEveapQT881hZqjkGyVyk/FJ0A7kXNOPS7iPGR53BtAaMXYBNod+00/+Tu7I+EfxoswcQzu2sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF6VdwwK5ET4tUSZXbmJbxNuwe71irp48V6JEU0BVKysfW2QIu
	OCF2CZTkD5Ue1tPvmjC5x/LHKyZC36vbhCNd5WfVKiCZKnCZTkOywiIczMG849/Bm4lOQDQiOtt
	CTVB8NZ7FLNSdQeGD7rxJwAxRCRUDrcqLZFJnOzaN1fIXPh+Nn8r8sp0lIsxI4+lmAQ==
X-Gm-Gg: ATEYQzxgltwJcVR5aDB1iJLKly5gGBKfdRIdasqr6B+Qan2T/NVx0vPlQgPV7DMdh7x
	SCji86k2di72p9dl/AIAXh/pW/fti0niTsSLJH95RDu+vLj0tH4fNQWli8YG4SLTCyc+InaXUYu
	l8Oo3rc6ranD3N/PJ8h+eShafZDgQkq4YZgeDwEz9R8EHdz672fJEaubwBmJfmhYqqUTos9EjCI
	BcXp8VPT7VZvDH4wZ6858N4hs/IZIYymPD4noO2stBlkvCBCwlb0zqorKl/v85zkcoFqXkPCqsl
	o5px0xW1knMoT6lcL8tY6SpPBMZ2/HJB4v+6cxyXudtBC+MXe7CA90l3P+dZtW7SkWd21S2h/q3
	ShEsSCJBDGdX8tMdbpPGBkKww2Rk9xv+hcDpRhl3XBPqheyHtPnrpoF17KPiYyDksiJRcNwPkyE
	8a22uBeyN6vlU39NmYr4BsndgcVEgkhx33iXA=
X-Received: by 2002:a05:620a:1a21:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cbc8df092cmr1150156285a.38.1772370901719;
        Sun, 01 Mar 2026 05:15:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a21:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cbc8df092cmr1150151185a.38.1772370901258;
        Sun, 01 Mar 2026 05:15:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11577588csm1092335e87.67.2026.03.01.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 05:14:59 -0800 (PST)
Date: Sun, 1 Mar 2026 15:14:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom,sm6115-dispcc: Define
 MDSS resets
Message-ID: <uqfdlsgc3ct23hgpul7l5towiry3p2ouneuaikbzi7x5h6hxy4@5l2hhc2m5t6l>
References: <20260228204638.11705-1-val@packett.cool>
 <20260228204638.11705-2-val@packett.cool>
 <20260301-sophisticated-quizzical-serval-ccbf8b@quoll>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-sophisticated-quizzical-serval-ccbf8b@quoll>
X-Proofpoint-ORIG-GUID: GxuH2zYm1hAYqp0p4H_WJKq_lcm0qbZK
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a43bd6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=c1V6_AEUxpLOshWVZTEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEyMCBTYWx0ZWRfX0xRIASZZ+jle
 +sjMWHtUD/928O+KY+CL6eMNyOIf4oudVZHXY3P3o2rh/wfOPKXnqdm3uYjN0inQmlmaTfdJWtC
 RgQuqRff3QDdMlEeTdUxGm98GPIZZAjYA79YDhh2ntBa+j3p0e1CLGrtU+p6/ogIPPA96UQau75
 atFU8avfBsrxopKl9un8mFUc6n8Hj3G+Okr/JVGCozZa3tVaEMWMn+GWxGvplCOrcEtOs5FcWN3
 xYFo3aZYXph7OlROldbv/J2mIfK/zjpzAgnqmNHjwSMTauICVFZ9vTlyUIijuxP3sSBsiprW9Oq
 aVbKjZZ679Xp1d038AT6nedAqbRlSp/ECpHi0f4/8xIaMV1YABVaxgEKkfK9/JHQFm90qFCMlsD
 fIsmlj0pxdlHu4xHltj536lpXPqBlirGTCT3b/Mckfwt7DwOILXB1yECy1vxMVgnsn8SgvNBF8B
 ksoli8xtWNxBUGMbp/w==
X-Proofpoint-GUID: GxuH2zYm1hAYqp0p4H_WJKq_lcm0qbZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010120

On Sun, Mar 01, 2026 at 12:52:57PM +0100, Krzysztof Kozlowski wrote:
> On Sat, Feb 28, 2026 at 05:41:27PM -0300, Val Packett wrote:
> > Add the missing defines for MDSS resets, which are necessary to reset
> > the display subsystem in order to avoid issues caused by state left over
> > from the bootloader.
> > 
> > While here, align comment style with other SoCs.
> > 
> > Fixes: 38557c6fc077 ("dt-bindings: clock: add QCOM SM6115 display clock bindings")
> 
> IMO this is still not fix. Missing feature in original posting is not a
> bug, it's just incomplete posting which is in general accepted.
> 
> Your commit msg tries to explain the bug and I see nothing relevant to
> this binding. From that explanation I see nothing wrong in mentioned
> fixed commit.
> 
> Please drop fixes.

Here we have an interesting situation. Patches for the bindings and for
the clock driver are not fixes. The DT patch is a fix, because MDSS /
DPU can misbehave when switching from the bootloader configuration to
the running system.

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
