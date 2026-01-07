Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4F30BF6A
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787883; cv=none; b=M5BWELnL30/uGTfzLir70A7g3kUByGxKyiO6PZckm3KCIyB75PXAVAOwcwP0eULYBpl04d76m0TO4hkMMRWabhHkm3tmfj7la5B4DCnbhVv2TjTwMBO59oK8JLt7UeeuA49L+7PwCd9SEWvIxClipZRJz7B8xv7YHB6rO1zRfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787883; c=relaxed/simple;
	bh=MZrSJkX/zVhb2SHr5TN7TgRgyGzhssV0KFhxXE9mb2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8qZYKeoWh88lXoLZldNzvGFWUJUa7YKlR0a0FH/SK/on3eBdYkc9PIHPWwhaLtGa8xNRKiGWp6dmQsFxulaa5CCvjw0neq/j/tsvFUteM5V2e7pDf/9hS1HA35TDcfwz6g+NqD55lh57NfunV3/a+At0LU+uGXcpsYUTopI5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cd/b/mfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgB535y/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cd/b/mfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgB535y/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079UiLa4137698
	for <phone-devel@vger.kernel.org>; Wed, 7 Jan 2026 12:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B8DdWrTqA5MJK0IX9QJHOaBg
	riaD+iPxH3wCc6Z0zlk=; b=cd/b/mfOAvReJlNiL2kdfQNwutDDZbbPomqgNSwB
	XBY+WKW3cf6+Y4DZd1+FtMvM/OdURJweunR8Atk4wu6Jg5eUeh6tFD1wH2xBDaii
	dTXiDYgJKbQHX961th8IJEiBYatQ/p4ua4IRjQ+REbAjOcWhZlJ0OmM77u/alosW
	r8R/us21+a0RkCAzFDRhsNRYXUoe6Iw2HV8D+ga79FnuLY4Bl/wKgG9SiThzBXWV
	KJc/eI7qGCYZNXAjk9ZKEUWWB9Vy5aTuQNuC/QhFaBQgV/9KR0d+h6ngH+SQOCFv
	JdFREcQAOqqc8U+EH4tSeR7A/NxOKMwXQEEWuDvkmo227Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e37hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 12:11:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfb62a866eso1116521137.2
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 04:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767787880; x=1768392680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8DdWrTqA5MJK0IX9QJHOaBgriaD+iPxH3wCc6Z0zlk=;
        b=JgB535y/tSVYUAaipFp/dCQEyxGg7lN4W5RCHqYz0RDM6Vk56blMhLMwrYPaflRokf
         LHYU1nvn24/KGGYrV5vWViNwX7NecWQZJymgptBVSbKcpZOghD2BhUHZS/V3pdbZFzGh
         hx7XosZA79ES5rZh35d35t5wgu8/M2Hks9gXrDxPDrkSajhTP2T+Yyxli1iE24zgHp/j
         CWroJjKdd+pRKHJ+ynP5T6Tesj0JADyeXzU30zk0Xm4EzT3W90cfTtiIR2cc8kJJrZ+e
         0eplwZ+72uAd0fUtS0/NkrKGnVSp1drt06/1PotWewwu4enLRRiQS77wPLhf47EaQqL0
         ZHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787880; x=1768392680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8DdWrTqA5MJK0IX9QJHOaBgriaD+iPxH3wCc6Z0zlk=;
        b=WVPy1ZfvTDniRQ9/+RlfM0YirUZAICxGAuh6M+MsCAFnvht1NEYvSXrKNp7TPMxNfV
         BS/ROO/s26hWBSo/GSXbscWFJ2HhemNsZoMsdG8aDIsoKTgl7Bidy0qflQAbYV/IRAyq
         CiQWlg5nzSbwF7bNBarrGmiHnOm4byC/2QZEhSN25Ks+bUypi1vmHSze/M04iy+1HDOt
         FC222S40NZZcBSdk1s5N7XJUFwIlc9fyVdXL6nOY0JP179VDLn9KXr8wvc36pP8tS3ye
         fRHSsBZ6ChU8NuLbpaq7D34fy4Uj8tJgtmSgxYTmoDe4/L+pfOLPMPZ+STuuGBA82tfw
         NNwA==
X-Forwarded-Encrypted: i=1; AJvYcCUkSVW3J67QUdq6VwDnjOGndk5qgbHdHsR/sBMLQCm6RrUMDSoMKXxCVziJ0yC3pBCjlx3C6QGF1UTAkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye2cAvMZVqJSmJWMjvRmXNVvlqFEagioYhACuUM9so2S3/55TW
	oMLJcX8JQ0E4uGJ3KCAI/yBBJYtTmJ9P8qO+uszxJfcSHMNmnUs6CCb/wuZE6atsCOxDXpKpgJz
	zhDikPxYqgOQTwt0ZcZHIleL8p4niPdiMIWMy3JceGTZnynguNKMh0bXUG9jAqwy5tA==
X-Gm-Gg: AY/fxX4vJjQ0myqE4FdaKhojtvDXMwx9K8FdHP6oEtHecCFTa2/lOCC/+IWY8uopo4L
	7DWHmmyFz1H9MblfZ5VqS+Cp0PqlSaEXJl6lIcKXI0fld5R5hXRj8Y9g1zrjou5D+syQrw4Xbmo
	XFd/KbsNiZv2Tda3q9BSiM4NWtmsKfa9S3MzOxIbaFE9L5IiHGzZYCN3F2k54OYkPMG28X2tsXw
	T90txGkSrx/bxV17UnhM0/R2Bm0kqJ5Us1AVVssx/QVgaNLx3a1PW286Z0sqERhi1m1cxspnJW4
	ZiL4Lh0O03FIKzodpJHvYdGyNc5JFbroVBSGXU+byglUbQhYdaCQs3vIbwedKmsAl/m9PqJbHLk
	3CUigy8P3hIHRccr7A5louPb5um3DB715jib0jUVtjwtBw9MtKp1FaBvMjyt2jZvL2WOM4tkClm
	FjOAyH7sHmT4YbfPgYfU5sBnI=
X-Received: by 2002:a05:6102:944:b0:5db:e851:938c with SMTP id ada2fe7eead31-5ecb5cbbb36mr717465137.4.1767787879875;
        Wed, 07 Jan 2026 04:11:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh1Hd2zzf+PWTMiMR3FmXPRYIbB3XVhByWTYZd8M4UR/fRJlpbBKx6uJ9xR17c8To6bYWZoQ==
X-Received: by 2002:a05:6102:944:b0:5db:e851:938c with SMTP id ada2fe7eead31-5ecb5cbbb36mr717436137.4.1767787879384;
        Wed, 07 Jan 2026 04:11:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7a50c7sm10830281fa.15.2026.01.07.04.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:11:18 -0800 (PST)
Date: Wed, 7 Jan 2026 14:11:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: petr.hodina@protonmail.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
Message-ID: <e4sfp2cexck3llleywxev6hfn72zx7kuq73kdzckks6qms3fvl@i5jjlq6y6rcg>
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NCBTYWx0ZWRfX3+mjmv5fqrUx
 R5d1lt7/G7sOsKlVpN0KKzcznrj0MHh8Q+OEb/i2S/fys+RS4woJ3NILNTnkZvuIeuDGOksx27/
 pr0Twuiuu6By+VxQQllYIrHuUYWhMIB40GTqK9tsk9hd5yCewC13+YiGA3L3alVaGMqMK0UHLng
 yyFip3Vl/Qxtcm4MSeQMx0iVFtZBtxSnTf0zOFe87fBtXyzjM0xbibyfo/5MlLk9sQOeKl9c7Gq
 ZqZhzvfa0AibxhdWoSeH5w1NnrRRrdJa55hTYASZlVU3unX7OpEldz98bS8aNzHSj43FcYiIEI5
 t0636Jd9qtg34RwAqA1STnwyer/AXtpk7QYBIiGAbR0HGnXw8HmBYT+moGoxbmCF28eFt5haFlU
 4GYHDUl3RG2xCLvUf5lBU83M1Sd4jbk5c1hTiLxHbY1AS94GNWiHonEFwEdWznH4iU9RWwT5pFM
 JJr4znZdOno7AprMz/A==
X-Proofpoint-GUID: vu8ecnD6O04GJVQTyOZK0SvwK4yxunpe
X-Proofpoint-ORIG-GUID: vu8ecnD6O04GJVQTyOZK0SvwK4yxunpe
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e4d68 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=wgz80j5CkXKHoATOBwwA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070094

On Wed, Jan 07, 2026 at 12:44:43PM +0100, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
> 
> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.
> 
> For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
> though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.
> 
> Kind regards,
> Petr
> ---
> Changes in v2:
> - Remove commits from v1 and introduce proper fix.
> - Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
