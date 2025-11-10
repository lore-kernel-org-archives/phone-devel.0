Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137AE26657D
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790334; cv=none; b=VXHe+SMJGyejMLmuyd7aH40XvQ0/yxm424p/g+x8zRJl+xdsKKd43Dt5GuKpX8Kkpy811AqrvseexiXQk9c6I3qf6prDnQ0c+Yuwji/wcpmY3Xa1iUpybKAEpFElhhQ1oYtrPHz6bqtu6FvJpxOR4x4W7Mwx1Wt3TExf9Bcx4eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790334; c=relaxed/simple;
	bh=QDDX2DA6fHm4ELtkSv88cWLg+c3haBcu7aRJJAPg5+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fH+o3AxMhgEPjqOBe8iOmrvtmiDZbu2W0/zYugEyGM+hVOX44rLaiHKdgB7jaJHRMbCg5GWpQfsrYkFQEzjAG3kB/xZNGriWZE1r71V2RaEvwCNgbEU/Q6qt8W/YL9kii33jhLe/qs/MXzHzChVcOew9jnLmHHpUzHVNDSI6nBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpE82+7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHJT7SIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpE82+7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHJT7SIo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9Ejhq2992485
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vLXvSvdzIuLRXS7nXEZVCb3O
	YqcNIx8WojewEu7d1PA=; b=ZpE82+7yefLfNP2tTB+GFaWzfkHt+pbzN0SzT+kA
	43wtNUyZgBhyPB6DMdexUUkrTLuReqOvo6LP4+qXLO+GbHtEyS4GOS/mrbRY7HlD
	NCycR/wPxeL8pPwM4VPlE9vg00Cnk/fLFVNE2kNDJ3auAPOjPIO5Mfd6mpuE8QYJ
	biSvi0sn1tnXl7mYsipsPklT7+MPLogSleDCZA1Zci48qLMhdTSsAe2nd8R4MVh7
	fMRhWyddmfE2h6Rc8uAyZHYmZEAr4wombQ6/RcGHlsij+QUQ0ZhfgutnCY3y6ebI
	iFYDZIZqNwnnK7J96d2oWsul7fiEtv00ii6J11LY3Mge1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88s61x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:58:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edae6297a2so10102621cf.3
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 07:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762790331; x=1763395131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vLXvSvdzIuLRXS7nXEZVCb3OYqcNIx8WojewEu7d1PA=;
        b=PHJT7SIoKa2f//8n+1SHJ2xrb1kUc2P+XnZBn4dmrGPxhBAdKJltbaboCflRyI6M63
         j+u0ivPd5tCXL+Uy4HlYiZapZTR3U7+AJpxXP8Q9Q3ZyZaxXlw2u7lns/FKl1dpM46tB
         I3Lk6Pn4b7+85jVt/CCRPZfKROPn0GMovdX5fI/1oiePYAAlaZ/kVQdwn4wAucQdwZNA
         vKYxHpR4kNq25heJFMF0dTS2Hxo5+6zGhoe/WuDcJ6U0pCFV14MTZa4iTpdizLCHZvhc
         Bj+kmXFTw01pd9qAdDyS8p/3l8NUz1x5WfYvVbKbx6AnrFh2iWptg8Db2WX33IlDuHEA
         ovQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790331; x=1763395131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLXvSvdzIuLRXS7nXEZVCb3OYqcNIx8WojewEu7d1PA=;
        b=rh96B6xxvKLSdN58h9hJYZc8cK6WypF59pN7A0S+QrPLAcGApIj4gWsJOUU6NyQFxR
         Ka/ICSVLCkJgdh2039AZkCeqdByd6prorMyu4u0dsJ/KpHS3G5YSWSJwJ06hsI7FDkGi
         Fzk1NlY7O+9WiVF03Hxz8GO7q3lzRchf7j6w8Ef83UhOuiSpZOgi7jlBWqQRJNjoeaQh
         ObcfyDbYATLhRLHJwxUvwLLTx/E/axqUKDdvx/38qLuU+EMfDCYfK9oRL2lvcCycnOdb
         wSXApt6HOXzRh/yFGUtPDlDk43RmuJ7BhOsyw49uEgGihgoYSHHbCcPZ+CwYxrqkeOCO
         ntSg==
X-Forwarded-Encrypted: i=1; AJvYcCWLp/M/3gaS0vHdRzFDhbh99oXQscDbChKeuhY5l+ZWDidHcaUvozgya9VYWq3cVgN++m0Q6Ra01Ye8EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTTha2nz+vKgfxaome+Sy88fMOVhsgiAiGme/JUcsm50i9JkPQ
	La1UPD0ScCma92JAZyJrYjzTClIup1sJXGOgoxwu1p8Y/L0XnAMyGqGUOg/XDCMVF0fF1EIA56M
	gRQpkdYK59lm0UyiKYbl+C4YyyVONcEVT66ZlkZzFnJQdaJzNoYXtEm2kgG4VwzoSTA==
X-Gm-Gg: ASbGncs6y2lzay8/Slb05MQqzmr52lVVedqIN+KatiVHLSrzZmtwaw9VQXISPwYDXlT
	jZHiYmpDb929nzrIVxVrTdnvRVYJ8Dovr97bMz3Cw7bfgrzZUsUdhihtkhxASgZ/o/3Jak56vpv
	/yGyiwgAS6do+VcwHvZoH6fuwyeZTA8YbDTlsFPQS+8GwzgvUPXJHxubFBMHE0MFrCcUrmGEOul
	bptIyTeIYSTmFj6eQ/LEqvaab/Q0OZJHTnjTZ00Jh5iQh/hX2eemN2vqU1an2nWsCL/wc3QL4U+
	P+UJB5XT5eZ0fdQeVOZ3n1j7UpWkKvYqOipD2olU4B3fIspZSsHT0WC0Gl/J4W7L0kKTQKq0tXW
	HTS9LhR2dV2UxT4T00ZVBopU9HrcB9twb4qQj/3zmwFpcK+PfkO7xsom3GPI2/dCzJ7sOqvMuK3
	AF7xBsEHguQZ1n
X-Received: by 2002:a05:622a:1446:b0:4e8:a97a:475 with SMTP id d75a77b69052e-4eda4ff22cdmr113143021cf.79.1762790331265;
        Mon, 10 Nov 2025 07:58:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERvz/5tzN3fzzFof150ow0CPkMngjJVvCc1HpPWCZ4P2NqMVrHjzZly5tI/ZePmcV7OvSq8g==
X-Received: by 2002:a05:622a:1446:b0:4e8:a97a:475 with SMTP id d75a77b69052e-4eda4ff22cdmr113142801cf.79.1762790330852;
        Mon, 10 Nov 2025 07:58:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a5a0d0asm4077997e87.111.2025.11.10.07.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:58:50 -0800 (PST)
Date: Mon, 10 Nov 2025 17:58:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dylan Van Assche <me@dylanvanassche.be>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 ath10k calibration variant
Message-ID: <bxuhdnfapc3nl5kmvvk2czwxhyrzaxunw2hmccvzoutk2xkj6d@sgfb5tgyxyy4>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
 <20251110-sdm845-calibration-variants-v1-2-2c536ada77c2@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-sdm845-calibration-variants-v1-2-2c536ada77c2@ixit.cz>
X-Proofpoint-GUID: yfJgo77C5HOt6orEDDlc89_X4tx7H4pr
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=69120bbc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VnAOb1fkWFh9DQKIKVgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNSBTYWx0ZWRfX8Ts4vKTnM0rN
 LEw1HJhfI7HuYbhAAbkFSq/ZiWR5wAPmldwOQSQgXV0nCEvMMnA2SSfNzQuwksVPZqpdTXeQOS0
 KGNyfsAP5NGMAH2c/Lk0u9RGKk/9XU60oX1KuIfKzarMpxozwg575F0omh6IydquYTXhxcHCH0L
 9+7Xo55T1XSAfkFH5ctxMw1ut1HVJTUly13YMrWBLrGlSO8WYaPPx2MmfqK78X9ijD2/dv8rbZe
 5x2mZu3H8K+0sjArfCEEGs2Tg2tZyQw6NDGTnKUaku0xgntdI/5rUxgKLpQB1nx2uAKSiY+Oy59
 4TkU/7oeqWylcesvNIWnctPzCGBxTKAK9A9yvNG44Jba54GiO7G68Z1zfokbGqh9y60oW/uJNiK
 xpl3KSi2eZiIwcfwCx7tG8j+XQ9FjQ==
X-Proofpoint-ORIG-GUID: yfJgo77C5HOt6orEDDlc89_X4tx7H4pr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100135

On Mon, Nov 10, 2025 at 04:37:47PM +0100, David Heidelberg via B4 Relay wrote:
> From: Dylan Van Assche <me@dylanvanassche.be>
> 
> SDM845-based Xiaomi POCOPHONE F1 has its own calibration files
> for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
> Add the calibration variant name to the DTS to reflect this to
> allow using the calibration files from linux-firmware.
> 
> [David] Adjust the compatible as ath10k-calibration-variant is deprecated
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
