Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665CD3DCD9D
	for <phone-devel@vger.kernel.org>; Wed, 20 May 2026 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281156; cv=none; b=dKMOlExb7PsJh5nq/nZl+Pkzn9CjyqIw2V8USMrKOEugnUqXM+DwS6h6i2hSVKDt0JgWky43BlwkpPbbje3MkltCkZd3k7jQ3FpzfFCWveMt3vBjqNV7vapHTzXgcgIyxs/UAKS2OvJ07K70lnbML57fvOPNPCQ92CuLNpije3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281156; c=relaxed/simple;
	bh=cLaTmSKhZdE69LzIgcez/DsGhTPNYNcrI9RL0CruJ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZzlzNROH1hWXFzwchjEZgK9+kMoyeX6v5CTrrCulcymdoExW6ZjG4Ae3aMgX9h/8efeia3X8EZiHP1EX41QfPgVOBaU96lbIL7yH2IPbZYKnKbVYqRTeFfe+gu6ud+8+PwsRhc2QBGlw67wbQ4JWKScqEhK4jTHRFU5qECCKw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJKrYH+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmZBGr9h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJKrYH+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmZBGr9h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZZOA3085008
	for <phone-devel@vger.kernel.org>; Wed, 20 May 2026 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cIZhTAzDt9+wu0W7bhluPXYB
	8tTK/ULqj6C6vI+4RFM=; b=bJKrYH+HZjulNKG2nXTbJFE5pY6emoCZ1RcOpXoq
	HXkHQ92QHj6os7+z3O3bpOMY7W7DN2TN5b5UPzpda9mZLuAS27CGgatIBNS2zqju
	GsocGnD0zr81EiY6gImdXecz/ASrZh+Q3KJ9MYSQV40m+CKba1NEfY1Fx6Jn581i
	BYMdzKMfiHVX9JzdXNuPq1z/nwOHC+dN7T1UsVomfbWvcM4TXyC2IkNZx7A2OYnP
	6Vn2mIf0a/P+mKl4lUz3haD9lB4nJTzamlD4g9W4XrBsOExzMLvlxG21UUkpqZHF
	m4pVbaO/Vee4X9P4PzNse/kXjwj8uGr2KEg3Nh0ZaIqU9g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f07s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 20 May 2026 12:45:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5756024c77eso11171380e0c.2
        for <phone-devel@vger.kernel.org>; Wed, 20 May 2026 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779281152; x=1779885952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=ZmZBGr9hCRJ8sHrQXwQEA8zcRy6siYS3ekwjNd89jFYGQGQ0mErIzDfrT6bMOd+nub
         H7xBMJWPk1N897u5c1mLablto7GcrfYuIoUs/5yD1pPnQfpzprlZT+OKRRzizFsxbgZw
         DHb78CULZD60IDJ+hNWpjJGLN9UWn4fdbyoDLtgNpAd8fS5aNuv1GRKDUxBVP77beY3h
         ytxmwU83Lzh4x6V7Y77/Sy4qs9i6sBXtwjT6D+JsEZOVGuvoObbpTSWNlQrfGjeP7d5e
         HH+6IHRJ97G1ClIhdZOFWsvteyJFaM1DH17duzBazSHU8PZhGhLeo7IvhP8cTMGo9AOp
         DJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281152; x=1779885952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=F+L+tsYPMOhuN+z/2DKFJWekbQFyrbcAfJXuxRzYTUJetjgMOvBq1tLn/wszSsWjzB
         mdVXN3AQ7RA7nmUUQFVdntIgt8YRwGcmfpNuOz3LcRv4XLm05XNCX1/bXNQMbrRxP4Dp
         mI9h3SlxzLoFowrc7xYQCLDilC6ImDYkuJ2lSOg82mbG1cG22J763+MCVgVHqrD9pceN
         Pwte++35XV2MHZAPrsit5XObnJbSELmSd+90nI4iRrY+0dB5GA1HV63OytmJhtJmJt82
         RV+Mp9AHWU1q0rWQe+i9teagGQGyaGpRKk8n+NJcoSRUzKdNe4UJDPU32wdq7q2g7vZg
         HV+g==
X-Forwarded-Encrypted: i=1; AFNElJ+Lb+Rvl4NfyKvjFc2IHX2viLIP265q9GVBAEXcjG3kq+VxJSfKyGxNG2CxAIoFl94HO0n5w60uAktU2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYEjiqLVKvMmKwRou+mI8uW7IT79S1IHF1NW4npJMBZ/F47Z1
	AFBXRHHRNXnqpItIWt2fytpwCjveFM/jE853J9mjBDXGxI7xz9UB0Y+yv3yoCbmKnDV3jNfhNzP
	rWOSdxR4l/1/hOvjpO13GxnMHc6On2RcM9s59BgH1exRCgCyIyzB2baZS3qqXOxQS3A==
X-Gm-Gg: Acq92OEythV755Hot8Zszhln6cj+VefdKMgwJEy2JxwrMmXqii2OeDjcoFjUrUGijjK
	gIJoRwHUpbHoirxgAT6cCSmJ1Sqi/1trWfddCl963yyaOv/05xdpM6yzLhBiQY5qguexR/vfuMx
	ATRhfiEg+BEIg2viPlTUm+wMuvFkesCulhLFKUDgTNfVWr0Akff71NXASnparsMek6QYKxrb9y/
	mck5bxA5kZ38+tTqyAIogkBcxX6k95S47SX+vPdtJGe+pWq8wdRi+hB0WZjf7iegH+cRjkwYVio
	qUJMzLzkgLWpOt61I4wEZNvgAauV6hf2V/FkslrqkJ/tCW4acCIr5TJvCmm0eOak/QN/tqajZqP
	/KWsndaekHbk5ItKRk0oDxpWZdZ/0bh90mR3ENdYaTLIxRXT8dS3XilbgmghMvc88PR7Qlud1ak
	6pPt4i5LHcYhOUIwJBfcnG4X9XzoHR99Md7lM=
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283713e0c.9.1779281152524;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283671e0c.9.1779281152095;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5712sm4836341e87.59.2026.05.20.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:45:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:45:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
Message-ID: <mvlslbtufxodehvqqcmhihtchct3tegjbfjl2nmt3bh3fczdze@4fnrrtm2njlv>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dad01 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=FYQP979REZT08Aj4asUA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: R_Vg1pPr4JbvOCkYQy7OUm5j92HVxyZt
X-Proofpoint-ORIG-GUID: R_Vg1pPr4JbvOCkYQy7OUm5j92HVxyZt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMyBTYWx0ZWRfX+ncMRV1boQAq
 G2DKf2z+Jznde5IITUVhI7ATDPfvYvG/REIshTHssuRCrysa0+zFEyQ31bDaLg9HvCtQDJ+v5C/
 yQKqr9m/O+LESmZOY3McbjrbIH3q2/CNsMpkVnlVnOY12eeGP/axIpDJgcZR3na8QnrLglaJtDm
 hREXlzsZ2QME0U6Ry+/6TLgHW8Psn7DQ0hoRa9aLfZWHNS69dJNkwTFJEcH0TVSuTqAM9c76p9l
 zt1fW3XfvZw+NGAXY0hF895wwLbjyUy7/K6Txvu+UsYmU+nZ4Z/O0u4GUWJSndYL7JEnGD79OFI
 GY0T0WKXeZaNN5pRanAj07MTKL62UkvxcOr0koOHXVUVH3JiZcZ1ZueTQ+fAWc7seWo6r4oUp5w
 ezKY4f88KKn0CSuXJJSXMWzZtdDEDsLu/IepVN1z53r84Ww8zDXMBub4HIieKdF7wHj2UpZmMTn
 +vfmfyTqkhu1dX/KDoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200123

On Tue, May 19, 2026 at 06:10:50PM +0300, Erikas Bitovtas wrote:
> Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
> them from loading.

This should be squashed in the previous commit. Otherwise the codec list
will be broken between these two commits.

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index a87e8afb23df..3baa6bb4968f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
>  	.vmem_addr = 0,
>  	.dma_mask = 0xddc00000 - 1,
>  	.fwname = "qcom/venus-1.8/venus.mbn",
> +	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
> +	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
>  	.dec_nodename = "video-decoder",
>  	.enc_nodename = "video-encoder",
>  };
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry
