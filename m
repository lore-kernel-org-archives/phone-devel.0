Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C542EC0B0
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 07:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249245; cv=none; b=VbS36Z+yRTxAwtK0UaUuV/9HEmBErADEsSPqbYeDATREnHFPcW+BBP6drXr1ZDar1st/r98d7Yizjw20UdXZnD7BSfVzX5ipnc1G699326MVC7rk5I5Sskypf41sH1D6YeGt1lRCqvrz5TcmERDLHrTMuNH/tWFMY+C4KifPMDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249245; c=relaxed/simple;
	bh=QzPg96JUKcoV+G0GJYur1F5fpQ4F40I8Dl2VKqYRUvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHmLOsG51oLmogh3JTsENdFH0SzwHTDhRK/GFRxsSr1lP4NCJS/WFzY4GXYM09sW3H1fuQ8JESq30cyJIaBnpNj4UDOAzUq+66J61GzLTLCbyEkSlR3lpK6zLiR66fMKHxdBGdIcQOthzZgSoFyN3GD0tKbZAIeW+CwXApkl+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFXSBxlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hK8v0mbE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFXSBxlQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hK8v0mbE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39cBQ2411606
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 07:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I51ADhbIT21j/GY52vCSJ5Ih
	2eKhqau6635b3E1NSKM=; b=NFXSBxlQ1/5yZiO4SKHU11IOnCC+3iqBkbfpu1Gy
	pY8qgg++FF9AVr+Na1UqBdaCcJThMH1W3CudVzKXQIZCbcs9LAYFtpIWbbwzh4Dq
	Qaeu2JUYgkemkXPiFV6Cq/pDWWnPDT9psE8fNakgEK7yZ1uS6NWbaf1tPsYzJ/kG
	GUjAMVs6hiMMs2xvkXZ1OGFOHaGxZEAAK/E5+9xAmmwmgIW1Oltg590eyyEGirly
	Y7CftkV5vfusFH4m1E4XDCvJaW5rZosEMlFJ4JomdTM7eTvgj8zE7ND22pUTDf0H
	AeUHnAAdAqnsyryGgOXgo7b0Ez0uDmvOAqgzCAZh7AKp3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165aj54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 07:27:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so12069471cf.3
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249242; x=1781854042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I51ADhbIT21j/GY52vCSJ5Ih2eKhqau6635b3E1NSKM=;
        b=hK8v0mbEunvaB1BX7fG2zxzHOObOI5P4EruRdn1lgDBeyfNMJsLCmtasm7jxgqBitr
         e4rZNdXdQAB0YuO1ErCHLT8TLnAfnvmvaNSGSMJLK/Vf8nteSi4aR2hK1W2cfiPhaGUN
         QMLDotbL8G5sIeF9kaFM/k23fac62b8EGZuDUUxg0iLSI2bSqKWvAD5UXndK1R0TPG1s
         0gBcTxBYTRw+DuQK0prVY5tKZtJ80xfbR2KkwUTOFFQAJrhTNX0N+KznDzKj1yyS1ms6
         GA4q70Pvjg2hXoe2v8CH7CVvQvMFlxKLL4o6scEB2EheXuK0BbsqhUb8zELZQp0vuPQH
         UmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249242; x=1781854042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I51ADhbIT21j/GY52vCSJ5Ih2eKhqau6635b3E1NSKM=;
        b=U9ip/09iN87uv2atSppkHr7y2N/hPg31nnRv4TyjszAb48Si0Y4i0HnoyAg4tQOqAZ
         fPEDcYH6U4Y6+JVYWyCm9uHJaJlKyZ0D/w6s85hzjb9PYpJjhAs2a4hzQmC3uWinf1CO
         bXy8U55vjrdN6JWQnqCrUthJwtCRJWMu5cLubrnqqYi4ooVEaGRVKQ+ypwxcLxWg7K0v
         ORp/oJuDT85b45Qve+vbyGnbmnNH4tKyfYMNEZFVM7NHz70Bjzmphy82vtLUGjNQzfgD
         GlJjL6mPiDF6GEKBhxBCPC43CY/+Q2n3GDcAF7NqL0r2lEmU4zEBnucohKAOp9uXsHbG
         W7Mg==
X-Forwarded-Encrypted: i=1; AFNElJ9jvDJJoTILYXhPyN3WNtm2c92J1rDtOxSt4nDal0k/5w+4a7tcQ1p1IsqwyPkskF+mlPIzOfr/I2ZfGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vhRXyz7ZndMMrLKN9IuyKuQS/YWrfZseiABgsJ9GXl77paCe
	Tb5j3582UffPWllEuRVBNBkNmBqHAhXMA4sT7Xtbaa+7djdRwjueNH8cjq66uwTcWhFCSsRUXIA
	uFsnHfw1YNzPv3iKV3M2Te9DsFXl1Z+X2ZVodS+15Taey0zoHShRKKdiyiCBIo/UKXw==
X-Gm-Gg: Acq92OFQhkM2BD5a9AouqbKiiWECjSa7rzF/oM/GrlVp3tGwo6K0gEe3dqRKnwLMIsN
	tKNf4Amw5ZDvqMfSBQIJakob83686nBSiZF7qz1PKTRi7m+cxtahg1dWJ5uYKrAJy+PLmFXk8+F
	Z/svM+zwSkyfpWHVFGUXdkl6goOgqAil1cwnGXMvCNbxIoErGY+t//8P4bdXvdy1TnN38JQdVO3
	3yfoEA29lD6c9SWamAU5dc09U6V0RBeMFQN1GJDhnVPSBjHO7QkQCGL2iYXq6BPfu8A81h6AcD1
	fr4iukp3dOtgpLTHPw0SfLU9ej2ZITlKP+37b4TePaeOEHjOBWUJxVVsXlrRQNFOH4api/a/1XN
	n2t1UxxcN0+Ip/vVKCX7kzX8RzqtuOkV5GGJ7MTeIp6VnbKv4jlA/5ESBVD8cc7lOVH6hG6i1v1
	uzza5B0BrOQYPw8yOLTx4A4HcBT7giaSPofdU=
X-Received: by 2002:a05:622a:5b0c:b0:517:7f42:76ed with SMTP id d75a77b69052e-517fe1ddb42mr18061311cf.12.1781249242597;
        Fri, 12 Jun 2026 00:27:22 -0700 (PDT)
X-Received: by 2002:a05:622a:5b0c:b0:517:7f42:76ed with SMTP id d75a77b69052e-517fe1ddb42mr18060981cf.12.1781249242137;
        Fri, 12 Jun 2026 00:27:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7362sm295468e87.43.2026.06.12.00.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:27:20 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:27:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/mdp4: keep inherited display clocks enabled
 until modeset
Message-ID: <qkfhs5r53wmuolrddkywqqhqfokbzh3p6fxbmctuipz6fjl5ue@otwtwvisrjwj>
References: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
 <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-2-22925600e4f2@alex-min.fr>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-2-22925600e4f2@alex-min.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfX7loj1ZF43M/7
 po7Bq6mdIJtlKb4dGuC+IiZKA4bm6YVEnUwHy9Bq//PZY5uQ+oLRcnXpC3QG94hU9i9ohNCNjfa
 ODANUe2FhaYeQnm/lpRaO3OlH+7nS+qkbQey4t+gviQk7u443T7lMkSxx8lJ/QyhirepRON0ydZ
 bJ11/SWqNC8SReCgeEA1evYOF87o4I5rpolme7h5nn+6FnWuXEGSgiNXsO58+l4zQcTYnMeebt1
 UIJa2cgRD1xuNZewwa5oHMWhp/LqooWo8Mmvhm+gnOU0JnVutW6C+oFANpWJdS9AHEHse9jJlL+
 5t76ecgS3pNv7tTjC2UwfVbIhsHO8Zf+AQgqSPFGlS/yI4y1IshE3C1WzPnEWlXwGcWa2PUw4y3
 bFTkVyRbTTDSK0805t9FvX5BjwEP5HfWjmwqH2or8/zcTa611OX6F+zgILTxFtPcGR71gtqDZqn
 LSVqmslf9tPN+TFLwRA==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bb4db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VM_FTtwWbEzbSf99l9kA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: N0kuxda50Cx0x_1iOpG7yGow2xH3_Px7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfXzmuhtetoA6zA
 IdR2emIZE8gu+RboicZmYH9NPYl5fwBJUl2ajnc/TNUEF8980190o2tWils5KnHQ3K78PCHc+bZ
 cfytn+QsngBIGGExRXihdCZPrTlWb8w=
X-Proofpoint-GUID: N0kuxda50Cx0x_1iOpG7yGow2xH3_Px7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120065

On Thu, Jun 11, 2026 at 08:07:47AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Some devices boot with the MDP4 display pipeline already enabled by
> firmware. On the Samsung Galaxy S4, disabling clocks used by that
> inherited pipeline before DRM takes over can leave the panel showing a
> blue screen.
> 
> Keep the required display clocks prepared when an inherited
> DSI/LCDC/DTV enable state is detected, and drop the extra clock
> references on the first DRM CRTC enable. At that point the driver owns
> the display pipeline.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  1 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 66 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  2 +
>  3 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> index 9e53c9d956ca..0aeefd48be1f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -297,6 +297,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc *crtc,
>  
>  	mdp4_enable(mdp4_kms);
>  	mdp4_crtc_bus_get(mdp4_kms);
> +	mdp4_inherited_display_clocks_put(mdp4_kms);
>  
>  	/* Restore vblank irq handling after power is enabled */
>  	drm_crtc_vblank_on(crtc);
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 4c60b49fb784..1264ce7e8459 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -151,6 +151,58 @@ void mdp4_crtc_bus_put(struct mdp4_kms *mdp4_kms)
>  	mutex_unlock(&mdp4_kms->clock_lock);
>  }
>  
> +static bool mdp4_has_inherited_display_state(struct mdp4_kms *mdp4_kms)
> +{
> +	return mdp4_read(mdp4_kms, REG_MDP4_DSI_ENABLE) ||
> +	       mdp4_read(mdp4_kms, REG_MDP4_LCDC_ENABLE) ||
> +	       mdp4_read(mdp4_kms, REG_MDP4_DTV_ENABLE);
> +}
> +
> +/*
> + * If firmware left MDP4 scanout enabled, preserve the core/LUT clocks until
> + * the first DRM CRTC enable takes ownership of the display pipeline.
> + */
> +static void mdp4_inherited_display_clocks_get(struct mdp4_kms *mdp4_kms)
> +{
> +	bool inherited_display;
> +
> +	mutex_lock(&mdp4_kms->clock_lock);

Please use guard(mutex)(...);

> +
> +	clk_prepare_enable(mdp4_kms->clk);
> +	clk_prepare_enable(mdp4_kms->pclk);
> +	clk_prepare_enable(mdp4_kms->lut_clk);
> +	clk_prepare_enable(mdp4_kms->axi_clk);
> +
> @@ -594,7 +652,13 @@ static int mdp4_probe(struct platform_device *pdev)
>  	if (IS_ERR(mdp4_kms->lut_clk))
>  		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
>  
> -	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
> +	mdp4_inherited_display_clocks_get(mdp4_kms);
> +
> +	ret = msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
> +	if (ret)
> +		mdp4_inherited_display_clocks_put(mdp4_kms);
> +
> +	return ret;
>  }
>  
>  static void mdp4_remove(struct platform_device *pdev)

The clocks should also be put in the mdp4_remove() path.


-- 
With best wishes
Dmitry
