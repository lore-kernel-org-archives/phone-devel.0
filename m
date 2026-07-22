Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8E12367D3
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726625; cv=none; b=ltMgzhVJ9dnrQIeRsAw06EvAfKpELQ+zrlgO7Y3/tj3JF4CAS9EWT0Mjg7clKx74fgz3dlqCrTlkFErrgUIVVz3ndOMl5BVMNNVutjVP6X5M+aZ5FofKFcqaZw8lC9ASXq0Bf8YRaO9lrGdnTywAgstaLTmoIUr2P+TWrZmvoF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726625; c=relaxed/simple;
	bh=GAUXAH/+jcrj/0omWp8UhQTaBRuNlXrbRCuliCA7Q/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtFFYDGW8IgXjLaA+trPjw5Spf65CuyCl//jUbC3BMqsHTJYTU6MuV1905nlhtGbR1q7WvDCx8ltHr+5D1/5zvLzNhBsoaGYelLlhSj9u2E1lldetnvtfGQAyqnkUCpeihm7U1DHMXycos5TDa2thdieLiMxC+nzIdi+qIgBrsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxSElfCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVezbDnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxSElfCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVezbDnD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD2Djx793242
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T97adHJ2YBIYEe292GMps06e
	0kZve/Z4wOJe9Q5DRF8=; b=kxSElfCvDxt+u4M5ExpORvNUFXzGN1801hNGRxR4
	UGz4aOQoTnvmE6dkeQHy/+eFxz2bJCzOKOPPUnv1cKDxHwMHnCHjXWr730zYNqqa
	+JSX5VGI5/rCqYKU7Q31Xt5oP42jBsaRKAhMJwtvsZTKx9G2xjMD2xsqFCz1VN/i
	6Pta8xF6hwi7F8xBgnaRd4QT6lNb4ttuEu6nnN6pAEYtT2jyOfhtXazoJQfdAcgq
	lCnp6wlm3behDpEGS+Ko/CFC77Ag3H9SuNJLhtF92mYYDGqbC9kScimQ6I/SkJ60
	4UXZuCrooLGX8sWpJZoafIINnXHV8tUHDnz9CmPjuSP3rA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2a85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:23:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so125236171cf.0
        for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726622; x=1785331422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T97adHJ2YBIYEe292GMps06e0kZve/Z4wOJe9Q5DRF8=;
        b=PVezbDnDNgGwdKiLSdUF2IDsfVpl0hH//OeDWrg98JYIZ/GoSuQCfPivdA07chgeFk
         FlBlOYbAbt14Pz019M+u4vShVFpRLg8mtOBgn+5aIAPBNT31Vtt/qmdrR81Cvs0MbKnQ
         akCbg449TLgXMQGdAyVO8zjLskWfCCKKPWeF23+7twjqyJjBkkr/EmnXg0bD5EpmHXxW
         D2RUgDI1XyaU8ipY6kHXJvhxpkzwjqtp3pmf6BDd0L6PR0pRe2BZTa8mXZun5lAOQpeY
         T6e7kd3Qpjzwc3gpS8Mhd5rvUM9QWnfeOwdG8/zdW6DePIqHIk+5MF7319AQ/bOyKrau
         Ouiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726622; x=1785331422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T97adHJ2YBIYEe292GMps06e0kZve/Z4wOJe9Q5DRF8=;
        b=LYcxtmEBJjYQ84k0VzOnACo/v0Upd9ytx28vUiZmtt7tzFKSoat+r7VlnhIN/ISXoR
         VjfAXIDo+9IwCHkQPz5WjgOdcxFT7g5FsUUzLBF6bGfEzJXs6UDtz1qLKRzj4MbaXR7v
         AF44sXgHBChxtLLIRvmSIS6vDWkr1FbZmH2eXH3ob+/lsfwrKsIemt8V7U+7Ne+pES++
         4/NTaaVeXL8q4cOCRNy3jEEqaaWJNwWwCNb6nANqLePVIbgXmeK4hew54PpedOzB6nLi
         6+cSpI7gGSUKNjPjtdJQf3jHoeX5nPTmLD0trbicqh5TcLqQ8jaLoL5NjLWjxcmhd4Ri
         4bnA==
X-Forwarded-Encrypted: i=1; AHgh+RpV3MCmwOwUQQg7W1Xu/EQ/VEb+dQ5EuwcwGpBBiuS6r5++JpFSdCBKS/243F2DnnDoFW1a/uD4ko4I2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwejpNvNq/W09uqMATlmeCS69ygSyJWxGOiRXLWOHSEf412AvEF
	5ELf/iRM+FON9RKbOVTxDdHvIofr7jxXzp3ECTgi8BGr4eSbUpO9dnmkp2UZhLylLvVIY5LDsc9
	uQHz9F39w83Eg8Hnyz0bBLNP3rogtPNG113X/Mmu5IH6WtmQxydVXLdzzzmYcFHprQw==
X-Gm-Gg: AR+sD11M3QpoN2jWF0qR8ihBssjEaiutyvUQ6SWRA+HhdFAhBerzFaxUaTsNjgAMpLN
	vykyqOq0VYZty+p7//vtUuT4uMJhCAPENDo5H5mo+wyhcjHOVm9D/I2sQ8IMduUbRanEiDbMpdk
	TG3n9ZVJiKcChoIlSvMyLz7hHRPmGetujkiDw3oHjxVm1AhjuLtNA5kdH3Ii5gJnrgKyfzojB+4
	+PAbD4KUCVoy+8HaoUAwYzQPIZM7gQIcYdCn4zfKYMe0PvqLmpl6AZKMNIvSOXgPRuvsJw8fiH8
	v8lvMT8YElfze8vUQqTu3zxVX/Ox0mDe1IQDmf3cAA6qhf1ExumpCj3e/Ae/vLUT4SPbHusd7OK
	BdqQJxXoQCAHlkjX0FL366NZ3jvg8aWwL0Rl+OrLuBSC0/3ewsuKZnWVXZrRqvY/9Q312sqOR9j
	8tyjNVZBOSytK3iw==
X-Received: by 2002:ac8:7f53:0:b0:51c:849e:e222 with SMTP id d75a77b69052e-5213cdcc8f7mr224047631cf.36.1784726621543;
        Wed, 22 Jul 2026 06:23:41 -0700 (PDT)
X-Received: by 2002:ac8:7f53:0:b0:51c:849e:e222 with SMTP id d75a77b69052e-5213cdcc8f7mr224047101cf.36.1784726620901;
        Wed, 22 Jul 2026 06:23:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4313fsm465846e87.60.2026.07.22.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:23:39 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:23:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
Message-ID: <2fsd7y2myhb4tx4t3owjiqyavvhly5qewpfqlaujewnlvrwejm@wqodgnuahspo>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-1-56fd05822270@proton.me>
 <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c45e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=PTqE-MslAAAA:20
 a=EUspDBNiAAAA:8 a=3Q0qqnQoSDvQtWHvQ2EA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: eVSd0KdidHJgVbc9FyQao-3EelKPA-nF
X-Proofpoint-ORIG-GUID: eVSd0KdidHJgVbc9FyQao-3EelKPA-nF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX9sSqRg3juOaz
 w92Bu0x1YenuIhX4A+ZLAB7/tCFNGEuREJrGwjdQt0fO5Ec+I2L1JCyAM+jhl6TQRAiPmpLZ0bl
 5ygTjk7Sgm7UP3jIWDWb65VMGRQqIkY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX7u/c6ih/Vk5J
 LwWaCHDykZCz6tu0pHkty5JhgctjUAizLrGMi2UlxbEmXuFa+RKlSFILkT2cCjTDKmpN3955/6A
 KEG+LK2cBAf2hHuzMOey8Zea1Bd4pzgC86RSvvN30APjkZCz0tiEbE1xzqfGteMp84kYKiwWcfe
 7vlsvjWOm0AEnTZoP2Jed83T7BnzbBmTy8GSe78Fvts6cwAS46d7RT492Zk2/FHx6N7RdB4lLoV
 /X9oE/bCauWW2Za61rtEL92sjzQ3incqXDJnveOCafvaAHyObTuMgGmt7X6F6naGJWIBBPTisz4
 V/mcZDlopYsKBoaIKAKRAHvpqFVMwUnxEG0rr9rtPtm050w/k/rtSnSZfy3XIUlYaT7X8BlFe3u
 bs0++7FigvCuAa5gu4Qka2aveaLGikIEEJBbHqyl/8zIhieIB4ROZutOq2OJ2uTzXS0sINQfQpi
 sRE3jVCHltAYrglKGCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Fri, Jul 17, 2026 at 11:02:11PM +0200, David Heidelberg wrote:
> On 14/07/2026 05:28, Esteban Urrutia via B4 Relay wrote:
> > From: Esteban Urrutia <esteuwu@proton.me>
> > 
> > If the clock frequency is changed at registration time, a flicker will be
> > visible at boot.
> > Switching to clk_rcg2_shared_no_init_park_ops fixes this.
> > 
> > Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> > ---
> >   drivers/clk/qcom/dispcc-sm8450.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> Heya,
> 
> it's likely this change will be safe for older sdm845 too? Comma.AI people
> have it applied downstream on top of 6.18/7.1 [1], so I'm wondering if it's
> something after testing on available targets could be enabled for 845 too.

Yes. Please send it (for sdm845 and at least other dispcc controllers).

> 
> David
> 
> [1] https://github.com/commaai/vamOS/blob/master/kernel/patches/0004-clk-qcom-dispcc-sdm845-use-no_init_park-ops-for-disp.patch
> [...]

-- 
With best wishes
Dmitry
