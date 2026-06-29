Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B763FC5CB
	for <phone-devel@vger.kernel.org>; Mon, 29 Jun 2026 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728408; cv=none; b=khdyWe0OgUlCa3LXEdQ4Itc7Is4BlOUi/2kmzHO7mEFaHBp6gU31ZHM+Ed5EVK+FNBcVS9kDIoGTLxCMPnxfBgUYPvr794aANm0dcjiS7SEkeqWwMnrSffUkRKq73BD+Wr2Z7EJcVWffpi2VsFTVCYZUlNE7U8zdmj9P6JzC2kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728408; c=relaxed/simple;
	bh=0tcYS/TGLDKTnc+D6P6cIojnHQYd5yvToL1o1yYJPUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQuVg1TODWqbiU4ZKhTDjl4YwNeSoTFVwPS73CieeGZTP9jO2gujPeJaADBwWXMKLWS+c2tX5q/fJSx8/+91Vv+o10IiNObKHng/gIHka3G6SIkJmV3sjlRBQH5p7ydw79TTFw4Cj0FAU0yf+j2EcPmKEStAyAM3K1RzVbHXEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRxQaSze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6hC2nkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRxQaSze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6hC2nkg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xqgE2432457
	for <phone-devel@vger.kernel.org>; Mon, 29 Jun 2026 10:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0UGKVqsdGzbosb+05ZlN0oEU
	xhwfuM2PCDbsn8tProM=; b=YRxQaSzeimiNXwkmQKEKAkI6eUjxi0HuQqHn/ObK
	C/m60CMpRpmK2tXn/hjS8eQQqNVQQeHO7gGlbejGXkt4DWDrUv24dZ7eBDpCvjbZ
	XjJl6uFNzd4nJMRJxcgSv/qaKfeI9ZFHMNm3gT2nZOwvXVffAFt0XtkaCJ7qdXi0
	a4vj5SezFbuRh7SVUsgz9HfhBzwz37P4nkkF0HgkFDvB51VdDNjMUrmvJcYzLFts
	Upu2eTUupchJ8PURTaLNhjIEO4xleFCRaSU9g+0NIxAMUo+dn3co0LbRnnlv4QG+
	gICYmB00ti4aCwTw8WI267MDSuabGd67VZJBGveC43/bIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperbe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 29 Jun 2026 10:20:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so494065285a.2
        for <phone-devel@vger.kernel.org>; Mon, 29 Jun 2026 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728401; x=1783333201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0UGKVqsdGzbosb+05ZlN0oEUxhwfuM2PCDbsn8tProM=;
        b=g6hC2nkgyaDMa0QJz+lCngTkfGmt1CB/ycW8JsImOs2MdK8HacyB+rxOJ62feSQf2E
         irqAZ+G0w/UstonIgY+gQ2KmH2l1mrqGRsKJsSU0VPsHxEoCLc9viEFetjRBqCxqLxXN
         9v005o1zCLdjgmpbpkFfx8hRJCMjGdcoYQJicNcuzfYXQzmGT66Hdkwnyw67E8JJaAKw
         9wfY5dELswO5DRr17BZLT/n6I/gAzH+5XqNg1o4DPWMMiw0CrI48lKxtzxQUS1tLecHy
         hoX7eIfyzBO5jbOjsqV5L8iXWjDca+jm7FeeAU/8sa1n4z4/Pf2X0x3bWyCUt0cKM7vD
         zPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728401; x=1783333201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UGKVqsdGzbosb+05ZlN0oEUxhwfuM2PCDbsn8tProM=;
        b=hY7mfxiSIp4kglBNOYC9Ar6AYq0C4f3PoIAI8DiXef2ks3WmEAa6aASgiviRUD4X0V
         fGdXYbUtqy5zk7NEDX7Ir6ZHnsMbi+LWNp+jyg9rdm9WDvTwSXu3JdOrCpVH+McCGScQ
         SL2WrY6oizTagoPaL77kfLl57fW2N/dI0EJNcwr2e5wRnn9/Bzg2puu6EjdJF/SnbFzN
         91jO8XQctb+KwuC9X/ajeJ0DFKiz3ulSWN7IrE6XB83//JungfuEmIJEVTjv/3o8gaE4
         pu6pD+px6xab+jPUHzYKl5JbLYOp4B9XKFcWG1cdxRbZldMcKIXgdkgnp/KOt5k4z+Jw
         ivkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KxdVGN5o4NKijHTBlKgMTc8W8VTlJ77x8vXqFpatffeNSVV5AhV7keGZTbnC2+guLIWHhyzUSP3it/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLw1Njolx2j44qaw8ceiDG39GfLUr50McA6m0u2X8Y1ykVOR/A
	do0L9jz/gu8Lh7D9Se41axy7T0Lw3+JP2lBRgEDx+2yFT8Dl8w4vmilHqS6LIJoMIycZsR1/bWL
	R1GAPkW8kDVKCnQk72n+FOIwPeQnw2+a6fJhxkVlfszDpINDQc5uOIwvK50asGISkSQ==
X-Gm-Gg: AfdE7cnpw6D2WHK3KFaNRu8YQNGbfxzWqYGbxUbNl0xgMQyYTXbLdTwmIfIKQQein+r
	V1OlrsRxJ7YNmULLNDOB+usxkd9Cdt+UONYODk5ViDgYo6FXYLDJLYZCXoH2/fyt4bFTboKhf7F
	4JFS6WhC1I7eX+7ID3fa9yMNZlIRwHsYBYMS4iJB1Y/MyjTyZgso9DxBdo6h/+pjCIjXQEWq+xo
	BK1cUJu9H9KVofp9YKRuW62kLlOS+jGq6UXtrBjWxQ+p1a8sCnJXr6jXcmx4/UY0ZCzWQSK8V06
	fyCOpNsX8wgYt99lb5/spESixVBUzw6T6rOw3DwFfEpKdkR4wmnxa68FFZ3Iae+0ai8GssEUtb/
	/HLETkV2akyAWr/WOaexAMHaz6DGk7VtX9vxzmrTBI9bq2Q/NVCufQuKkr534L+tnrHxngS6Q/L
	/FrrEwm48brWuV4ZDD5XL0Rtfm
X-Received: by 2002:a05:620a:2308:20b0:92b:6805:eae4 with SMTP id af79cd13be357-92b6805ee71mr984801085a.65.1782728401203;
        Mon, 29 Jun 2026 03:20:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2308:20b0:92b:6805:eae4 with SMTP id af79cd13be357-92b6805ee71mr984796585a.65.1782728400683;
        Mon, 29 Jun 2026 03:20:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b01631f82sm10787451fa.6.2026.06.29.03.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:19:58 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:19:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: me@samcday.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/mdss: keep mdp1-mem interconnect alive
 during suspend on SDM845
Message-ID: <j76vpo5gxpwek7vpsjz2hydgcyibhvjueljftj24j2ritpb3mr@ej6bf335nxq4>
References: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX2vNcb8ODnHJT
 KbJtGRrOe5g86XVqgTPYJPDD50au3/GWJzvLGN0xZs+31Of7vej864NMR9HXUZgVuBZTChUFE2y
 UQGeIhHZtsmmTaId/NiSI4sDC6zspVnur/rwJ5KJ3Emo981SqMPIY8pOXgKwGk/M5o4FUw3Vujy
 yzd69WjX12u8gg1/6Zw/jNU7MEAbYNOPMZoX/GarvSjWQlJY76vwzdZ58OE0wHKiYtZbxK1LfOS
 Y+2JXz4LcEft/fM+pxyYHEpILSIqd+BpbsFXmK0hxV18k+Jjv6KKbdcJbuAltrvv9yoD0Tzanc0
 ZeReCuxPbz9xXEB0ZV0Lhk3ilWP6fQg87uwMMy2LVcpLr344JfAMRC/OcKWIjkuMZ4tkmX+fFcW
 /I9/BN2B/FMgwUC54IXSNvGlN9586d3u53ckfOcxxPDzCzSgWbNTE5hLsm0JlK3pqSfTcu1v387
 fnw71CueAOA/JzvrFJA==
X-Proofpoint-ORIG-GUID: QbNE1s0IXq2afpRa1yZ7YWBYvbdAl991
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a4246d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=lKQ-AihTAAAA:8 a=6hj42vQ7RftltVCiR-cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfXxgdvcSpqnbfW
 A84zXIaNGRapB6Biuu9cZ6/JtVwMdziUp4bxPUYej17ZDzXPrjlqd0OzV66+erdAeL+2jhSlIIe
 AGjbNjEkx4SjzV/HE29bg0JbtAnnx/Y=
X-Proofpoint-GUID: QbNE1s0IXq2afpRa1yZ7YWBYvbdAl991
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290083

On Sat, Jun 27, 2026 at 10:18:45PM +1000, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> If the peak vote for mdp1-mem is allowed to drop to zero, it seems to
> cause the fabric to collapse that path entirely, which causes the device
> to bus stall and fatally reset.
> 
> This issue was identified specifically on sdm845-oneplus-fajita, so this
> workaround is applied narrowly to SDM845's MDSS.
> 
> ---
> This RFC patch is a spiritual successor to the "Addressing stability
> issues on SDM845 with the -next tree" series sent by David and Petr 6
> months ago.
> 
> As Dmitry pointed out, the patch introduces leakages to the runtime PM
> refcounting. In practice, this means that MDSS never actually gets
> suspended, which is why the patch appeared to "fix" the issue.
> 
> The deeper root cause is that, when msm_mdss_disable() runs and unvotes
> the mdp1-mem interconnect bandwidth, that seems to collapse the fabric
> entirely and causes the bus stall -> hang -> reboot behaviour.
> 
> I've confirmed that a tiny non-zero peak bandwidth vote keeps the fabric
> alive and avoids the issue.
> 
> Of course, this is still a fairly egregious hack, but it *does* allow
> blanking to suspend and resume DSI + DPU + MDSS properly without the bus
> stall.

I'm a bit sceptical about this patch. The Lenovo Yoga C630 uses a
variant of SDM845. There I don't observe any issues with the MM itself.
But cluster suspend can cause issues there too. I suspect that there is
a missing vote (or undervote) on the CX or MX, which results in
suspend/resume crashes. And if that's true, then your patch does exactly
that - I think it will add an internal CX vote, which won't be dropped,
preventing CX collapse.

> 
> Here's what I've validated with instrumentation:
> 
>  * DSI host disable, IRQ disable, PLL state save, host power-off, link
>    clock disable, regulator disable, SFPB disable, and PHY disable all
>    complete successfully before the fatal reset occurrs.
>  * DPU runtime suspend also completes. The bandwidth accounting was
>    checked and confirmed to reach runtime suspend with 0 refs, with no
>    pending frame state.
>  * The device survives through MDSS clock disabling and mdp0-mem
>    zero voting, it's really just the mdp1-mem zero vote that is isolated
>    as the cause of the stall + reset.

Will it work if you suspend the MDSS (dropping all votes) and then
forcibly break the device suspend by returning an error from the later
stage?
> 
> So, I'm not really sure where to go from here. I'm sure that this
> workaround is not suitable for inclusion upstream as it still seems to
> be papering over an underlying issue... But it's unclear to me if this is
> some kind of hardware quirk on SDM845, a problem with the SDM845 DT
> wiring, a driver issue, or something else entirely.

I don't have a good advice here. Try disabling cluster idle node. If the
device still works, it's not a mdp1-mem.

> 
> I'd appreciate any advice on how to further diagnose this issue and what
> direction to take from here.
> 
> Kind regards,
> -Sam
> 
> Link: https://lore.kernel.org/phone-devel/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz/
> Signed-off-by: Sam Day <me@samcday.com>

-- 
With best wishes
Dmitry
