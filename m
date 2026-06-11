Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A25369985
	for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164266; cv=none; b=X/gRC3KkmfD1wy/EvLCguypPYaqCkygnPmxNk/Pa28qUVJrai2r8BGgu1QHWJDyXUpZCNxXV7MHY5cQtsU+jYnNVNstYron5h9eDjVUm9H9IM6QZoVZLRtiwa7vXvidg4JCI4+uqFG51CjrnXpUu/yGzQ79SsqY4BfyHyO/3KPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164266; c=relaxed/simple;
	bh=lfCX3uZP1EXZuVBT8IvLBFuruNNYFrUfs6D6xRBa/u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZZzzzrmLwbnrcoCdxu1o5ER+iCO2mLygl0IlzFdwSoBviqinkM4hJKEOKaEgoiy7B7zKRfW5nxs4UVYRaEw3RyJYmvsCUj8AcVbqyZveDetOF60cuEw91lEd2GBfAWHt34fGuBEkqaukQM779gdWm9jLLDNvO3Ti7OLlfDwBDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OiQWMt0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUwHt/4/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OiQWMt0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUwHt/4/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GQvg3817133
	for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 07:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/X20Z2CefrI8yMv/8IpDBoqq2Hb9n39SsxgdwnIVWs=; b=OiQWMt0hPdkUmBxQ
	L0B8ZhmcJtjmI1w/TbShYSDVRgrpWZW3o6vafFjuE0HHB5d4eg5YBL1PKWZ1XKSv
	WWrAqqtcYVONSwYsxy1VvU1LPnHiBq99pR5mSGX1Wbg85GFooHwCicTtMacQLlcv
	qt66nVW97zM7XKl+3Dk3SCZDAyFw41fA9+BUTWUODQ4ubac9aHSme6wwEegIU9td
	7JZObfCtWbHxPom/sUnpVg69aTqAmJ1cOwAnqfZ+7G41+pav2BuqsyD5Fgg1ZDiY
	LJQA2KS62PW3HlNLh3TUU0UdaM3hib3nSeF2Hsx2TmMeCFGAtp081s4WBYRsB32l
	vO0VRw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ut9pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 07:51:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517865e6219so16577741cf.0
        for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781164264; x=1781769064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/X20Z2CefrI8yMv/8IpDBoqq2Hb9n39SsxgdwnIVWs=;
        b=dUwHt/4/R2SLS7/ZPz2bMnM+Hky8G0+BgVCwVXRYOz/9wXrY0KY+2ka7LZdtpqgpQK
         l/7OL3Zniz6N7i7+ldV6h3NTHbeDCseJyVJQXyJhBtl03iYDRqwz9P5GVYtYbV4WvPA7
         f1ip6OMtpRBN4qXfzyylDfqSZ/31bQv6WREDpoCoJjD7sSru4xWyoCDJdcyETnqVdYyI
         x6jytSOeS/hHaITMFRyz6xS1khnksBEV6BxQO3RRuhlS9WIf1Y/KEo4yfGYUtUR2u958
         Gu9+X3ZQcX9X0gag1YfowremJmDCrR/sPMD0kwrbYha18+ZXTUvEjJIRc1PHIgnT5FkR
         eDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164264; x=1781769064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/X20Z2CefrI8yMv/8IpDBoqq2Hb9n39SsxgdwnIVWs=;
        b=cNW+NCwcihWlx2QaD58MkZVupvEIXKjUGwMbI31mjSnz08pilKApPikYb1Jm+6RuxJ
         ldxDrcTQRfCdFlomFWBnbvpsniFMgUiGUZJNIvgqFtLNypCaS8lH/O6rl5LzR+m/PbQ3
         185phClo+/XB4ySRdpukjo10QQqmC+uklZcdIUTwmI58j7ISpZ8raM39GSDfm6VZcE3n
         BNYRbDK56QGXYKD8yDUazUbQdNU9bxBwcOiF/Rfv+MXkJCKITpXevm3J4Q5fMqHIU/fR
         do8p4ik6JKmhff0iexEpc9uSItMUuEpfViZLqe2pjtdJypH5riHfYibTEslP1RAa9Bm8
         i1FA==
X-Forwarded-Encrypted: i=1; AFNElJ/OSK98U46J9yusj4KDVZKL5SwUyyJ+ggCVv/3F8OUdVIKiMc78CR4M4S9DNVghTfKsqFGTOVt3L8Qjjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jeCNIbJdfx8nG6MNNLWqXGPcwZ3+GrW/Yz75NOn6YtcgIoEj
	hyzJdhS0zGY5lL+XCwAGVbCMDhAwuPL3oIqHi99+0HUsFieBglXZv0CGLHBHBJfEJqu7gvn1T0f
	hLaHX2LsUz/zFu3+VUa6d4PJMZ6iV6xMzAr7u9h8SdJXvdhdOF5QTziXQTs5qcSGqFQ==
X-Gm-Gg: Acq92OE3b+NFDwWi/0L7psL7fC+SLXF4m1YRBkE/rVf3d2TXy6o8CBWoF6VG3npE8sC
	tARMAo6UFpsUrQ6jshwbmsMaInLuNfeGxL7zSEHjNlhxQh2y8i3AUnn/tlExnKAnviyoe7Ji6RY
	YYM0M2kMLgzK9fQFiXj1NWg3j+uAPMwA+ai+e1Pg9CusOMlnwDJ6zv/uYUSW/pyX6/8RJdcypo7
	OGWTdR409UbqpHeHfRtcqr8TH/FQBGd14ADUSnZ6yQlfLZLzIsA1nCa37YDJgr98OHCgrRHlfnx
	pAUC6WHo0e0httrAt2PNtmM6Gon+DHuj86Ms/Mr+X/CNSuTSOD4Dsv7Y9BJH5LNAmbet0261SPP
	Y/TygxGpg45tXMOXPnCAiYQW+AMIXH6Xz1wiCij2H+GRUA060Sf7co6OE
X-Received: by 2002:a05:622a:c16:b0:510:144a:636 with SMTP id d75a77b69052e-517ee281cf9mr17195351cf.8.1781164263954;
        Thu, 11 Jun 2026 00:51:03 -0700 (PDT)
X-Received: by 2002:a05:622a:c16:b0:510:144a:636 with SMTP id d75a77b69052e-517ee281cf9mr17195171cf.8.1781164263570;
        Thu, 11 Jun 2026 00:51:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb6a6cc97sm23272366b.63.2026.06.11.00.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:51:02 -0700 (PDT)
Message-ID: <998b673a-9754-4bdd-a305-73824a8f8060@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 09:51:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/mdp4: keep the bus clock enabled while a CRTC
 is active
To: contact@alex-min.fr, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
 <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a68e8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qYPBgzPrCaqp2f--smQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX+hH8esz8My6B
 vdiDZHJHeGMnQYVkNecK/cxgDLLe93RyrKRKMh2Ij8TOn2mtjpDT8fTv1OKl/vZzQWbASFwwA+o
 FevAxN5rzv9MJmMYlsHNTfdtkCgZymQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX8pHlS+jxIXC+
 yg5VbdS5ERadebWl2lrdNiBCjQsI+FJ4Zd1yYlOw+gVFWVo8aRNcELNrl1jPXHrq9a+7IJgbugb
 bxnMUWur6JUqtNlgVYkkyXB/21ilhrqnlBL6+fBEUgp5EU9WFoaH820tVBJVQy1uJmfs0rgC2Bv
 BQ36uchvFLrGjLuKKFlq1ApSHOjeC/cM9Qo1CbyH1ZAJWXiQYja8EWM1l11bNpAbM5joN38TQtA
 TwNSVPCa8ptrzsvhI17Oh4Z4Ic2omYEZ1ETWgo1BgiIxF9YZous0x5GZZWpfSDFv+IFS2aF8PRn
 xNGPmvY6k+0SNlEDzMIWWy48KksFvjk6P2U1zywipxOwNk84p2wi8x1WvCCPFGh2KfHc718xxpg
 CLkRvr/y0LRyD5VJdNMQefaN9uuH3zSf9e32KsDKbRMLeq5do4rKj3JvE9G8DA4xrwyBcYMJlCT
 xkelRsAGF/oFd+8JkxQ==
X-Proofpoint-GUID: tDkM9wZh-ycxkBqMZwT37xRPCtkN8GHp
X-Proofpoint-ORIG-GUID: tDkM9wZh-ycxkBqMZwT37xRPCtkN8GHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110076

On 6/11/26 8:07 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> MDP4 scanout continues to fetch framebuffer data while the CRTC is
> active. Keep the AXI/bus clock enabled for the lifetime of each active
> CRTC so that temporary MDP4 disable paths do not gate the bus clock
> while scanout is still running.
> 
> This avoids display corruption seen on the Samsung Galaxy S4 when the
> display pipeline is active.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

[...]

> +void mdp4_crtc_bus_put(struct mdp4_kms *mdp4_kms)
> +{
> +	mutex_lock(&mdp4_kms->clock_lock);

If you use guard(mutex)(&mdp4_kms->lock_lock), you can drop
the manual _unlock() calls (the lock will be dropped once you
exit the scope

Konrad
