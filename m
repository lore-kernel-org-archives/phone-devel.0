Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F434353A6A
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680533; cv=none; b=ELHlgymiMnlk2hppgMmfnAjw4v1h56U/F8GMjCkJwfKpPUAwXAl8LItVc2kqMhqj4ZdiPSCx7/ck3Kox+zbqRQf/U63pIP45Vnopz6zqVA4FIdE9SefC42i+kN8pn83/faPqOYph0g14nD/mcq7SX37D1EXYSJeLfZVG+l3pwpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680533; c=relaxed/simple;
	bh=ZiPa5vGVE0Ss75ofMG8iEgYQ4iiyAKjmGWoImxrg5CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnk5jEimPWB4qwjmx1bAUzjne+3QsqbbSXuKp+tFrS72wQQg9gwZ347MXCGQqpk5ZRHp8XTSwESJrhbTtNH67GsOi18mTzaPedzvyeU1spNtYrq8kpc71Wcxav5tP2UREqq7uG4+Bbmyl1jH99EOIO1fZ6gtv2ohHsMtKCOYY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGtFjSXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kw2OWMr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGtFjSXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kw2OWMr3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZAJQ3061856
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 00:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f0V09DaOcz09+t9yB3GnAscn
	+Wyme+f7EEbXFshnkFU=; b=hGtFjSXJcWYAewpEj3csLzDMonBIsp5X43ygTqjg
	TeyApyY33614BCpgbmMQIcbVf9CXn8APaRipjqESQpIaASHM/BuXAMtv+88YNwYI
	w0ALBUf2HmjP22VP3hyUizfMBuUpHaajrnM9pvSTl/pfVWxb575CQeBFY4Mzx+P5
	U1pgmOECBVfDe1mF0sbqbVpwU1H9E5feOb0jBWWlbpHED6E9YPgrWq7v1mtbMyug
	UM6M6j6Fsuqu5PZvar4vJItmJw5Nn+afHJ8uYK8ctE9no0L25AQoA+Inz8tfPU6l
	fMSQKhjmaNNqukcCCVcZcloH23e84soehSZlpSN44LKdBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a9ed2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 00:35:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-520a00c7a03so148451551cf.1
        for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 17:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680529; x=1785285329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0V09DaOcz09+t9yB3GnAscn+Wyme+f7EEbXFshnkFU=;
        b=Kw2OWMr33q2jW5u/K/eh8O/tb6BN5P69nPJ8gmb7ITSNdc26rDW4fk12vTN+c27zRF
         JjI6j8LF/SAIN1Kn0g4itZbGu9i62BwkizivLB1QDtEuFzBg6CZ/Mt5MoshfifUDX3Ux
         TLYvVUfAMYfIXG828afCEoMeWX0zEq4ojIBdNmqr6R3wuc5GQYN0jW8NglidztFOlv0C
         qdD+ggQ05J40d8uVlq088pf72OjqrCNfZ5XAkk0wCFq+F/5gwqk9OuKkG6GESvMLrBuI
         8Wy2T2++WQ53tV/fxu6/Y20/04TUlw/UuXT4neejrlcWnJkEYd2kyjfUa1bzlzlIBezE
         Zoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680529; x=1785285329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0V09DaOcz09+t9yB3GnAscn+Wyme+f7EEbXFshnkFU=;
        b=X2YaJVX1mfaeyCXScLEbHtkqnKdQYWRhhw413gj+lPszKDZXr/gUWCW2khEJj+SqSu
         /BcQITcagO7In6e5nu8ojFVkAyJVHoObiw3+m2aGj6ZAWZH2fK4o6O2DpvZgIPntYaLQ
         QHtBEsG3y78FoZjRjQNuXqDNYVwlcCcYw/fwa9zsuOnHBywRtArY7rVLOeM1BU+8RQI7
         Q5RfELW/H0pxw7jLOLGkMtuDgLgOc86UP9EOYZR1004iwDl0KIOP4meK13dblJIzeW95
         GV29wMUBfkJn01TOxN++GGIk2yq7QSh+zmbo0uca0JuXcidQyXfWbg6iPQ758y65Bcym
         4OKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqu93CTjGSwpYjd0BWmfGEi9CdIQzAJuJIL3gdzch4qw2VUWEGXLgr6u3kc7AEykO9F5SVChL1hcHIVdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQDQsW6yvh98rhKCiyTIhNgmQJPw1Qc6tV5Gwyy+4VX5EKtJuG
	YCYKvxsC/mAzuCkplRTfR5n8z+9/Vjg2gl1eaDzLG7zdfi4Z8wxp/MP7V7j82Uv1UfGGfxU4McC
	5iaBtdA+KwcB7SPik1sJ4KlcLVK/sSfdnj2n8e+Wx7h1tjpkrQIBzFDeEHe1pk6N0Rw==
X-Gm-Gg: AR+sD1323LyEB4egkFLDTtgNFTU+r5LDlp6XmzHAFutxni5HvaIdGoygC2kLggVv8D7
	g7FnDGNROIlNtVnrkGm8B/GJFne7zYRGVIOktq8eUkJ8bRqUy9GjcVa2HCEWRIyAOuMRd5KTqah
	NXCz/SmGydf+EETsY2SRSiyRRdGktAhrLac9EQWuDgpQ10vZr0sPdfFGwk5iMqopR8JrERIDBI0
	E7wuYJJeytdbfG4lT+Puq336T2x88a08GtruTmkxV1c0gaXLMPnzAHlv9sw7ETeLDsnNPrVkF3l
	APqQwOTGdxEOlgKksQ6xH9/bB95E6WTI4ApfbtXnb3sQH4cHmrSNnVhNYmjNlBD0CQQDQunOOke
	J992mq4Asi9wQZOBUMmI2GLMBqwjuHW630jDS3xnpyDX3+D5rFp4Uxxdgnvw0+4aK9zX0LVBk3m
	/F7atOXvN2QZ06Wg==
X-Received: by 2002:ac8:5a86:0:b0:517:a9ef:ce30 with SMTP id d75a77b69052e-5213c8e2bc1mr196938861cf.17.1784680529270;
        Tue, 21 Jul 2026 17:35:29 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:517:a9ef:ce30 with SMTP id d75a77b69052e-5213c8e2bc1mr196938611cf.17.1784680528783;
        Tue, 21 Jul 2026 17:35:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50b18sm179116e87.83.2026.07.21.17.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:35:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:35:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Message-ID: <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
 <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
 <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfXz5ShI5yUw8UM
 9LTTJbUeERVK+58K/VtC3V+dgath+UQZHj2mR+KQrv0oKB4OUJ+771C3MyyCZlQXDG6JOqzhKR9
 1dAWdVb2MzwPQgEUOrDgG+uRPlp5JZVvlGfgOdw0iGKUeTOH5JL607Ez2V5rdEUdRkKME1wg7ni
 xgeYI8FPFp5t17lXv1XC0q8qOQgwwUFvXPz0cPEtkcN1YUCjm0jBrP5kweM6jC9qAlCkUqJ3oUl
 N7UcHTWSJ2A7QpVAVWu6DhpLPmAW67gkx2ET5EBvqc64FkCM/j3ipHFoap+clBKAWX3jb8zA34l
 F2VzApwxz8cbLgLGEJbFBaHOlrFQ2rBux2UIsc1h5+JbH9Mf+NoDYuIE//QyXfAbFXVBU/nEJQn
 GQnLy1a/F5NlEV2D8+YdGXan/zprXn9h2Z5lpUFDbMpU5qlBuLl9ZP9FWdusq+xTJoxPn6tj9Fa
 AOsYPAC3fQkSVFLzKew==
X-Proofpoint-GUID: CeZ-Iyb2wUN6jeG8QKIk1qdKMX2DVm_Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfXzmE9Ihzfa2ow
 z/UW3at+UD/QZ60oJ3L1K1u79ANzUhaxDh3dwxWk8yKGLtDx84+sT98vLUl5VkpcL88lKn55HFI
 fq8SVfuDGzedIVVg32jphSGoiB5f0Hw=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a601051 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=OQN141zOAAAA:20
 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=PhrSGFbiKP9hCI9xACsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=1CNFftbPRP8L7MoqJWF3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: CeZ-Iyb2wUN6jeG8QKIk1qdKMX2DVm_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220003

On Wed, Jul 22, 2026 at 12:18:10AM +0000, Esteban Urrutia wrote:
> On 7/21/26 6:46 PM, Dmitry Baryshkov wrote:
> > Checking the hardware docs I see no mention of v1 or v1.1 for these
> > PHYs.
> 
> I got this information from [1] (SM8475) and [2] (SM8550).
> As can be seen downstream, SM8475 specifies a v1 PLL while SM8550
> specifies a v1.1 PLL.
> v1 tables are used for SM8475 as can be seen in [3].
> In downstream, the SM8550 driver [4] defines both versions.
> The declaration for the structs found in the SM8550 driver can be found
> in [5].
> 
> Please check my findings.

Quoting commit b5383dbae381 ("disp: msm: dp: add pll params table for
4nm PHY pll settings") from the SDE driver:

    Because of changes to ref clock frequency, few of the pll
    reg values are different for kalama compared to palima.
    This change differentiates between these two 4nm versions,
    based on pll revision and also introduces a pll reg table
    to differentiate the values.

So, I assume, that v1 vs v1.1 is a clumsy downstream way to specify the
ref clock differences (which affect those tables).

I'd suggest adding the comments about 4nm-v1 vs 4nm-v1.1 rather than
renaming the structs.

> 
> Regards,
> Esteban
> 
> [1] https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blob/lineage-20/qcom/display/display/cape-sde.dtsi#L70
> [2] https://github.com/LineageOS/android_kernel_motorola_sm8550-devicetrees/blob/lineage-23.2/qcom/display/display/kalama-sde.dtsi#L71
> [3] https://github.com/LineageOS/android_kernel_qcom_sm8450-modules/blob/lineage-20/qcom/opensource/display-drivers/msm/dp/dp_pll_4nm.c#L195-L282
> [4] https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineage-21/qcom/opensource/display-drivers/msm/dp/dp_pll_4nm.c#L131-L152
> [5] https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineage-21/qcom/opensource/display-drivers/msm/dp/dp_pll.h#L104-L129
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
