Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA87A13D503
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122967; cv=none; b=FukWM7OBockYHdBI/fl2kv/EqPdZ9kkto9MGuBW/dEMgpEzYhLGwDI26PZ9nDFjN22xNoEdmaMwJYRbqHhzIAuZTgnEV9Vggje/8DNhTlvoiHHTsD04z46rM/IBz7SevP2rvUy6dmNPjk3Jq5FUcZUnA0EL29DDTnJriXy1f1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122967; c=relaxed/simple;
	bh=ftRClBeYK8uSlbQPZhD1okyTCzkY7r+1vIQYxu6vxhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+o+Y4QW7puuWD5NX1JVeHvzNj/6qgHCEJxS8sja1FXWdsge66qGWoQzuTAOGHNU0NX2Y+BUe0ECEynRQUvqsCPEN0bWBr1VYb3FNFglr4VbIF1ohLiy+IrafoB/PcSNKT+1pV081wscvx/APpHdjN8M3d4mEPEWj6tFJTxvEMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn75JHuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDMGQLk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn75JHuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDMGQLk1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPQhd1021404
	for <phone-devel@vger.kernel.org>; Fri, 3 Jul 2026 23:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=831YkkMtfz85xC+Ki05XtBOm
	3sqOTqm30sA4vibS6XY=; b=mn75JHuM9d9DcziUCoj7eC4I3diociCa+WIkVbDD
	F+9etyGe2nOFh5ooPwbolCQKZrwj+uIuzzEfVGE87mg9kTRaD2CmPESHScaGCw6Y
	5neSQ4OUnuMNlMPRPBIbnXdjqq4wKoPu3wAcr+Dz9WRZBHM/loDC5TUCTor32nFF
	Z+Z7Q34DEDmjb0k3xufCswKmr5IBjeynhilXXqBKsOq/1qXG5anbJIdGFfhBKK5z
	dHCcoLNZHyrrItWKsaWzhWwDSJs6bUa6YgTcQkmUvSm7D7opHa8Tky72S37cMv0v
	p7SWvzNSu/2pIInjNGb+XOViF4DBDy5jDzcTlz3HWPuWKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u333bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 23:56:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso11785521cf.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783122963; x=1783727763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=831YkkMtfz85xC+Ki05XtBOm3sqOTqm30sA4vibS6XY=;
        b=RDMGQLk1B0ysakg5JrWKprSIXA0WV2GnXs8jq4uuQMZxzSQmNjCt0ccWP4pO0Fd/C8
         UF1slX8x6G0TaBt95/mCg20phDRww74Et9cTXseNJ+KWmZr/qQ23JI5VgTPnP1+pTpsO
         QgLZVnArtZS8UoLP6FLJzAMA9zgyDCcz1gpbnyOOIpBOydtNl6a4Hevtpx7LSVrSSvj4
         a728T87qvDmiaxykIITDxW1YeX/gycsSRJZCPdJbY838TpQmNGbTFIOfHvu9ZgAPtp0c
         Nit8ewhB5o0s69i+EGZ0MHmvPVL++pp1FnYi8dshM4XuutSPdIYncXAxWia0nlWiM24j
         z8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783122963; x=1783727763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=831YkkMtfz85xC+Ki05XtBOm3sqOTqm30sA4vibS6XY=;
        b=AAvFbrStOL4kkWukqyLZ7kviXkWcqaWb7BEGsG9JpU3JxGToqLqXJgy07pfIcPWlv0
         qpZD2sMUiZwhS2YDLD5YRH2lhY+JqFLTRYx0XweEX0VaDhYt4RT0kXcpchy0cU9+74YJ
         hHOKZQf4HQa4Kf95xaZhg7C66G+3GjZduJD73PhGzIW7D0ZlH/5uoSIHE20T1gWxTbyV
         1GI4V/U/MiYgz9jpTs7ALXNnlk9xuUe/cQGY0SMfMBb1WL0D6TeQzOKipzWWEFO5c3x/
         gnlEv59ZPg67DIp00Z3Aska13Rk76dt/5L2yboO/seOSm+7BqTmZYe0r0ooFvLT0G2HQ
         ZmkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/dE/h9z30GtZ4Ma8KycW02uuZMmT83c4UTftmpXnfbRXASrUli6OvCSXb+jacTF4t5ocPz9t5TTrrvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXDpbTDzNKGoEoEhQMoF4V6VpkXM86foGZVrVkxQnPm4lTNyTg
	rbWyAJPXyUXTEj/zEWipgxQeLqcmPzGIH3yxw5tl6SBg3qBBuR9NQlYazHMg/wBp9AaUew5PfRX
	+lwJAM9pt8oMYXf6wI6GGvLex0lXTAV9pk8RYyHEMXya0nR3AhULE0yyhZ7cVn1aksw==
X-Gm-Gg: AfdE7cmDlBoHcVfNtsWk/XpIYT5IDPPDPnKzc8OzJTMlQqNFBKHrGkcsOtrBcsibRqF
	1/Txrg4YZZB9RcNSbv+z5vrV/ypo8prX+OX3DWMuzapOuz3QTcmuIv4tNrbxwoZLJzQ0DAlqygX
	dQ2eE53R3tCKp6MTAROXDU+C9DFv3Uok0+fYl0Y1SrHaubIACnEROGTeLZTOTXRvQ+vL9ldTsrp
	jMLOzkoD9lkilSBLvJPAh1wQnREE3ghCYu8eZDU8CikD+MaWNmokFEtWLGcSBeHT/UgXvCV1ja4
	73cymhemvIqjoKt5A1L0zDcnGd9w71CzjbHiYj91r3cJmbvHCbDIkxcTVXWNDHP4SaR6+qmzImM
	uRM3IlatjJmA2XxXTdAe7o04tH7r1MVoTMqPPUWX1YLcreIk0Bz36o8lQB3uienmKdP6nAkz5wi
	MAWlVgKVPrmzvmr7LnGTZnZlib
X-Received: by 2002:a05:622a:1196:b0:51c:1fa1:80d3 with SMTP id d75a77b69052e-51c4c307336mr24520511cf.49.1783122962808;
        Fri, 03 Jul 2026 16:56:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:51c:1fa1:80d3 with SMTP id d75a77b69052e-51c4c307336mr24520261cf.49.1783122962434;
        Fri, 03 Jul 2026 16:56:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb714sm833240e87.51.2026.07.03.16.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:56:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:55:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct config
 for sc7280
Message-ID: <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
X-Proofpoint-GUID: kTusDblnRQbLrdj78NQkrNZIfEqfFUtH
X-Proofpoint-ORIG-GUID: kTusDblnRQbLrdj78NQkrNZIfEqfFUtH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MiBTYWx0ZWRfX3mXhLz1Uqs3l
 bUHVMPNf1/dgvazHlJrRUlHi7T3a/H2+YbUuDrJ8KcAMphfNA6fnPwkK36QAe40AtFdzYbR1ssu
 +cZsp+XqSx0SkWY7+UfKPpVLPVZkf5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MiBTYWx0ZWRfXyw9OUr8hOuNw
 REKgpQd2U0QNlIMz982boTUF63Wb12jq35NLtsxoPoGf31Ax9w/xtnxls6jZr0TYKamjWEcPLbS
 wIWfK1ZweXp0uaFcZ/2vYG+zujH+kEJDT2y2GKE394v2pdw8ezBPMQB7cxUaNurILsqGZ/4LneR
 jxUT6tOH4+VBJT4qZrzalBgOrETnR2w0q1TKJZ0Cn1lLoHsrcD+xO5jP5FqwnTKwU45FWK2WVuv
 Dj+MjojguqZbq2rDCvtvw01LUnA/AmrrRbpRYsL3k7PwIjDsJQCNHNq4IUer1+8oPcCZY+st8os
 stLGesp17C1cZjeu3c7rthQQ3UhLyTzO8ATEqPOuTRaFmjLFrl4Rt4iG/JoeJc6C5ifOFmLoErc
 6Ci0fYLgzp9oYSOfOgozjkm9RVAXdYoh+gduonWixWFoR26ob98Eh6nXhk9Gfx1t4rd8W92Cy1c
 evExoYjO4alXxmnyIMA==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a484c13 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=6H0WHjuAAAAA:8
 a=SMZjMqxzaKuBaJ7l-ysA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030242

On Tue, May 26, 2026 at 05:29:54PM +0200, Luca Weiss wrote:
> With the v9 data, the controls will have completely wrong names and
> using wrong code paths that do not apply to v9.4.
> 
> Note, that this will change control names so it's a breaking change.

Is it something that we want to keep as compatible for the old DTs? Or
is it completely broken and unusable?

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
