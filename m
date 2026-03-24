Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44DB3783C8
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391029; cv=none; b=AVk63TYsiFuemF1HdWlD9s1SQWY6DmTpwLN+VfqFFu9jwQA+pV52bOkHaKEfOcRQv2rzKVpI6vt1mulVoom/kj3UAPDbIF31nxjcUBkT2IMWk2vEn+B7l1R6hirEl5zvm4YUCFvKkkhVHOghO6b9hN/Mxlr1Vq9XfrbfAO7zLmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391029; c=relaxed/simple;
	bh=tTd9Bcm4dRUb/TDRIRWy9N+UwKZKAqRQMB81nWckh/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhJBBMOkEqgliz2y86f4Rs75n7S8Wk0lBn4BN1J2G423BiEjmlGI3jtX0bbNmudcJlLFFf/gkI3pbXHjfGcrAInUvDlqU1ds7ecpwlsPTWMY96OgACOqQJj1FvfoHlktk3l1/yK1vjLzrd1+PORKC2aKuND6PoV6N2/N7nHl00I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lefrrx5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E63DiY3Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lefrrx5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E63DiY3Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJDkXU3984539
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=muukZ0ujq8zIYdW2/HKF4qMN
	qjDQqhCAwg9wK00NHdU=; b=Lefrrx5WMjyH06WHXhpGOi+s90l1cOwbEzD4RbRB
	K4dCEc4LS3/6gYoFQV+QXIYXHCNYkGWW3UzHt113JlWHOymk8tbgrWfZtmqEPC8C
	ieGFvcDbc8ZqHPjANlyBPaj494s02u8ceKBpLI8b3qKa2F/qR7PapTclQI80Advh
	1fxmRJvGZLrhgOxt6hqeDFWSShwLSFNM+l9yo4TdPlkC3zLV6jFvNOtGElXaCq0m
	/A7DWJ5runLhyNuuDzUaUYwUbBy4xHcB+qln3IKrpbnA8Zp6R2eIOZtXOpplnnOY
	siZ7fCz5XqCu2hZUIez/srIfQgeNkISsNB8huqomAYluQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p8338hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 22:23:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so85475811cf.3
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 15:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391027; x=1774995827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=muukZ0ujq8zIYdW2/HKF4qMNqjDQqhCAwg9wK00NHdU=;
        b=E63DiY3ZPtH2hEuk+rzVzdDKSb6MYlo+ppXBt9jIK3A/RljBdJ6xmAMxQGCBYz12Lg
         Nj4/hUhoUOKEsavnaxxshLd916HCnGCOIFZAz5Hx5naLn6DVjEZJbz+Y+QBvl6Fw0eyf
         WCp6biFKCsSUHF9cknBQ0I2S4ByJU8h8fSea36RcEUFHH/5LydfqyzJRIjYxPUhW4rpH
         eiraG7ALz6+rvEGpLqzurRE4cVgmuauSUlEh6P8CT9mG+5SPO1hW/tSneN7YlAX6ORm2
         64sA1IsP5biOjn5M18cp7zCENftDZ9itbGxBppmEmpwX4Ln7Yj1+5GbdQ00sS8YkAz7T
         r2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391027; x=1774995827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muukZ0ujq8zIYdW2/HKF4qMNqjDQqhCAwg9wK00NHdU=;
        b=VfWkBTRY5QP1M+t6bueSypImZIITcOdfrQMtC8MTUreS0A+AGjvpAP+35usvLrXV2O
         uKDPSlI7u62/iqpEbnRXkn4DGVvGJqJZ+KLG0+glPWn8o8ndKhUx3E52xBI7qYsqmQoI
         B74gQXZRVlC5Si5i/vfNAmHtXOpttUihjJTRUEbwc6AMtjhECcoS6ivsRgdzIMAnEt6T
         jXnFnqsn37VaXeSry9H1iFTAwbfxMbjwSAau4QZQ6imvrpBRkag695D/bHpFenGkT5Ce
         OUD+4N2kXl9nFED9pK8EwTP/9l3oPvg7dsOGNUoCqLv7wru02a5DF9P7dRmJx6m90NdM
         te/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW74f55E1JeSF7tKJx1f2gqCyeTQsomBgIX0oWCmZ2rqbfnV1SNeMudIyP5eXd97p9D+6vC+vxfoxWwJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiwnsExtKsrTXwSPQub6qkaLZ/wU0tDwMk9fddz3WQITWzY5vK
	aJSujE+dATbMEkSnVAkAaRpQxq+Sv/xv+413D/Y3DfLP2IoPAinwBdzn9IiHu6Y1vOO0IFhrZu9
	Te10diRW/e6ki9sSXwDq/If4zhAXozc98pmkFYZj3IPn0ymaJRROOHFGwYIIFtS3YSA==
X-Gm-Gg: ATEYQzxM7Fqttx2Idgtkn/j5SGh9M34sCJ8KRIhmzFw8CzPpS51q5gcDH9n8x6xCFWI
	Rkzr6h4Qq1Cw9hQmdNTtW+MIG4+fL+3WXgGiFAt1I91ym0/mXZ5QJC+k48tyba9/Ur3tC3oMBmm
	Iw2VSppZOecjHtvynSFWTb2ExINZt4sIIItSMA3YVJ3fTMmPDX4irpy9lLMenK8doGHLwVGE3yi
	SPQKVrQSYWvufdQAKxsSRCA4lGOraLN9m/PckvvqW1cblyqJXMwKkJhHoZUA23rWR8EKuFPNF44
	zgY8IAqlvHYfk2bo2UkEEyAWewzDgH6z1C3yqZOdbF+OwzXtdc7oiX/kjet0tk5PxSldHZg0K0F
	g9Wx9m+SAGAa2cuCwlppQkGCvKK82S3QVfos+NGwjP/AlditJyfUWIl8GHYj2e4qMIbhleduyxr
	1kAslJZGkYd/8Xqxwhhy//yKjsdRw+x0UP4N0=
X-Received: by 2002:a05:622a:9db:20b0:50b:5258:28eb with SMTP id d75a77b69052e-50b80cc275cmr17336451cf.3.1774391027012;
        Tue, 24 Mar 2026 15:23:47 -0700 (PDT)
X-Received: by 2002:a05:622a:9db:20b0:50b:5258:28eb with SMTP id d75a77b69052e-50b80cc275cmr17336161cf.3.1774391026607;
        Tue, 24 Mar 2026 15:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c3aa03bccsm5207761fa.17.2026.03.24.15.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:23:44 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:23:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 15/15] arm64: dts: qcom: sdm845-lg-commmon: enable dma
 controllers
Message-ID: <pkzsim6zxfobk7ccvjzc4ypvuoiq6kwm62u5onalp7gy4p2beb@ig4xws6oyjtg>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MiBTYWx0ZWRfX4THHA035Lwej
 oXSi0D3vTB0rE02AuqJ2mfmuzQvcTADJDLeZAKcc+Wz/ny2+65AhovGg8vSHWePOEtdjeIzLGio
 abmFwSMLpx0WUf1xG2Ca5wQXSn9uDyLOOsJWixCuR/RrdatGgjX5IBv+g8awtZM2a8nDFK46ZI7
 7dQxest81IoQ7T8E2DSL6SiZyNwCS5zKGdLcKqQGC8vkYlFZJA3aYp9mBN7g1gwGpjRtjjb5QBd
 4TmQEOk3nmbIYISWEz92/CDnyxoTEr/rp+2HPwcjEQvy423BlK6SkWcuiEycSxb2/GWUd+48g8p
 xPhivfRBBs18YWWevBsZunLfPbfuYetNJzw/v/5HY8SJZe0UvGQUB2Wfat1N7SM0CJjlfZd3+Y5
 gMjmcVwUuMCmNHVB7/3oM41UMTwOR4bLrpih2d4WoAMLQbAaTTXWJrrjhD6eoyk+bz1M37Mfe7Q
 1gxJtFyJxlQzgArlU8Q==
X-Proofpoint-ORIG-GUID: 6KnP-wlYZiMYu9eKJVfG3e8V5AzAw44G
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c30ef4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Gbw9aFdXAAAA:8
 a=nrrofH4WB8OeSbHxBjgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 6KnP-wlYZiMYu9eKJVfG3e8V5AzAw44G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240172

On Mon, Mar 23, 2026 at 07:42:49PM -0700, Paul Sajna wrote:
> The dma controllers are referenced by the geniqups in sdm845.dtsi
> but disabled by default.

THis should probably be squashed into the patch enabling QUPs.

> 
> This was causing issues with the spi touchscreen.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry
