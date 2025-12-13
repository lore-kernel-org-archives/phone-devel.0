Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5991F92E
	for <phone-devel@vger.kernel.org>; Sat, 13 Dec 2025 04:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598504; cv=none; b=RCNEdR8pE27L+eCAh3O6yQW/D4FG95ayzPZY+oVgU1BvYZMVIxcAKMKgT64YqG4dCtZnlHD9fenIb7J9oYEebUFea3TZCT+JOLjEKAPhSki9G/f0JYkdrswtlZJE1D2OxHWRZv7LppnRqpswrScgshEY0K/C9joDwfwf5zIMNCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598504; c=relaxed/simple;
	bh=vwiZYPfOQvunfhjxyDYYfW8jvyT3qy1mEalXZqzJyQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSmjMh4oSrUV2Cq7J+tbgoOMUeukavgZOFwtsKPahFArpy5hqhANMOw3FPRMKl4foeF3ew75RO3koT7KYOv+wVjjcIy+fvYVYraKxyERG4m14XeCYzSsoujROnrdOeMM8X9lsOgGRR3eBlEzwesWweiUhr6vknSTG1QwKBzVdjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzveGwpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBRpaKt2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzveGwpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBRpaKt2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD2GjnT1746480
	for <phone-devel@vger.kernel.org>; Sat, 13 Dec 2025 04:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcNVAJsLGQf24kG2wRpel78O
	cIah1cBrBEulv8MZ6Y8=; b=YzveGwpqsxyZMxL+MIWY6mbtC40VeRt42mhWiAQK
	Wu3ASXaVCOZC3omld1a4BoNsJpoLKcf5ITq5he34sUjdHCV8z+UMjOA60oLrMayi
	bnDw3cv6Lu6Fjc9j1/hbTRsAvYsIOlRh60eelyqPF79E8scE0puEOXlqRD6WrsEI
	Xwg26V3QxPAsawjRI9VOuL0mz2bCP19fJtGXHwE1yjqz0F+KUqspWNLKzW68Q9+y
	VSIezrJMUXYXMcwkIYfOuWtaIJUZ29xf0kki072Cr5pZHpkbBx3W61XydXQibkJp
	Du8agDyyiaVewnsRAMtMhJluIcjCXEPD7lZPDjRzEVDvyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0wuf871n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 13 Dec 2025 04:01:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso26899021cf.3
        for <phone-devel@vger.kernel.org>; Fri, 12 Dec 2025 20:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765598500; x=1766203300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcNVAJsLGQf24kG2wRpel78OcIah1cBrBEulv8MZ6Y8=;
        b=LBRpaKt2IXx+7cHx+8dZNwNuPr6Vb9wFOSZfav3cCq48YF2x9gImmDly+Tugwem6Rl
         nTy/2JsCbj11nqz4cMqp2jd0jiNVaJ+zNG7rrhPeNHyEL/8Y02cxPE599qcwKE9ULcT1
         G4jFpezTQTiEq+sDew/xIfzesErjRaYnygLlcErZI5nGetV9nYkfDNWFAxdMVPVJue5V
         lznFt/ia8pVsiQTH2xUiIdkaABtxAlGp7OQsrFlz36bnzfKWVmQLrtyu/CKVNvGvQEuE
         mlpyLG8unu5wDCYkSOARkTD2ZC/mj9BGrQBCidf9FusR2mlGTaOmFC3OBpUk3gxgyLxB
         lXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765598500; x=1766203300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcNVAJsLGQf24kG2wRpel78OcIah1cBrBEulv8MZ6Y8=;
        b=gZVvroIKLqjH1gnp25O+0/v0A56GylO/OmM6D9eLL4AC5vF1c4lk+yWtPtYeo3fkgD
         a/arVWskxxzEr0vuaLx+yr1KLCZgqnyn0BNKseCbgXhkM5S6G2mMSzc1erNYS3UaDHRe
         h3+oWUdHhrpbmD3OW56RMRw55Erz5H0ItYxdu9t74zdGNITDSqRDXOPxyriCMpjwuCyA
         M/rbUbWRl9FFri0dmJX9zxzNhsht1+AyWxe+YG7ylOVVvn3NgxwrtFGLdVYeJL3piTR2
         xyYaisVGymWOTn/OUBKkwbe4pucqHqank930X76wvTDX6jk1N6LaJGOZ4ToZpO39CN4x
         2+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWfqPKuzwIjs0F1Q2OKoP41Q7y9BpdAgIf7pc4z9c6iEEvIsMkuOyuFrMQ8rbLypKf5n0AiEsDPs+a6RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ia56UzjlYRRjdMUjJWH3LBwhu6qcjfUrYEMMx42p3V3xaeIW
	693Be5zQoRdyyLWYtqVdfdPYGOrUzIEdr4+boEM0EWepjMnDuZKghiuLKG6B2EZkOSkhUetMh51
	sVciZ80HnThTZdjCQOgXW8vtKUdrv6B4uMJ6+9iSumyRCGAQy5Ej17TMApoZG0yp6uA==
X-Gm-Gg: AY/fxX6clXCD8WWMdyNOeiR6rlj408/Bl4tUYtKTbbJ4EORpizdbZG7UE9fF7Yo5ao0
	X6uHSV9mcKR19+uQJeC+O+q68eL5qc2GpFLnTkynqpworqi4gjSC3LkD/2G0KkF3+HsaS6C1Wit
	OhbZUtpo/NoSUTj1ieX2fzZ324U49qIL3lcILtZ8CjITA9fCn1igRQT2FYKTqlrcmqE7kO5a8NW
	xmO3XJPCO3c3G0KvnGeBXafVIZ7UI/80Y/qSxLH401EfdhQWImutQFPo5C0iWcKdyhj0kQAljFz
	YGnEQsZIA2asGZrzgVRlqlJloOYIcnM5pgyo3LptyyMeSasvf8J0w2NqrXgLLU4oKpxvMvriBEr
	U1PUwUY64AzBqmNjsnxYTuEvQ9fIXUJ37NP9FZ6sES3Qo6W3ewrjr2RjPQY2ev9p2reFGZoz7Am
	Y/5bhafscaMTOBfmf+em4/7Lg=
X-Received: by 2002:a05:622a:41c5:b0:4f1:e2a4:db39 with SMTP id d75a77b69052e-4f1e2a4e0ecmr999811cf.4.1765598500317;
        Fri, 12 Dec 2025 20:01:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB6fsoDzbxK5AIYGHnnqvCIiJWXQuSf+BANSN6Bb11p3TUXgUWgwzIVGKz2HvArPjz2uurUQ==
X-Received: by 2002:a05:622a:41c5:b0:4f1:e2a4:db39 with SMTP id d75a77b69052e-4f1e2a4e0ecmr999371cf.4.1765598499798;
        Fri, 12 Dec 2025 20:01:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f3eeecsm2643794e87.30.2025.12.12.20.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 20:01:39 -0800 (PST)
Date: Sat, 13 Dec 2025 06:01:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: rcg2, msm/dsi: Fix hangs caused by
 register writes while clocks are off
Message-ID: <aeefcr2yynlgnkiocv5eeqs4heaym6bts55z5iziqkysdzzqnt@oz2yau4nqwq7>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfXx7PDFXCPreKu
 GhrjjvN0j5RNWXQNQ+5cEbxN34DD1Lgsddlh3Th+g8ut5iS956b+4bOFqKfIu8CwHWrD5zMyqXJ
 1mM71rDya+dcC1ijKqBwbI4CHzoKpADokSWS1iO09yN0ZnmhvoCYUJKoYbVr6BpywVq4ZmsheHb
 RY0Y+7Iw1gjBnBvXCKwZ+71Q97sRQ8TgmCMsa8rlV1OL7/g53n5irz7jAjH3nf7GAE0q8yht3Lj
 YF76EgY+8RszdUib8iqCQwWomKsLGuYqWJcCF2aVLSJJsJr1vh+N1XN5vt59tfMEKg0GLoEVhrd
 SZy6iuLirtUiyaLXKZKtMQuCJ6HpG0W+feYMDAF/JkxaiKYTuWtQmbDYCWlojucqbtF4nbHQvq5
 e+D1pwWlVWPD7SkxKJ+m4NXnPB9aOQ==
X-Proofpoint-GUID: zkbJ9dWxUm9hVLbrlvO-fsOGkvUlEL-e
X-Proofpoint-ORIG-GUID: zkbJ9dWxUm9hVLbrlvO-fsOGkvUlEL-e
X-Authority-Analysis: v=2.4 cv=cObtc1eN c=1 sm=1 tr=0 ts=693ce525 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=P0BQ7NvINjiI-4SoFKYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130030

On Sat, Dec 13, 2025 at 12:08:17AM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> This patch fixes system hangs that occur when RCG2 and DSI code paths
> perform register accesses while the associated clocks or power domains
> are disabled.

In general this should not be happening. Do you have a description of
the corresponding code path?

> 
> For the Qualcomm RCG2 clock driver, updating M/N/D registers while the
> clock is gated can cause the hardware to lock up. Avoid toggling the
> update bit when the clock is disabled and instead write the configuration
> directly.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/clk/qcom/clk-rcg2.c        | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++++++
>  2 files changed, 31 insertions(+)

This needs to be split into two patches.

> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index e18cb8807d735..a18d2b9319670 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1182,6 +1182,24 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
>  		f.m = frac->num;
>  		f.n = frac->den;
>  
> +		/*
> +		 * If clock is disabled, update the M, N and D registers and
> +		 * don't hit the update bit.
> +		 */
> +		if (!clk_hw_is_enabled(hw)) {
> +			int ret;
> +
> +			ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
> +			if (ret)
> +				return ret;
> +
> +			ret = __clk_rcg2_configure(rcg, &f, &cfg);
> +			if (ret)
> +				return ret;
> +
> +			return regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
> +		}
> +
>  		return clk_rcg2_configure(rcg, &f);
>  	}
>  	return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e0de545d40775..374ed966e960b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -762,6 +762,12 @@ dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
>  
>  static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>  {
> +	/* Check if we're already powered off before writing registers */
> +	if (!msm_host->power_on) {
> +		pr_info("DSI CTRL: Skipping register write - host already powered off\n");

It definitely should be dev_something. Probably dev_warn().

> +		return;
> +	}
> +
>  	dsi_write(msm_host, REG_DSI_CTRL, 0);
>  }
>  
> @@ -2489,6 +2495,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +	int ret;
> +

Extra empty line

>  
>  	mutex_lock(&msm_host->dev_mutex);
>  	if (!msm_host->power_on) {
> @@ -2496,6 +2504,11 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  		goto unlock_ret;
>  	}
>  
> +	/* Ensure clocks are enabled before register access */

And this looks like yet another fix, prompting for a separate commmit.

> +	ret = pm_runtime_get_sync(&msm_host->pdev->dev);
> +	if (ret < 0)
> +		pm_runtime_put_noidle(&msm_host->pdev->dev);

pm_runtime_resume_and_get()

Also, where is a corresponding put() ? We are leaking the runtime PM
counter otherwise.

> +
>  	dsi_ctrl_disable(msm_host);
>  
>  	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
